package cc.spring.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.MemberDTO;
import cc.spring.repositories.AdminMemberDAO;
import cc.spring.repositories.BusinessMemberDAO;
import cc.spring.repositories.ClientMemberDAO;

@Service
public class AdminMemberService {
	@Autowired
	private AdminMemberDAO ADAO;
	
	@Autowired
	private BusinessMemberDAO BDAO;
	
	@Autowired
	private ClientMemberDAO CDAO;
	
	public boolean login(String id, String pw) {
		return ADAO.login(id, pw);
	}
	
	public MemberDTO selectAdminMemberInfo(String id, String pw) {
		return ADAO.selectAdminMemberInfo(id, pw);
	}
	
	public List<MemberDTO> selectAllBusinessMember() {
		return BDAO.selectAllBusinessMember();
	}
	
	public List<MemberDTO> selectAllClientMember() {
		return CDAO.selectAllClientMember();
	}
	public int selectSuccessMeal() {
		return ADAO.selectSuccessMeal();
	}	
	public int selectFailMeal() {
		return ADAO.selectFailMeal();
	}
	public List<MemberDTO> ClinetUserList() {
		return ADAO.clientUserList();
	}
}
