package cc.spring.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.services.BoardService;
import cc.spring.services.FileService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	private BoardService boardservice;
	
	@Autowired
	private FileService fileservice;
	
	@Autowired
	private HttpSession session;
	


	//자유게시판으로 가기
	@RequestMapping("free")
	public String list_free() {
		return "/board/boardFree";
	}
	
	//공지게시판으로 가기
	@RequestMapping("announcement")
	public String list_Announcement() {
		return "/board/boardAnnouncement";
	}
	
	//후기게시판으로 가기
		@RequestMapping("review")
		public String list_review() {
			return "/board/boardReview";
		}
	
	//자유게시판 글 작성 으로 가기
	@RequestMapping("freeWrite")
	public String free_write() {
		return "/board/boardFreeWrite";
	}
	
	//공지게시판 글 작성 으로 가기
	@RequestMapping("announcementWrite")
	public String announcement_write() {
		return "/board/boardAnnouncementWrite";
	}

	//후기게시판 글 작성 으로 가기
	@RequestMapping("reviewWrite")
	public String review_write() {
		return "/board/boardReviewWrite";
	}
	

	//후기게시판 글 작성하기
	@RequestMapping("reviewInput")
	public String inputFree(BoardReviewDTO dto ,MultipartFile[] files) throws Exception {
		
		String writer =  (String)session.getAttribute("loginID"); //로그인한 사람의 세션 가져오기 (일반회원)
		
		int parent_seq = boardservice.selectReviewSeq(); //후기 게시판 작성할때 작성되는 글의 고유 번호 가져오기
		
		boardservice.insertReview(dto,writer,parent_seq); //후기 게시판 작성
		
		String realPath = 	session.getServletContext().getRealPath("upload"); 
		
		System.out.println(realPath);
		
		fileservice.insertReviewImage(realPath,files,parent_seq) ; //후기 게시판의 고유글에 사진 넣기
		
		return "redirect:/board/review" ;
		
	}
	
}
