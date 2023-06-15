package cc.spring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/clientMyPage/")
public class ClientMyPageController {

	@RequestMapping("login_form")
	public String myPageForm() throws Exception {
		return "member/myPage";
	}
	
}
