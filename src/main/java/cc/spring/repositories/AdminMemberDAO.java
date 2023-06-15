package cc.spring.repositories;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.AdminMemberDTO;

@Repository
public class AdminMemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public boolean login(String id, String pw) {
		Map<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return mybatis.selectOne("Admin.login", param);
	}
	
	public AdminMemberDTO selectAdminMemberInfo() {
		return mybatis.selectOne("Admin.selectAdminMemberInfo");
	}
}