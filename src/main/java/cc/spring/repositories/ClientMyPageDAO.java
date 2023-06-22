package cc.spring.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.MemberDTO;

@Repository
public class ClientMyPageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<BoardFreeDTO> selectCode(int code) {
		System.out.println("아니 왜안되는데?");
		return mybatis.selectList("MyPage.freeBoard",code);
	}
	
	public boolean checkPw(String id, String pw) {
		Map<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return mybatis.selectOne("MyPage.checkPw",param);
	}
	
	public MemberDTO selectClientMemberInfo(String id) {
		return mybatis.selectOne("MyPage.selectClientMemberInfo",id);
	}
}
