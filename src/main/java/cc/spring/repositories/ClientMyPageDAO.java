package cc.spring.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.ClientMemberDTO;

@Repository
public class ClientMyPageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public String selectCode(int code,String id) {
		return mybatis.selectOne("MyPage.freeboard");
	}
}
