package cc.spring.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.BoardFreeDTO;
import cc.spring.repositories.ClientMyPageDAO;

@Service
public class ClientMyPageService {

	@Autowired
	private ClientMyPageDAO cmdao;
	
	public String MyPageList(String id,int code) {
		System.out.println("아이디 : "+id +"코드 : "+code);
		return cmdao.selectCode(code,id);
	
}
}
