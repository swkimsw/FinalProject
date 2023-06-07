package cc.spring.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.spring.dto.ClientMemberDTO;
import cc.spring.services.ClientMemberService;

@Controller
@RequestMapping("/clientMember/")
public class ClientMemberController {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ClientMemberService cms;
	
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
	public String login(ClientMemberDTO dto) {
		System.out.println(dto);
		boolean result = cms.login(dto);
		System.out.println(result);
		if(result) {
			session.setAttribute("loginID",dto.getId());
			System.out.println("로그인 실행!");
			return "home";
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
	public boolean checkId(String id) {
		System.out.println(id);
		boolean result = cms.isClientMember(id);
		return result;
	}
	
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}

}
