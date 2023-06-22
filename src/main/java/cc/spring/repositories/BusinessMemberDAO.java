package cc.spring.repositories;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.MemberDTO;
import cc.spring.dto.TotalMemberDTO;

@Repository
public class BusinessMemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public boolean login(MemberDTO dto) {
		System.out.println(dto.getBusinessId() + " : " + dto.getPw());
		boolean result = mybatis.selectOne("Business.login", dto);
		System.out.println("DAO 리턴결과:" + result);
		return result;
	}
//	폰 번호 넘겨서 아이디 찾아오는거에요
	public String getIdByPhone(String phone) {
		System.out.println("비번바꾸는 DAO");
		return mybatis.selectOne("Business.getIdByPhone",phone);
	}
	
	public boolean isBusinessMember(String key, String value) {
		Map<String,Object> param = new HashMap<>();
		param.put("key", key);
		param.put("value", value);
		return mybatis.selectOne("Business.isMember", param);
	}
	
	public boolean phoneAndemailDuplication(String key, String value) {
		Map<String,Object> param = new HashMap<>();
		param.put("key", key);
		param.put("value", value);
		return mybatis.selectOne("Business.phoneAndemailDuplication", param);
	}
	
	public boolean phoneCheck(String phone) {
		System.out.println("비지니스 폰체크 DAO");
		return mybatis.selectOne("Business.phoneCheck",phone);
	}
	
	public int insertBusiness(MemberDTO dto) {
		return mybatis.insert("Business.insert",dto);

	}
	
	public int updatePw(MemberDTO dto) {
		return mybatis.update("Business.updatePw", dto);
	}
	
	public MemberDTO selectBusinessMemberInfo(String id) {
		System.out.println(id);
		return mybatis.selectOne("Business.selectBusinessMemberInfo",id);
	}
	
	public MemberDTO selectMemberInfoByCode(int code) {
		return mybatis.selectOne("Business.selectMemberInfoByCode", code);
	}
	
	public int updateShippingCompany(MemberDTO dto) {
		return mybatis.update("updateShippingCompany", dto);
	}
}
