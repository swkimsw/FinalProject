package cc.spring.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.MemberDTO;

@Repository
public class BusinessMemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public boolean login(MemberDTO dto) {
		boolean result = mybatis.selectOne("Business.login", dto);
		return result;
	}
//	폰 번호 넘겨서 아이디 찾아오는거에요
	public String getIdByPhone(String phone) {
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
		return mybatis.selectOne("Business.phoneCheck",phone);
	}
	
	public int insertBusiness(MemberDTO dto) {
		mybatis.insert("Business.insert",dto);
		return dto.getCode();

	}
	
	public int updatePw(MemberDTO dto) {
		return mybatis.update("Business.updatePw", dto);
	}
	
	public MemberDTO selectBusinessMemberInfo(String businessId) {
		return mybatis.selectOne("Business.selectBusinessMemberInfo",businessId);
	}
	
	public MemberDTO selectMemberInfoByCode(int code) {
		return mybatis.selectOne("Business.selectMemberInfoByCode", code);
	}
	
	public int updateShippingCompany(MemberDTO dto) {
		return mybatis.update("updateShippingCompany", dto);
	}
	
	public boolean checkPw(String id, String pw) {
		Map<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return mybatis.selectOne("Business.checkPw",param);
	}
	
	public int updateMemberInfo(MemberDTO dto) {
		return mybatis.update("Business.updateMemberInfo",dto);
	}
	
	public boolean checkGroupBuying(int code) {
		return mybatis.selectOne("Business.checkGroupBuying",code);
	}
	
	public int deleteMember(int code) {
		return mybatis.delete("Business.deleteMember",code);
	}

	public String recentVisitBusiness() {
		return mybatis.selectOne("Business.recentVisitBusiness");
	}

}
