package cc.spring.repositories;


import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.ClientMemberDTO;
import cc.spring.dto.MemberDTO;
@Repository
public class ClientMemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public boolean login(MemberDTO dto) {
		boolean result = mybatis.selectOne("Client.login",dto);
		System.out.println("DAO 리턴결과:"+result);
		return result;
	}
//	폰 번호 넘겨서 아이디 찾아오는거에요
	public String getIdByPhone(String phone) {
		System.out.println("비번바꾸는 DAO");
		return mybatis.selectOne("Client.getIdByPhone",phone);
	}
	
	public boolean isClientMember(String key, String value) {
		Map<String,Object> param = new HashMap<>();
		param.put("key", key);
		param.put("value", value);
		return mybatis.selectOne("Client.isMember",param);
	}
	
	public boolean phoneAndemailDuplication(String key, String value) {
		Map<String,Object> param = new HashMap<>();
		param.put("key", key);
		param.put("value", value);
		return mybatis.selectOne("Client.phoneAndemailDuplication",param);
	}
	
	public boolean phoneCheck(String phone) {
		return mybatis.selectOne("Client.phoneCheck",phone);
	}
	
	public int insertClient(MemberDTO dto) {
		return mybatis.insert("Client.insert",dto);
	}
	
	public int updatePw(MemberDTO dto) {
		return mybatis.update("Client.updatePw", dto);
	}
	
	public MemberDTO selectClientMemberInfo(String id) {
		return mybatis.selectOne("Client.selectClientMemberInfo",id);
	}
	
	public boolean checkPw(String id, String pw) {
		Map<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return mybatis.selectOne("Client.checkPw",param);
	}
	
	public int updateMemberInfo(MemberDTO dto) {
		return mybatis.update("Client.updateMemberInfo",dto);
	}
	
	public int deleteMember(int code) {
		return mybatis.delete("Client.deleteMember",code);
	}

}
