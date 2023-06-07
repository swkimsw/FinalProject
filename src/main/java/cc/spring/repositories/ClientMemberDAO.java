package cc.spring.repositories;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.ClientMemberDTO;
@Repository
public class ClientMemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public ClientMemberDTO login(ClientMemberDTO dto) {
		System.out.println(dto.getId()+" : "+ dto.getPw());
		return mybatis.selectOne("Client.login",dto);
	}
	
	public boolean isClientMember(String id) {
		return mybatis.selectOne("Client.isMember", id);
	}

}
