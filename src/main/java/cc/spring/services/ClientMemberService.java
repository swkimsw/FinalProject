package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.ClientMemberDTO;
import cc.spring.dto.MemberDTO;
import cc.spring.repositories.ClientMemberDAO;

@Service
public class ClientMemberService {
	@Autowired
	private ClientMemberDAO cdao;
	
	public boolean login(MemberDTO dto){
		return cdao.login(dto);
	}
	public String getIdByPhone(String phone) {
		return cdao.getIdByPhone(phone);
	}
	public boolean isClientMember(String key, String value) {
		return cdao.isClientMember(key, value);
	}
	
	public boolean phoneAndemailDuplication(String key, String value) {
		return cdao.phoneAndemailDuplication(key, value);
	}
	
	public boolean phoneCheck(String phone) {
		return cdao.phoneCheck(phone);
	}
	
	public int insertClient(MemberDTO dto) {
	    return cdao.insertClient(dto);
	}
	
	public int updatePw(MemberDTO dto) {
		return cdao.updatePw(dto);
	}
	
	public MemberDTO selectClientMemberInfo(String id) {
		return cdao.selectClientMemberInfo(id);
	}
	
	public boolean checkPw(String id, String pw) {
		return cdao.checkPw(id, pw);
	}
	
	public int updateMemberInfo(MemberDTO dto) {
		return cdao.updateMemberInfo(dto);
	}
}
