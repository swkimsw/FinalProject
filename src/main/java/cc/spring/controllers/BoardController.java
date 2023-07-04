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
import cc.spring.dto.ReplyAnnouncementDTO;
import cc.spring.dto.ReplyFreeDTO;
import cc.spring.dto.ReplyReviewDTO;
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


		
		int recordTotalCount;
				
		if(request.getParameter("check") == null) { // check분류가 없으면

			int[] check = new int[] {0};
			request.setAttribute("check", check ); //0들어감
			
			if(request.getParameter("searchCate")== null || request.getParameter("search")== null) { //검색조건이 아예 없으면
				
				List<BoardFreeDTO> list = boardService.selectFreelist(start,end); //자유게시글 페이징에 맞게 가져오기
				request.setAttribute("list", list);
				List<BoardFreeDTO> all = boardService.selectAllFree(); //자유게시글 전부 다 가져오기
				recordTotalCount = all.size();
				
			
			}else {//검색조건이 있으면
				
				String searchCate  = request.getParameter("searchCate"); //검색카테고리
				String search  = request.getParameter("search"); //검색내용
				
				
				List<BoardFreeDTO> all= boardService.selectAllSearchFree(search,searchCate); //공지사항게시글 전부 다 가져오기 - 검색
				recordTotalCount = all.size();
				List<BoardFreeDTO> list = boardService.selectSearchFree(start,end,search,searchCate); //공지사항게시글 페이징에 맞게 가져오기 - 검색
				request.setAttribute("list", list);
				request.setAttribute("search", search);
				request.setAttribute("searchCate", searchCate);
			
			}
			
			
		}else { //check 분류가 있으면


				String checks = request.getParameter("check");
			    String[] checkArray = checks.split(",");
			    int[] check = new int[checkArray.length]; // int 배열 생성
			    for (int i = 0; i < checkArray.length; i++) {
			        check[i] = Integer.parseInt(checkArray[i]); // 문자열을 int로 변환하여 배열에 저장
			    }


			if(request.getParameter("searchCate")== null || request.getParameter("search")== null) { //검색조건이 아예 없으면
				
				List<BoardFreeDTO> list = boardService.selectFreeChecklist(start,end,check); //자유게시글 페이징에 맞게 가져오기 - check분류에 맞게
				request.setAttribute("list", list);
				List<BoardFreeDTO> all = boardService.selectCheckAllFree(check); //자유게시글 전부 다 가져오기
				recordTotalCount = all.size();
				
			    request.setAttribute("check", check); //int형 배열보내기
				    
			
			}else {//검색조건이 있으면
				
				String searchCate  = request.getParameter("searchCate"); //검색카테고리
				String search  = request.getParameter("search"); //검색내용
				

				
				List<BoardFreeDTO> all= boardService.selectAllSearchCheckFree(search,searchCate,check); //공지사항게시글 전부 다 가져오기 - 검색(카테고리있을때)
				recordTotalCount = all.size();
				List<BoardFreeDTO> list = boardService.selectSearchCheckFree(start,end,search,searchCate,check); //공지사항게시글 페이징에 맞게 가져오기 - 검색(카테고리 있을때)
				request.setAttribute("list", list);
				request.setAttribute("search", search);
				request.setAttribute("searchCate", searchCate);
				request.setAttribute("check", check); //int형 배열보내기

			
			}
			
		}
		
		List<String> listnavi = boardService.selectPageNavi(recordTotalCount,cpage);
		request.setAttribute("listnavi", listnavi);
		request.setAttribute("cpage", cpage);


		if(user != null) {// 로그인했으면


			int result =  (int)session.getAttribute("authGradeCode");//권한등급 확인-관리자회원이면 1001반환- 관리자만 자유게시판 못씀
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

		int start = (cpage * 10 ) - (10 -1);
		int end = cpage * 10;

		
		int recordTotalCount;
	
			if(request.getParameter("searchCate")== null || request.getParameter("search")== null) { //검색조건이 아예 없으면
				
				List<BoardAnnouncementDTO> list = boardService.selectAnnouncementlist(start,end); //공지사항게시글 페이징에 맞게 가져오기 
				request.setAttribute("list", list);
				List<BoardAnnouncementDTO> all= boardService.selectAllAnnouncement(); //공지사항게시글 전부 다 가져오기
				recordTotalCount = all.size();

			
			}else {//검색조건이 있으면
				
				String searchCate  = request.getParameter("searchCate"); //검색카테고리
				String search  = request.getParameter("search"); //검색내용

				
				List<BoardAnnouncementDTO> all= boardService.selectAllSearchAnnounc(search,searchCate); //공지사항게시글 전부 다 가져오기 - 검색
				recordTotalCount = all.size();
				List<BoardAnnouncementDTO> list = boardService.selectSearchAnnounce(start,end,search,searchCate); //공지사항게시글 페이징에 맞게 가져오기 - 검색
				request.setAttribute("list", list);
				request.setAttribute("search", search);
				request.setAttribute("searchCate", searchCate);

			
			}


		List<String>  listnavi = boardService.selectPageNavi(recordTotalCount,cpage);
		request.setAttribute("listnavi", listnavi);
		request.setAttribute("cpage", cpage);



		if(user != null) {//로그인되어있으면

			int result = (int) session.getAttribute("authGradeCode");//권한등급 확인-관리자회원이면 1001반환- 관리자만 공지게시판작성가능
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



		int recordTotalCount;

		if(request.getParameter("searchCate")== null || request.getParameter("search")== null) { //검색조건이 아예 없으면
			
			List<BoardReviewDTO> list = boardService.selectReviewlist(start,end); //후기게시글 페이징에 맞게 가져오기 - 전부가져오기
			request.setAttribute("list", list);
			List<BoardReviewDTO> all = boardService.selectAllReview();//후기게시글 전부 다 가져오기 
			recordTotalCount = all.size();

		
		}else {//검색조건이 있으면
			
			String searchCate  = request.getParameter("searchCate"); //검색카테고리
			String search  = request.getParameter("search"); //검색내용

			
			
			List<BoardReviewDTO> all= boardService.selectAllSearchReview(search,searchCate); //후기게시글 전부 다 가져오기 - 검색
			recordTotalCount = all.size();
			List<BoardReviewDTO> list = boardService.selectSearchReview(start,end,search,searchCate); //후기게시글 페이징에 맞게 가져오기 - 검색
			request.setAttribute("list", list);
			request.setAttribute("search", search);
			request.setAttribute("searchCate", searchCate);

		
		}
		
		
		
		List<String>  listnavi = boardService.selectPageNavi(recordTotalCount,cpage);
		request.setAttribute("listnavi", listnavi);
		request.setAttribute("cpage", cpage);


		if(user != null) {//로그인되어있으면

			int result = (int) session.getAttribute("authGradeCode");//권한등급 확인-일반회원만 후기게시판 작성가능-1003반환
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
		int cpage = Integer.parseInt((String)request.getParameter("cpage"));
		request.setAttribute("cpage", cpage);
		return "/board/boardFreeWrite";
	}

	//공지게시판 글 작성 으로 가기
	@RequestMapping("announcementWrite")
	public String announcement_write() {
		int cpage = Integer.parseInt((String)request.getParameter("cpage"));
		request.setAttribute("cpage", cpage);
		return "/board/boardAnnouncementWrite";
	}

	//후기게시판 글 작성 으로 가기
	@RequestMapping("reviewWrite")
	public String review_write() {
		int cpage = Integer.parseInt((String)request.getParameter("cpage"));
		request.setAttribute("cpage", cpage);
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
		
		// 게시판에 달린 댓글 가져오기
		List<ReplyAnnouncementDTO> replyList = boardService.selectReplyAnnouncementList(code);
		request.setAttribute("replyList", replyList);
		
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
		
		// 게시판에 달린 댓글 가져오기
		List<ReplyReviewDTO> replyList = boardService.selectReplyReviewList(code);
		request.setAttribute("replyList", replyList);
		
		return "/board/ReviewContent";
	}


	//===============================================================================

	//자유게시판 글 작성하기 - 일반회원,사업자회원
	@RequestMapping("inputFree")
	public String inputFree(BoardFreeDTO dto) {

		int membercode = (int)session.getAttribute("code"); //로그인(작성자의고유 code가져오기)
		boardService.insertFree(dto,membercode);//자유게시판 작성하기

		return "redirect:/board/free?cpage=1"; //자유게시판으로 가기

	}


	//공지게시판 글 작성하기
	@RequestMapping("inputAnnouncement")
	public String inputAnnouncement(BoardAnnouncementDTO dto) {


		int membercode = (int) session.getAttribute("code"); //로그인(작성자의고유 code가져오기)
		boardService.insertAnnouncement(dto,membercode);//공지게시판 작성하기


		return "redirect:/board/announcement?cpage=1"; //공지게시판으로 가기
	}



	//후기게시판 글 작성하기
	@RequestMapping("inputReview")
	public String inputReview(BoardReviewDTO dto) {

		int membercode = (int) session.getAttribute("code"); //로그인한 사람의 ID code 가져오기 
		dto.setMemberCode(membercode);



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

		int result = boardService.updateFree(dto); 
		return result;

	}



	//공지게시판 글 수정
	@ResponseBody
	@RequestMapping("updateAnnouncement")
	public int updateAnnouncement(BoardAnnouncementDTO dto) {
		
		int result = boardService.updateAnnouncement(dto); 
		return result;

	}


	//자유게시판 글 수정
	@ResponseBody
	@RequestMapping("updateReview")
	public int updateReview(BoardReviewDTO dto) {

		int result = boardService.updateReview(dto); 
		return result;

	}

	//===========================================================================================		

	//공지게시판 글 삭제
	@RequestMapping("deleteAnnouncement")
	public String deleteAnnouncement(int cpage) {

		int code =  Integer.parseInt((String)request.getParameter("code"));
		int result = boardService.deleteAnnouncement(code);

		return "redirect: /board/announcement?cpage="+cpage;

	}


	//리뷰게시판 글 삭제
	@RequestMapping("deleteReview")
	public String deleteReview(int cpage) {

		int code =  Integer.parseInt((String)request.getParameter("code"));
		int result = boardService.deleteReview(code); 

		return "redirect: /board/review?cpage="+ cpage;

	}


	//자유게시판 글 삭제
	@RequestMapping("deleteFree")
	public String deleteFree(int cpage) {

		int code =  Integer.parseInt((String)request.getParameter("code"));
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
			return "board/report";

			
		}	
		// 공지사항 게시판 신고페이지로 이동
		@RequestMapping("AnnouncementReport")
		public String AnnouncementReport(ReportDTO dto) {


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
			return "board/report";

			
		}		
		
		//리뷰게시판 댓글 신고페이지로 이동
		@RequestMapping("reviewReplyReport")
		public String reviewReplyReport(ReportDTO dto, String replyMemberName, String replyCompanyName) {
			

			String companyname = (String) session.getAttribute("companyName");

			if(companyname == null) {
				String nickname = (String)	session.getAttribute("nickname");
				request.setAttribute("nickname", nickname);
			}else {
				request.setAttribute("companyname", companyname);
			}//신고자

			String reporteeName = "";
			
			if(replyMemberName == "") {
				reporteeName = replyCompanyName;
			}
			else if(replyCompanyName == "") {
				reporteeName = replyMemberName;
			}
			
			
			request.setAttribute("reporteeName", reporteeName);

			request.setAttribute("list", dto);
			return "board/report";

			
		}	
		
		
		//공지게시판 댓글 신고페이지로 이동
		@RequestMapping("AnnouncementReplyReport")
		public String AnnouncementReplyReport(ReportDTO dto, String replyMemberName, String replyCompanyName) {
			

			String companyname = (String) session.getAttribute("companyName");

			if(companyname == null) {
				String nickname = (String)	session.getAttribute("nickname");
				request.setAttribute("nickname", nickname);
			}else {
				request.setAttribute("companyname", companyname);
			}//신고자

			String reporteeName = "";
			
			if(replyMemberName == "") {
				reporteeName = replyCompanyName;
			}
			else if(replyCompanyName == "") {
				reporteeName = replyMemberName;
			}
			
			
			request.setAttribute("reporteeName", reporteeName);

			request.setAttribute("list", dto);
			return "board/report";

			
		}	




	//===========================================================================================
		
	// 자유게시판 댓글 작성
	@ResponseBody
	@RequestMapping("insertFreeReply")
	public int insertFreeReply(String replyContent, int boardFreeCode, int cpage) {
		
		ReplyFreeDTO dto = new ReplyFreeDTO(0, boardFreeCode, (int) session.getAttribute("code"), replyContent, 0, null, null, null);
		int result = boardService.insertFreeReply(dto);

		return result;
	}
	
	// 후기게시판 댓글 작성
	@ResponseBody
	@RequestMapping("insertReviewReply")
	public int insertReviewReply(String replyContent, int boardReviewCode, int cpage) {
		
		ReplyReviewDTO dto = new ReplyReviewDTO(0, boardReviewCode, (int) session.getAttribute("code"), replyContent, 0, null, null, null);
		int result = boardService.insertReviewReply(dto);
		
		return result;
	}
	
	// 공지사항 게시판 댓글 작성
	@ResponseBody
	@RequestMapping("insertAnnouncementReply")
	public int insertAnnouncementReply(String replyContent, int boardAnnouncementCode, int cpage) {
		
		ReplyAnnouncementDTO dto = new ReplyAnnouncementDTO(0, boardAnnouncementCode, (int) session.getAttribute("code"), replyContent, 0, null, null, null);
		int result = boardService.insertAnnouncementReply(dto);
		
		return result;
	}


	
	//=============================================================================================
	
	// 자유게시판 댓글 수정
	@ResponseBody
	@RequestMapping("updateFreeReply")
	public int updateFreeReply(ReplyFreeDTO dto) {
		
		int result = boardService.updateFreeReply(dto);
		return result;
	}
	
	// 후기게시판 댓글 수정
	@ResponseBody
	@RequestMapping("updateReviewReply")
	public int updateReviewReply(ReplyReviewDTO dto) {
		
		int result = boardService.updateReviewReply(dto);
		return result;
	}
	
	// 공지사항 게시판 댓글 수정
	@ResponseBody
	@RequestMapping("updateAnnouncementReply")
	public int updateAnnouncementReply(ReplyAnnouncementDTO dto) {
		int result = boardService.updateAnnouncementReply(dto);
		return result;
	}
	
	// ============================================================================================
	
	// 자유게시판 댓글 삭제
	@ResponseBody
	@RequestMapping("deleteFreeReply")
	public int deleteFreeReply(ReplyFreeDTO dto) {
		
		int result = boardService.deleteFreeReply(dto);
		return result;
	}
	
	// 후기게시판 댓글 삭제
	@ResponseBody
	@RequestMapping("deleteReviewReply")
	public int deleteReviewReply(ReplyReviewDTO dto) {
		
		int result = boardService.deleteReviewReply(dto);
		return result;
	}
	
	// 공지사항 게시판 댓글 삭제
	@ResponseBody
	@RequestMapping("deleteAnnouncementReply")
	public int deleteAnnouncementReply(ReplyAnnouncementDTO dto) {
		
		int result = boardService.deleteAnnouncementReply(dto);
		return result;
	}
	//=============================================================================================	

	//신고 접수
	@ResponseBody
	@RequestMapping("reportFree")
	public int reportFree(ReportDTO dto) {
		
		int result = boardService.insertReport(dto); 
		return result;

	}
	
	//좋아요수 
	@ResponseBody
	@RequestMapping("LikeCount")
	public int LikeCount(@RequestParam("code") String code, @RequestParam("likeCount") int likeCount,@RequestParam("boardKindCode") int boardKindCode) {

		int result = boardService.updateLikeCount(code,likeCount,boardKindCode);
		return result;
	}
	

//=====================================================================================	

	// 자유게시판 댓글 좋아요 up 
	@ResponseBody
	@RequestMapping("upFreeReplyLikeCount")
	public ReplyFreeDTO upFreeReplyLikeCount(ReplyFreeDTO dto) {
		
		ReplyFreeDTO result = boardService.upFreeReplyLikeCount(dto);
		return result;
	}
	
	// 후기게시판 댓글 좋아요 up
	@ResponseBody
	@RequestMapping("upReviewReplyLikeCount")
	public ReplyReviewDTO upReviewReplyLikeCount(ReplyReviewDTO dto) {
		
		ReplyReviewDTO result = boardService.upReviewReplyLikeCount(dto);
		return result;
	}
	
	// 공지사항 게시판 댓글 좋아요 up
	@ResponseBody
	@RequestMapping("upAnnouncementReplyLikeCount")
	public ReplyAnnouncementDTO upAnnouncementReplyLikeCount(ReplyAnnouncementDTO dto) {
		ReplyAnnouncementDTO result = boardService.upAnnouncementReplyLikeCount(dto);
		return result;
	}
	
			
}
