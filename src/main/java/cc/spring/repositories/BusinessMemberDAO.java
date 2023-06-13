package cc.spring.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.BusinessMemberDTO;
import cc.spring.dto.ClientMemberDTO;

@Repository
public class BusinessMemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public boolean login(BusinessMemberDTO dto) {
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
	
	public boolean isBusinessMember(String Businessid) {
		return mybatis.selectOne("Business.isMember", Businessid);
	}
	
	public boolean phoneCheck(String phone) {
		return mybatis.selectOne("Business.phoneCheck",phone);
	}
	
	public int insertBusiness(BusinessMemberDTO dto) {
		return mybatis.insert("Business.insert",dto);
	}
	
	public int updatePw(BusinessMemberDTO dto) {
		return mybatis.update("Business.updatePw", dto);
	}
}
