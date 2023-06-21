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
	public String myPageList(Model model) {
		int code = (int) session.getAttribute("code");
		//int code = 11;
		System.out.println("신발");
		System.out.println(code);
		List<BoardFreeDTO> list = cmp.myPageList(code);
		System.out.println(list);
		model.addAttribute("list",list);
		return "/member/myPage";
	}
}
