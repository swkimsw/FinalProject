package cc.spring.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.spring.dto.BoardFreeDTO;
import cc.spring.repositories.ClientMyPageDAO;
import cc.spring.services.ClientMyPageService;

@Controller
@RequestMapping("/clientMyPage/")
public class ClientMyPageController {
	@Autowired
	private HttpSession session;

	@Autowired
	private ClientMyPageService cmp;
	@Autowired
	private ClientMyPageDAO cmpd;

	@RequestMapping("myPage")
	public String myPageForm() throws Exception {
		return "member/myPage";
	}

	@RequestMapping("myPageList")
	public String myPageList(int code) {
		System.out.println("MyPage 실행!!");
		String id = (String) session.getAttribute("id");
		String ABC = cmp.MyPageList(id, code);
		System.out.println(ABC);
		return "";
	}
}
