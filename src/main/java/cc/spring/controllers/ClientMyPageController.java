package cc.spring.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.services.ClientMyPageService;

@Controller
@RequestMapping("/clientMyPage/")
public class ClientMyPageController {
	@Autowired
	private HttpSession session;
	@Autowired
	private ClientMyPageService cmp;
	//클라이언트 마이페이지 내가쓴 자유게시판 
	@RequestMapping("myPageFreeboard")
	public String myPageList(Model model) {
		int code = (int) session.getAttribute("code");
		System.out.println("신발");
		System.out.println("클라이언트 코드 :"+code);
		List<BoardFreeDTO> list = cmp.myPageList(code);
		model.addAttribute("list",list);
		return "/member/clientMyPageFreeBoard";
	}
	//클라이언트 마이페이지 내가 쓴 리뷰 게시판
	@RequestMapping("myPageReview")
	public String myPageReview(Model model) {
		int code = (int) session.getAttribute("code");
		List<BoardReviewDTO> list = cmp.myPageReview(code);
		System.out.println("클라이언트 코드 :"+code);
		System.out.println("리뷰 컨트롤러");
		model.addAttribute("list",list);
		return "/member/clientMyPageReview";
	}
	//비지니스 마이페이지 내가 쓴 자유게시판 
	@RequestMapping("businessMypageBoard")
	public String businessMypageBoard(Model model) {
		int code = (int) session.getAttribute("code");
		List<BoardFreeDTO> list = cmp.myPageList(code);
		System.out.println("비지니스 :"+code);
		model.addAttribute("list",list);
		return "/member/businessMyPageFreeBoard";
	}
	
	// 내 정보 보기 클릭 시 페이지 이동
	@RequestMapping("myInfo")
	public String myInfo() {
		return "/member/myInfo";
	}
	
	// 비밀번호 입력 시 로그인한 회원의 비밀번호와 일치하는지 확인
//	@ResponseBody
//	@RequestMapping("checkPw")
//	public String checkPw() {
//		
//	}
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}
}
