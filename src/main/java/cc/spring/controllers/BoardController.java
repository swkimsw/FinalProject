package cc.spring.controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import cc.spring.dto.BoardAnnouncementDTO;
import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.dto.ReplyFreeDTO;
import cc.spring.dto.ReportDTO;
import cc.spring.services.BoardService;
import cc.spring.services.FileService;

@Controller
@RequestMapping("/board/")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private FileService fileService;

	@Autowired
	private HttpSession session;

	@Autowired
	private HttpServletRequest request;





	//자유게시판으로 가기 - 일반회원,사업자회원만 작성버튼이 보이게
	@RequestMapping("free")
	public String list_free(int cpage) throws Exception {

		String user =  (String)session.getAttribute("id"); //로그인한 사람의 id가져오기 (관리자랑 로그인하지 않는 사람들 빼고 모두 글 작성할수있는 버튼보여야함)
		
		int start = (cpage * 10 ) - (10 -1);
		int end = cpage * 10;
		System.out.println("시작" + start);
		System.out.println("끝"+end);
		
		
		List<BoardFreeDTO> list = boardService.selectFreelist(start,end); //자유게시글 페이징에 맞게 가져오기
		System.out.println(list);
		request.setAttribute("list", list);
		
		
		List<BoardFreeDTO> all = boardService.selectAllFree(); //자유게시글 전부 다 가져오기
		int recordTotalCount = all.size();
		System.out.println(recordTotalCount);

		List<String> listnavi = boardService.selectPageNavi(recordTotalCount,cpage);
		request.setAttribute("listnavi", listnavi);
		request.setAttribute("cpage", cpage);


		if(user != null) {// 로그인했으면


			int result =  (int)session.getAttribute("authGradeCode");//권한등급 확인-관리자회원이면 1001반환- 관리자만 자유게시판 못씀
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
	public String list_Announcement(int cpage) throws Exception{
		
		String user =  (String)session.getAttribute("id"); //로그인한 사람의 id가져오기  (관리자만 글 작성할수있는 버튼보여야함)
		System.out.println(user);
		
		
		int start = (cpage * 10 ) - (10 -1);
		int end = cpage * 10;
		System.out.println("시작" + start);
		System.out.println("끝"+end);
		
		
		List<BoardAnnouncementDTO> list = boardService.selectAnnouncementlist(start,end); //공지사항게시글 페이징에 맞게 가져오기
		System.out.println(list);
		request.setAttribute("list", list);


		List<BoardAnnouncementDTO> all= boardService.selectAllAnnouncement(); //공지사항게시글 전부 다 가져오기
		int recordTotalCount = all.size();
		System.out.println(recordTotalCount);

		List<String>  listnavi = boardService.selectPageNavi(recordTotalCount,cpage);
		request.setAttribute("listnavi", listnavi);
		request.setAttribute("cpage", cpage);



		if(user != null) {//로그인되어있으면

			int result = (int) session.getAttribute("authGradeCode");//권한등급 확인-관리자회원이면 1001반환- 관리자만 공지게시판작성가능
			System.out.println(result);
			request.setAttribute("user", result);

			
			return "/board/boardAnnouncement";

		}else {//로그인안되어있으면

			request.setAttribute("user", 0 ); 
			return "/board/boardAnnouncement";
		}

	}

	//후기게시판으로 가기 
	@RequestMapping("review")
	public String list_review(int cpage) throws Exception {
		String user =  (String)session.getAttribute("id"); //로그인한 사람의 id가져오기 (일반회원만 글 작성할수있는 버튼보여야함)

		
		int start = (cpage * 10 ) - (10 -1);
		int end = cpage * 10;
		System.out.println("시작" + start);
		System.out.println("끝"+end);
		
		
		List<BoardReviewDTO> list = boardService.selectReviewlist(start,end); //공지사항게시글 페이징에 맞게 가져오기
		System.out.println(list);
		request.setAttribute("list", list);
		
		
		List<BoardReviewDTO> all = boardService.selectAllReview(); //후기게시글 전부 다 가져오기
		int recordTotalCount = all.size();
		System.out.println(recordTotalCount);

		List<String>  listnavi = boardService.selectPageNavi(recordTotalCount,cpage);
		request.setAttribute("listnavi", listnavi);
		request.setAttribute("cpage", cpage);


		if(user != null) {//로그인되어있으면

			int result = (int) session.getAttribute("authGradeCode");//권한등급 확인-일반회원만 후기게시판 작성가능-1003반환
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
		int result = (int)session.getAttribute("authGradeCode"); //작성하는 사람이 일반회원인지 , 사업자회원인지 구분하기위한단계
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
	public String FreeContent(int code,int cpage,boolean viewchoose) {
		int user = (int) session.getAttribute("code"); //로그인한 사람의 code
		request.setAttribute("user", user );

		BoardFreeDTO result = boardService.selectFreeContent(code,viewchoose);
		request.setAttribute("result",result); //리스트 중 누른 해당 글 가져오기 + viewcount+1

		request.setAttribute("cpage", cpage);
		
		// 게시판에 달린 댓글 가져오기
		List<ReplyFreeDTO> replyList = boardService.selectReplyFreeList(code);
		request.setAttribute("replyList", replyList);

		return  "/board/FreeContent";
	}

	//공지게시판 글 자세히 보기
	@RequestMapping("AnnouncementContent")
	public String AnnouncementContent(int code,int cpage,boolean viewchoose) {
		int user = (int) session.getAttribute("code"); //로그인한 사람의 code
		request.setAttribute("user", user ); 
	
		
		BoardAnnouncementDTO result = boardService.selectAnnouncementContent(code,viewchoose);
		request.setAttribute("result",result); //리스트 중 누른 해당 글 가져오기 + viewcount+1

		request.setAttribute("cpage", cpage);
		
		return "/board/AnnouncementContent";
	}

	//리뷰게시판 글 자세히 보기
	@RequestMapping("ReviewContent")
	public String ReviewContent(int code,int cpage,boolean viewchoose) {
		int user = (int) session.getAttribute("code"); //로그인한 사람의 code
		request.setAttribute("user", user ); 


		BoardReviewDTO result = boardService.selectReviewContent(code,viewchoose);
		request.setAttribute("result",result); //리스트 중 누른 해당 글 가져오기 + viewcount+1

		request.setAttribute("cpage", cpage);
		
		return "/board/ReviewContent";
	}


	//===============================================================================

	//자유게시판 글 작성하기 - 일반회원,사업자회원
	@RequestMapping("inputFree")
	public String inputFree(BoardFreeDTO dto) {

		int membercode = (int)session.getAttribute("code"); //로그인(작성자의고유 code가져오기)
		System.out.println(membercode);
		boardService.insertFree(dto,membercode);//자유게시판 작성하기

		return "redirect:/board/free?cpage=1"; //자유게시판으로 가기

	}


	//공지게시판 글 작성하기
	@RequestMapping("inputAnnouncement")
	public String inputAnnouncement(BoardAnnouncementDTO dto) {


		int membercode = (int) session.getAttribute("code"); //로그인(작성자의고유 code가져오기)
		System.out.println(membercode);
		boardService.insertAnnouncement(dto,membercode);//공지게시판 작성하기


		return "redirect:/board/announcement?cpage=1"; //공지게시판으로 가기
	}



	//후기게시판 글 작성하기
	@RequestMapping("inputReview")
	public String inputReview(BoardReviewDTO dto) {

		int membercode = (int) session.getAttribute("code"); //로그인한 사람의 ID code 가져오기 
		dto.setMemberCode(membercode);

		System.out.println(membercode);

		// int parent_seq = boardservice.selectReviewSeq(); //후기 게시판 작성할때 작성되는 글의 고유 번호 가져오기 = select key기능으로 고치기

		boardService.insertReview(dto); //후기 게시판 작성
		return "redirect: /board/review?cpage=1" ;
	}


	//	후기게시판 글 작성하기
	//	@RequestMapping("inputReview")
	//	public String inputReview(BoardReviewDTO dto,
	//			@RequestParam(name = "oriName") String[] oriName,
	//			@RequestParam(name = "sysName") String[] sysName,
	//			String realPath) {
	//
	//		int membercode = (int) session.getAttribute("code"); //로그인한 사람의 ID code 가져오기 
	//		dto.setMemberCode(membercode);
	//		
	//		System.out.println(membercode);
	//
	//		// int parent_seq = boardservice.selectReviewSeq(); //후기 게시판 작성할때 작성되는 글의 고유 번호 가져오기 = select key기능으로 고치기
	//
	//		boardservice.insertReview(dto,realPath,oriName,sysName); //후기 게시판 작성
	//		return "redirect: /board/review" ;
	//	}
	//

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



	//자유게시판 글 수정
	@ResponseBody
	@RequestMapping("updateFree")
	public int updateFree(BoardFreeDTO dto) {

		System.out.println(dto.getTitle());
		System.out.println(dto.getCode());
		System.out.println(dto.getHeadLineCode());
		System.out.println(dto.getContent());

		int result = boardService.updateFree(dto); 

		return result;

	}



	//공지게시판 글 수정
	@ResponseBody
	@RequestMapping("updateAnnouncement")
	public int updateAnnouncement(BoardAnnouncementDTO dto) {

		System.out.println(dto.getTitle());
		System.out.println(dto.getCode());
		System.out.println(dto.getHeadLineCode());
		System.out.println(dto.getContent());

		int result = boardService.updateAnnouncement(dto); 

		return result;

	}


	//자유게시판 글 수정
	@ResponseBody
	@RequestMapping("updateReview")
	public int updateReview(BoardReviewDTO dto) {

		System.out.println(dto.getTitle());
		System.out.println(dto.getCode());
		System.out.println(dto.getContent());

		int result = boardService.updateReview(dto); 

		return result;

	}

	//===========================================================================================		

	//공지게시판 글 삭제
	@RequestMapping("deleteAnnouncement")
	public String deleteAnnouncement(int cpage) {

		int code =  Integer.parseInt((String)request.getParameter("code"));
		System.out.println(code);
		int result = boardService.deleteAnnouncement(code);
		
		System.out.println(cpage);

		return "redirect: /board/announcement?cpage="+cpage;

	}


	//리뷰게시판 글 삭제
	@RequestMapping("deleteReview")
	public String deleteReview(int cpage) {

		int code =  Integer.parseInt((String)request.getParameter("code"));
		System.out.println(code);

		int result = boardService.deleteReview(code); 

		return "redirect: /board/review?cpage="+ cpage;

	}


	//자유게시판 글 삭제
	@RequestMapping("deleteFree")
	public String deleteFree(int cpage) {

		int code =  Integer.parseInt((String)request.getParameter("code"));
		System.out.println(code);

		int result = boardService.deleteFree(code); 

		return "redirect: /board/free?cpage="+cpage ;

	}		

	//===========================================================================================		


	//자유게시판 신고페이지로 이동
	@RequestMapping("freeReport")
	public String freeReport(ReportDTO dto,int authGradeCode) {


		String companyname = (String) session.getAttribute("companyName");

		if(companyname == null) {
			String nickname = (String)	session.getAttribute("nickname");
			request.setAttribute("nickname", nickname);
		}else {
			request.setAttribute("companyname", companyname);
		}


		String reporteeName = boardService.selectReporteeName(dto.getReporteeCode(),authGradeCode);
		request.setAttribute("reporteeName", reporteeName);

		request.setAttribute("list", dto);
		return "board/report" ;

	}		




	//리뷰게시판 신고페이지로 이동
		@RequestMapping("reviewReport")
		public String reviewReport(ReportDTO dto) {


			String companyname = (String) session.getAttribute("companyName");

			if(companyname == null) {
				String nickname = (String)	session.getAttribute("nickname");
				request.setAttribute("nickname", nickname);
			}else {
				request.setAttribute("companyname", companyname);
			}//신고자

			int authGradeCode = 1003;
			
			String reporteeName = boardService.selectReporteeName(dto.getReporteeCode(),authGradeCode);
			request.setAttribute("reporteeName", reporteeName);

			request.setAttribute("list", dto);
			return "board/report" ;

			
		}		



	//===========================================================================================
		
	// 자유게시판 댓글 작성하면서 모든글들을 다시 가져오기
	@ResponseBody
	@RequestMapping("freeReply")
	public int freeReply(String replyContent, int boardFreeCode, int cpage) {
		
		ReplyFreeDTO dto = new ReplyFreeDTO(0, boardFreeCode, (int) session.getAttribute("code"), replyContent, 0, null, null, null);
		int result = boardService.insertFreeReply(dto);

		return result;
	}



	//신고 접수
	@ResponseBody
	@RequestMapping("reportFree")
	public int reportFree(ReportDTO dto) {

		System.out.println(dto.getBoardKindCode());
		System.out.println(dto.getPostcode());
		System.out.println(dto.getReportKindCode());
		System.out.println(dto.getReporterCode());
		System.out.println(dto.getReporteeCode());
		System.out.println(dto.getStatusCode());
		System.out.println(dto.getDetail());


		int result = boardService.insertReport(dto); 
		return result;

	}
	
	//좋아요수 
	@ResponseBody
	@RequestMapping("LikeCount")
	public int LikeCount(@RequestParam("code") String code, @RequestParam("likeCount") int likeCount,@RequestParam("boardKindCode") int boardKindCode) {

		System.out.println("likecount");
		System.out.println(code);
		System.out.println(likeCount);
		System.out.println(boardKindCode);
	
		
		int result = boardService.updateLikeCount(code,likeCount,boardKindCode);

		return result;
	}

//=====================================================================================	


			
}
