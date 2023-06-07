package cc.spring.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.spring.dto.ClientMemberDTO;
import cc.spring.repositories.ClientMemberDAO;
import cc.spring.services.ClientMemberService;
import cc.spring.services.MemberService;

@Controller
@RequestMapping("/clientMember/")
public class ClientMemberController {
	@Autowired
	private HttpSession session;
	@Autowired
	private ClientMemberDAO dao;
	@Autowired
	private ClientMemberService CMS;
	
//로그인창으로 이동
	@RequestMapping("login_form")
	public String login_form() {
		return "member/login";
	}
	@RequestMapping("sign_form")
	public String sign_form() {
		return "member/sign";
	}
	//클라이언트 로그인
	@RequestMapping("login")
	public String login(String id,String pw) {
		
		ClientMemberDTO result = CMS.login(dto);
		System.out.println(result);
		if(result!=null) {
			session.setAttribute("loginID",dto.getId());
			System.out.println("로그인 실행!");
			return "/";
		}
		System.out.println("로그인 실패!!");
		return "error";
	}
	

	
	@RequestMapping("sign") 
	public String sign() throws Exception {
		return "member/clientSignup";
	}
	
	@ResponseBody
	@RequestMapping(value="checkId", produces="text/html;charset=utf8")
	public boolean checkId(String key, String value) {
		boolean result = CMS.isClientMember(value);
		return result;
	}
	
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}

}
