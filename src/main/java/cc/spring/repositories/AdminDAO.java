package cc.spring.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.MemberDTO;
import cc.spring.dto.gptCountDTO;
import cc.spring.dto.loginCountDTO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public boolean login(String id, String pw) {
		Map<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return mybatis.selectOne("Admin.login", param);
	}
	
	public MemberDTO selectAdminMemberInfo(String id, String pw) {
		Map<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return mybatis.selectOne("Admin.selectAdminMemberInfo",param);
	}
	
	public int selectSuccessMeal() {
		return mybatis.selectOne("Admin.selectSuccessMeal");
	}
	
	public int selectFailMeal() {
		return mybatis.selectOne("Admin.selectFailMeal");
	}
	
	public int selectSuccessBasket() {
		return mybatis.selectOne("Admin.selectSuccessBasket");
	}
	
	public int selectFailBasket() {
		return mybatis.selectOne("Admin.selectFailBasket");
	}
	
	public int selectTotalSuccess() {
		return mybatis.selectOne("Admin.selectTotalSuccess");
	}
	
	public int selectTotalFail() {
		return mybatis.selectOne("Admin.selectTotalFail");
	}
	
	public List<MemberDTO> clientUserList() {
		return mybatis.selectList("Admin.clientUserList");
	}
	public List<MemberDTO> businessUserList() {
		return mybatis.selectList("Admin.businessUserList");
	}
	
	public int insertGptCount(gptCountDTO dto) {
		return mybatis.insert("Admin.insertGptCount", dto);
	}
	
	public int insertloginCount(loginCountDTO dto) {
		return mybatis.insert("Admin.insertLoginCount", dto);
	}
	
	public int updatelogintCount(loginCountDTO dto) {
		return mybatis.update("Admin.updateLoginCount", dto);
	}
}