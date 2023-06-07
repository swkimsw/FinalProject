package cc.spring.repositories;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.ClientMemberDTO;
@Repository
public class ClientMemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public boolean login(ClientMemberDTO dto) {
		System.out.println(dto.getId()+" : "+ dto.getPw());
		boolean result = mybatis.selectOne("Client.login",dto);
		System.out.println("DAO 리턴결과:"+result);
		return result;
	}
	
	public boolean isClientMember(String id) {
		return mybatis.selectOne("Client.isMember", id);
	}

}
