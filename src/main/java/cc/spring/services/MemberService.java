package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.ClientMemberDTO;
import cc.spring.repositories.ClientMemberDAO;

@Service
public class MemberService {
	
	@Autowired
	private ClientMemberDAO CDAO;
	
public boolean login(ClientMemberDTO dto){
	System.out.println("여기는 서비스 123123");
	return CDAO.login(dto);
}
}
