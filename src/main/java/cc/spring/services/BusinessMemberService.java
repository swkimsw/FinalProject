package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.BusinessMemberDTO;
import cc.spring.dto.ClientMemberDTO;
import cc.spring.repositories.BusinessMemberDAO;

@Service
public class BusinessMemberService {
	@Autowired
	private BusinessMemberDAO bdao;

	public boolean login(BusinessMemberDTO dto) {
		System.out.println("123123");
		return bdao.login(dto);
	}
	public String getIdByPhone(String phone) {
		System.out.println("아이디값 받아오기 서비스!");
		return bdao.getIdByPhone(phone);
	}
	public boolean isBusinessMember(String key, String value) {
		return bdao.isBusinessMember(key, value);
	}
	
	public boolean phoneCheck(String phone) {
		System.out.println("비지니스 폰체크 서비스");
		return bdao.phoneCheck(phone);
	}
	
	public int insertBusiness(BusinessMemberDTO dto) {
		return bdao.insertBusiness(dto);
	}
	
	public int updatePwBusiness(BusinessMemberDTO dto) {
		return bdao.updatePw(dto);
	}
	
	public BusinessMemberDTO selectBusinessMemberInfo(String id) {
		System.out.println(id);
		return bdao.selectBusinessMemberInfo(id);
	}
}
