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
//	폰 번호 넘겨서 아이디 찾아오는거에요
	public String get_id_by_phone(String phone) {
		return mybatis.selectOne("Client.get_id_by_phone",phone);
	}
	
	public boolean isClientMember(String id) {
		return mybatis.selectOne("Client.isMember", id);
	}

}
