package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.BusinessMemberDTO;
import cc.spring.repositories.BusinessMemberDAO;

@Service
public class BusinessMemberService {
	@Autowired
	private BusinessMemberDAO bdao;

	public boolean login(BusinessMemberDTO dto) {
		System.out.println("123123");
		return bdao.login(dto);
	}
}
