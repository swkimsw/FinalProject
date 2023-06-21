package cc.spring.controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import cc.spring.dto.BoardAnnouncementDTO;
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

	@Autowired
	private HttpServletRequest request;





	//자유게시판으로 가기 - 일반회원,사업자회원만 작성버튼이 보이게
	@RequestMapping("free")
	public String list_free() {

		String user =  (String)session.getAttribute("id"); //로그인한 사람의 id가져오기 (관리자랑 로그인하지 않는 사람들 빼고 모두 글 작성할수있는 버튼보여야함)

		List<BoardFreeDTO> list = boardservice.selectFreelist(); //자유게시글 전부 다 가져오기
		System.out.println(list);
		request.setAttribute("list", list); 


		if(user != null) {// 로그인했으면


			String result = (String) session.getAttribute("authGradeCode");//권한등급 확인-관리자회원이면 1001반환- 관리자만 자유게시판 못씀
			System.out.println(result);
			request.setAttribute("user", result);

			return "/board/boardFree";

		}else {// 로그인안했으면
			request.setAttribute("user", 0 ); 
			return "/board/boardFree";
		}

	}


	//공지게시판으로 가기  - 관리자회원
	@RequestMapping("announcement")
	public String list_Announcement() {

		String user =  (String)session.getAttribute("id"); //로그인한 사람의 id가져오기  (관리자만 글 작성할수있는 버튼보여야함)
		System.out.println(user);

		List<BoardAnnouncementDTO> list = boardservice.selectAnnouncementlist(); //공지사항게시글 전부 다 가져오기
		System.out.println(list);
		request.setAttribute("list", list);

		if(user != null) {//로그인되어있으면

			String result = (String) session.getAttribute("authGradeCode");//권한등급 확인-관리자회원이면 1001반환- 관리자만 공지게시판작성가능
			System.out.println(result);
			request.setAttribute("user", result);

			return "/board/boardAnnouncement";

		}else {//로그인안되어있으면

			request.setAttribute("user", 0 ); 
			return "/board/boardAnnouncement";
		}

	}

	//후기게시판으로 가기  - 일반회원
	@RequestMapping("review")
	public String list_review() {
		String user =  (String)session.getAttribute("id"); //로그인한 사람의 id가져오기 (일반회원만 글 작성할수있는 버튼보여야함)

		List<BoardReviewDTO> list = boardservice.selectReviewlist(); //후기게시글 전부 다 가져오기
		System.out.println(list);
		request.setAttribute("list", list);

		if(user != null) {//로그인되어있으면

			String result = (String) session.getAttribute("authGradeCode");//권한등급 확인-일반회원만 후기게시판 작성가능-1003반환
			System.out.println(result);
			request.setAttribute("user", result);

			return "/board/boardReview";

		}else {//로그인안되어있으면
			request.setAttribute("user", 0 ); 
			return "/board/boardReview";
		}

	}

	//===============================================================================

	//자유게시판 글 작성 으로 가기
	@RequestMapping("freeWrite")
	public String free_write() {
		String result = (String)session.getAttribute("authGradeCode"); //작성하는 사람이 일반회원인지 , 사업자회원인지 구분하기위한단계
		request.setAttribute("user", result ); 
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

	//=========================================================================

	//자유게시판 글 자세히 보기
	@RequestMapping("FreeContent")
	public String FreeContent(int code) {
		int user = (int) session.getAttribute("code"); //로그인한 사람의 code
		request.setAttribute("user", user ); 


		BoardFreeDTO result = boardservice.selectFreeContent(code);
		request.setAttribute("result",result); //리스트 중 누른 해당 글 가져오기

		return "/board/FreeContent";
	}

	//공지게시판 글 자세히 보기
	@RequestMapping("AnnouncementContent")
	public String AnnouncementContent(int code) {
		int user = (int) session.getAttribute("code"); //로그인한 사람의 code
		request.setAttribute("user", user ); 


		BoardAnnouncementDTO result = boardservice.selectAnnouncementContent(code);
		request.setAttribute("result",result); //리스트 중 누른 해당 글 가져오기

		return "/board/AnnouncementContent";
	}

	//리뷰게시판 글 자세히 보기
	@RequestMapping("ReviewContent")
	public String ReviewContent(int code) {
		int user = (int) session.getAttribute("code"); //로그인한 사람의 code
		request.setAttribute("user", user ); 


		BoardReviewDTO result = boardservice.selectReviewContent(code);
		request.setAttribute("result",result); //리스트 중 누른 해당 글 가져오기

		return "/board/ReviewContent";
	}


	//===============================================================================

	//자유게시판 글 작성하기 - 일반회원,사업자회원
	@RequestMapping("inputFreeClient")
	public String inputFreeClient(BoardFreeDTO dto) {

		int membercode = Integer.parseInt((String)session.getAttribute("code")); //로그인(작성자의고유 code가져오기)
		System.out.println(membercode);
		boardservice.insertFree(dto,membercode);//자유게시판 작성하기

		return "redirect:/board/free"; //자유게시판으로 가기

	}


	//공지게시판 글 작성하기
	@RequestMapping("inputAnnouncement")
	public String inputAnnouncement(BoardAnnouncementDTO dto) {


		int membercode = Integer.parseInt((String)session.getAttribute("code")); //로그인(작성자의고유 code가져오기)
		System.out.println(membercode);
		boardservice.insertAnnouncement(dto,membercode);//공지게시판 작성하기

		return "redirect:/board/announcement"; //공지게시판으로 가기
	}





	//후기게시판 글 작성하기
	@RequestMapping("inputReview")
	public String inputReview(BoardReviewDTO dto,
			@RequestParam(name = "oriName") String[] oriName,
			@RequestParam(name = "sysName") String[] sysName,
			String realPath) {

		int membercode = (int) session.getAttribute("code"); //로그인한 사람의 ID code 가져오기 
		System.out.println(membercode);

		int parent_seq = boardservice.selectReviewSeq(); //후기 게시판 작성할때 작성되는 글의 고유 번호 가져오기 = select key기능

		boardservice.insertReview(dto,membercode,parent_seq,realPath,oriName,sysName); //후기 게시판 작성

		return "redirect: /board/review" ;
	}



	@ResponseBody //ajax로 이미지 주고받는거
	@RequestMapping(value="/uploadImage", method=RequestMethod.POST)
	public List<JsonObject> uploadSummernoteImageFile(@RequestParam("image") MultipartFile[] images) {
		List<JsonObject> resp = new ArrayList<>();

		try {
			String realPath = session.getServletContext().getRealPath("/resources/contentImg");
			System.out.println(realPath);
			File realPathFile = new File(realPath);
			if (!realPathFile.exists()) {
				realPathFile.mkdirs();
			}

			if (images != null) {
				for (MultipartFile image : images) {
					if (image.isEmpty()) {
						continue;
					}
					String oriName = image.getOriginalFilename();
					String sysName = UUID.randomUUID() + "_" + oriName;
					image.transferTo(new File(realPath + "/" + sysName));

					JsonObject jsonObject = new JsonObject();

					jsonObject.addProperty("url", "/resources/contentImg/"+sysName);
					jsonObject.addProperty("oriName", oriName);
					jsonObject.addProperty("realPath", realPath);
					jsonObject.addProperty("sysName", sysName);

					resp.add(jsonObject);
				}
			}

		}catch (IOException e) {
			e.printStackTrace();
		}
		return resp;
	}
}

//===========================================================================================






