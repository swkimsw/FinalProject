package cc.spring.controllers;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.spring.dto.ClientMemberDTO;
import cc.spring.services.ClientMemberService;
import cc.spring.services.SmsService;

@Controller
@RequestMapping("/clientMember/")
public class ClientMemberController {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ClientMemberService cms;
	
	// 클라이언트 로그인 창으로 이동
	@RequestMapping("login_form")
	public String login_form() {
		return "member/clientLogin";
	}

	// 클라이언트 로그인
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
	
	// 클라이언트 회원가입 창으로 이동
	@RequestMapping("sign_form")
	public String sign_form() {
		return "member/clientSign";
	}
	
	// 회원가입 시 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="checkId", produces="text/html;charset=utf8")
	public String checkId(String value) throws Exception {
		boolean result = cms.isClientMember(value);
		return String.valueOf(result);
	}
	
	// 회원가입 시 인증번호
	@ResponseBody
	@RequestMapping(value="sendSms", produces="text/html;charset=utf8")
	public String sendSms(String phone) throws Exception {
		Random rand = new Random(); 
		String numStr = "";
		for(int i=0; i<4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr+=ran;
		}
		SmsService.certifiedPhoneNumber(phone, numStr);
		return numStr;
	}
	
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}

}
