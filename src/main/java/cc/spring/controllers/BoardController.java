package cc.spring.controllers;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String inputFree(BoardReviewDTO dto ,@RequestParam("file") MultipartFile file) throws Exception {

		String writer =  (String)session.getAttribute("loginID"); //로그인한 사람의 세션 가져오기 (일반회원)

		int parent_seq = boardservice.selectReviewSeq(); //후기 게시판 작성할때 작성되는 글의 고유 번호 가져오기

		boardservice.insertReview(dto,writer,parent_seq); //후기 게시판 작성

		if (!file.isEmpty()) {
			try {
				// 파일을 저장하거나 DB에 저장하는 코드를 작성합니다.
				// 예를 들어, 파일을 서버의 특정 경로에 저장하거나 DB에 저장하는 로직을 구현할 수 있습니다.
				// DB에 저장하는 경우, 필요한 DAO나 서비스를 호출하여 저장하는 방식으로 구현할 수 있습니다.
				// 이미지 파일의 이름 등의 정보를 추출하여 DB에 저장하는 로직을 추가적으로 작성할 수 있습니다.

				// 예시: 파일을 서버의 특정 경로에 저장하는 경우
				String fileName = file.getOriginalFilename();
				String filePath = "/path/to/save/" + fileName;
				File destFile = new File(filePath);
				file.transferTo(destFile);

				// DB에 저장하는 로직 추가...

				// 파일 저장이 성공적으로 이루어졌을 경우에는 적절한 응답을 반환합니다.
				return "redirect:/board/review" ;
			} catch (Exception e) {
				e.printStackTrace();
				// 파일 저장 중에 예외가 발생한 경우에는 실패 응답을 반환합니다.
				return "error";
			}
		} else {
			// 전송된 파일이 없는 경우에는 실패 응답을 반환합니다.
			return "error";
		}




	}

}
