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
	private AdminMemberDAO aDAO;
	
	@Autowired
	private BusinessMemberDAO bDAO;
	
	@Autowired
	private ClientMemberDAO cDAO;
	
	public boolean login(String id, String pw) {
		return aDAO.login(id, pw);
	}
	
	public MemberDTO selectAdminMemberInfo(String id, String pw) {
		return aDAO.selectAdminMemberInfo(id, pw);
	}
	
	public List<MemberDTO> selectAllBusinessMember() {
		return bDAO.selectAllBusinessMember();
	}
	
	public List<MemberDTO> selectAllClientMember() {
		return cDAO.selectAllClientMember();
	}
	
	public int selectSuccessMeal() {
		return aDAO.selectSuccessMeal();
	}	
	
	public int selectFailMeal() {
		return aDAO.selectFailMeal();
	}
	
	public int selectSuccessBasket() {
		return aDAO.selectSuccessBasket();
	}
	
	public int selectFailBasket() {
		return aDAO.selectFailBasket();
	}
}
