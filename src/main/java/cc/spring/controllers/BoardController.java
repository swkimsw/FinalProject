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
	private ServletContext servletContext;


	@Autowired
	public BoardController(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@Autowired
	private HttpServletRequest request;





	//자유게시판으로 가기 - 일반회원,사업자회원만 작성버튼이 보이게
	@RequestMapping("free")
	public String list_free() {

		String user =  (String)session.getAttribute("id"); //로그인한 사람의 id가져오기 (관리자랑 로그인하지 않는 사람들 빼고 모두 글 작성할수있는 버튼보여야함)
		
		List<BoardFreeDTO> list = boardservice.selectFreelist(); //자유게시글 전부 다 가져오기
		System.out.println(list);
		request.setAttribute("list", list); //<BoardFreeDTO> 에 컬럼명 추가해야함
		
		
		if(user != null) {// 로그인했으면

			System.out.println(user);
			int result = boardservice.selectAdminresult(user); //권한등급 확인-관리자회원이면 1을 반납
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

		if(user.equals("admin123")) {

			//			int result = boardservice.selectAdminresult(user); //권한등급 확인-관리자회원이면 1을 반납
			//			System.out.println(result);

			request.setAttribute("user", user ); 
			return "/board/boardAnnouncement";
		}else {
			request.setAttribute("user", 0 ); 
			return "/board/boardAnnouncement";
		}

	}

	//후기게시판으로 가기  - 일반회원
	@RequestMapping("review")
	public String list_review() {
		String user =  (String)session.getAttribute("id"); //로그인한 사람의 id가져오기 (일반회원만 글 작성할수있는 버튼보여야함)

		if(user != null) {
			int result = boardservice.selectClientresult(user); //권한등급 확인-일반회원이면1을 반납
			System.out.println(result);
			request.setAttribute("user", result ); 
			return "/board/boardReview";
		}else {
			request.setAttribute("user", 0 ); 
			return "/board/boardReview";
		}

	}

	//===============================================================================

	//자유게시판 글 작성 으로 가기
	@RequestMapping("freeWrite")
	public String free_write() {
		String user =  (String)session.getAttribute("id"); //로그인한 사람의 id가져오기
		int result = boardservice.selectClientresult(user); //권한등급 확인-일반회원이면1을 반납
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

	//===============================================================================

	//자유게시판 글 작성하기 - 일반회원
	@RequestMapping("inputFreeClient")
	public String inputFreeClient(BoardFreeDTO dto) {

		String writer =  (String)session.getAttribute("id"); 
		System.out.println(writer);
		int member = boardservice.selectClientSeq(writer);//로그인한 사람의 ID SEQ 가져오기 (일반회원)
		System.out.println(member);
		int authgradecode = 1003;
		
		int code = boardservice.selectTotalCode(); //totalmember테이블의 데이터 집어넣을떄 고유 seq가져오기
		System.out.println(code);
		
		boardservice.insertTotalMemberClient(member,authgradecode,code);//로그인한사람의 정보 넣기 totalmember(일반회원)
		System.out.println("ㅁㄴㅇㄹ");
		
		int membercode = boardservice.selectCodeTotal(member,authgradecode,code);//totalmember테이블에서 작성한 사람의 total테이블 고유code빼오기
		System.out.println(membercode);
		
		boardservice.insertFree(dto,membercode);//자유게시판 작성하기
		return "redirect:/board/free"; //자유게시판으로 가기

	}


	//자유게시판 글 작성하기 - 사업자회원
	@RequestMapping("inputFreeBusiness")
	public String inputFreeBusiness(BoardFreeDTO dto) {

		String writer =  (String)session.getAttribute("id"); 
		System.out.println(writer);
		int member = boardservice.selectBusinessSeq(writer);//로그인한 사람의 ID SEQ 가져오기(일반회원)
		System.out.println(member);
		int authgradecode = 1002;
		
		int code = boardservice.selectTotalCode(); //totalmember테이블의 데이터 집어넣을떄 고유 seq가져오기
		System.out.println(code);
		
		boardservice.insertTotalMemberBusiness(member,authgradecode,code);//로그인한사람의 정보 넣기 totalmember(사업자회원)
		System.out.println("ㅁㄴㅇㄹ");
		
		int membercode = boardservice.selectCodeTotal(member,authgradecode,code);//totalmember테이블에서 작성한 사람의 total테이블 고유code빼오기
		System.out.println(membercode);
		
		boardservice.insertFree(dto,membercode); //자유게시판 작성하기
		return "redirect:/board/free"; //자유게시판으로 가기
	}


	//공지게시판 글 작성하기
	@RequestMapping("inputAnnouncement")
	public String inputAnnouncement(BoardAnnouncementDTO dto) {

		//		String writer =  (String)session.getAttribute("id"); 
		//		System.out.println(writer);
		//		int writer_seq = boardservice.selectAdminSeq(writer);//로그인한 사람의 ID SEQ 가져오기(일반회원)
		//		System.out.println(writer_seq);
		System.out.println("sssssssss");
		boardservice.insertAnnouncement(dto);
		return "redirect:/board/announcement"; //자유게시판으로 가기
	}





	//후기게시판 글 작성하기
	@RequestMapping("inputReview")
	@Transactional
	public String inputReview(BoardReviewDTO dto,
            @RequestParam(name = "oriName") String[] oriName,
            @RequestParam(name = "sysName") String[] sysName,
            String realPath) {

		String writer =  (String)session.getAttribute("id"); 
		System.out.println(writer);
		int writer_seq = boardservice.selectClientSeq(writer);//로그인한 사람의 ID SEQ 가져오기 (일반회원)
		System.out.println(writer_seq);

		int parent_seq = boardservice.selectReviewSeq(); //후기 게시판 작성할때 작성되는 글의 고유 번호 가져오기

		boardservice.insertReview(dto,writer_seq,parent_seq); //후기 게시판 작성

		for(int i = 0 ; i<oriName.length ; i++) {
			
			System.out.println(oriName[i]);  //oriName
			System.out.println(sysName[i]);  //oriName
			System.out.println(realPath); //realpath
			
			
			fileservice.insertReviewImage(parent_seq,realPath,oriName[i],sysName[i]); //후기게시판 글에 들어가는 이미지 db넣기
		
		}

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






