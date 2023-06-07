package cc.spring.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.spring.dto.ClientMemberDTO;
import cc.spring.repositories.ClientMemberDAO;

@Controller
@RequestMapping("/clientMember/")
public class ClientMemberController {
	@Autowired
	private HttpSession session;
	@Autowired
	private ClientMemberDAO dao;
	
	
//로그인창으로 이동
	@RequestMapping("login_form")
	public String login_form() {
		return "member/login";
	}
	//클라이언트 로그인
	@RequestMapping("login")
	public String login(ClientMemberDTO dto) {
		ClientMemberDTO result = dao.login(dto);
		if(result!=null) {
			session.setAttribute("loginID",dto.getId());
			System.out.println("로그인 실행!");
			return "redirect:/";
		}
		System.out.println("로그인 실패!!");
		return "error";
	}
	

	
	@RequestMapping("sign") 
	public String sign() throws Exception {
		return "member/clientSignup";
	}
	
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}

}
