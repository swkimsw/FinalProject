package cc.spring.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.spring.dto.BusinessMemberDTO;
import cc.spring.services.BusinessMemberService;

@Controller
@RequestMapping("/businessMember/")
public class BusinessMemberController {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BusinessMemberService bms;
	//사업자 로그인
		@RequestMapping("login")
		public String login(BusinessMemberDTO dto) {
			System.out.println(dto);
			boolean result = bms.login(dto);
			System.out.println(result);
			if(result) {
				session.setAttribute("loginID",dto.getBusinessId());
				System.out.println("로그인 실행!");
				return "home";
			}
			System.out.println("로그인 실패!!");
			return "error";
		}
}
