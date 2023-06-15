package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.AdminMemberDTO;
import cc.spring.repositories.AdminMemberDAO;

@Service
public class AdminMemberService {
	@Autowired
	private AdminMemberDAO ADAO;
	
	public boolean login(String id, String pw) {
		return ADAO.login(id, pw);
	}
	
	public AdminMemberDTO selectAdminMemberInfo() {
		return ADAO.selectAdminMemberInfo();
	}
}
