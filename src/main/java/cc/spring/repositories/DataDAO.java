package cc.spring.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.MemberDTO;

@Repository
public class DataDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MemberDTO> clientUserList() {
		return mybatis.selectList("Data.clientUserList");
	}
}
