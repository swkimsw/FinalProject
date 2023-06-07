package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.ClientMemberDTO;
import cc.spring.repositories.ClientMemberDAO;
import cc.spring.repositories.ShopDAO;

@Service
public class MemberService {
	@Autowired
	private ClientMemberDAO CDAO;
public ClientMemberDTO login(ClientMemberDTO dto){
	System.out.println("123123");
	return CDAO.login(dto);
}
}
