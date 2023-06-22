package cc.spring.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.spring.commons.EncryptionUtils;
import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.MemberDTO;
import cc.spring.services.ClientMyPageService;

@Controller
@RequestMapping("/clientMyPage/")
public class ClientMyPageController {
	@Autowired
	private HttpSession session;

	@Autowired
	private ClientMyPageService cmp;


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
	
	// 내 정보 보기 클릭 시 페이지 이동
	@RequestMapping("clientMyInfo")
	public String myInfo() {
		return "/member/clientMyInfo";
	}
	
	// 비밀번호 입력 시 로그인한 회원의 비밀번호와 일치하는지 확인
	@ResponseBody
	@RequestMapping("checkPw")
	public String checkPw(String pw) throws Exception {
		String enPw = EncryptionUtils.sha512(pw);
		String id = (String) session.getAttribute("id");
		boolean result = cmp.checkPw(id, enPw);
		return String.valueOf(result);
	}
	
	// 입력한 비밀번호 일치 시 회원정보 가져오기
	@ResponseBody
	@RequestMapping("selectClientMemberInfo")
	public MemberDTO selectClientMemberInfo(String id) throws Exception {
		MemberDTO dto = cmp.selectClientMemberInfo(id);
		return dto;
	}
	
	

	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}
	
}
