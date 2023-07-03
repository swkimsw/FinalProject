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
import cc.spring.services.MyPageService;

@Controller
@RequestMapping("/MyPage/")
public class MyPageController {
	@Autowired
	private HttpSession session;
	@Autowired
	private MyPageService cmp;
	//클라이언트 마이페이지 내가쓴 자유게시판 
	@RequestMapping("myPageFreeboard")
	public String myPageList(Model model) {
		int code = (int) session.getAttribute("code");
		List<BoardFreeDTO> list = cmp.myPageList(code);
		model.addAttribute("list",list);
		return "/member/clientMyPageFreeBoard";
	}
	//클라이언트 마이페이지 내가 쓴 리뷰 게시판
	@RequestMapping("myPageReview")
	public String myPageReview(Model model) {
		int code = (int) session.getAttribute("code");
		List<BoardReviewDTO> list = cmp.myPageReview(code);
		model.addAttribute("list",list);
		return "/member/clientMyPageReview";
	}
	//비지니스 마이페이지 내가 쓴 자유게시판 
	@RequestMapping("businessMypageBoard")
	public String businessMypageBoard(Model model) {
		int code = (int) session.getAttribute("code");
		List<BoardFreeDTO> list = cmp.myPageList(code);
		model.addAttribute("list",list);
		return "/member/businessMyPageFreeBoard";
	}
	// 내 정보 보기 클릭 시 페이지 이동
	@RequestMapping("myInfo")
	public String myInfo() {
		return "/member/myInfo";
	}
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}
}
