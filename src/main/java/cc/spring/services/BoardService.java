package cc.spring.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.spring.dto.BoardAnnouncementDTO;
import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.dto.ReplyAnnouncementDTO;
import cc.spring.dto.ReplyFreeDTO;
import cc.spring.dto.ReplyReviewDTO;
import cc.spring.dto.ReportDTO;
import cc.spring.repositories.BoardDAO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boarddao;

	private int recordCountPerPage = 10 ; // 한 페이지당 보여주는 글의 개수
	private int naviCountPerPage = 5 ; // 페이지당 보여줄 네비게이터의 개수

	//=====================================================================================


	//리뷰게시판 글 작성할때 seq가져오기
	public int selectReviewSeq() {
		return boarddao.selectReviewSeq();
	}


	//리뷰 게시판 작성하기												
	public void insertReview(BoardReviewDTO dto) {
		int postCode = boarddao.insertReview(dto);
	}

	//	
	//	리뷰 게시판 작성하기												==postcode
	//	@Transactional
	//	public void insertReview(BoardReviewDTO dto,String realPath,String[] oriName,String[] sysName) {
	//
	//
	//		int postCode = boarddao.insertReview(dto);
	//
	//		for(int i = 0 ; i<oriName.length ; i++) {
	//
	//			System.out.println(oriName[i]);  //oriName
	//			System.out.println(sysName[i]);  //oriName
	//			System.out.println(realPath); //realpath
	//
	//			ReviewImgDTO rdto = new ReviewImgDTO(0 , postCode , realPath, oriName[i], sysName[i]);
	//			boarddao.insertReviewImage(rdto); //후기게시판 글에 들어가는 이미지 db넣기
	//
	//		}
	//
	//	}
	//


	//자유게시판 작성하기
	public int insertFree(BoardFreeDTO dto, int membercode) {
		return boarddao.insertFree(dto, membercode );

	}


	//공지게시판 작성하기
	public int insertAnnouncement(BoardAnnouncementDTO dto,int membercode) {

		return boarddao.insertAnnouncement(dto,membercode);

	}



	//=====================================================================================


	//자유게시판게시글 리스트 조건에 따라 가져오기
	public List<BoardFreeDTO> selectFreelist(int start , int end ) {
		return boarddao.selectFreelist(start,end);
	}


	//자유게시판게시글 리스트 조건에 따라 가져오기 - 체크분류
	public List<BoardFreeDTO> selectFreeChecklist(int start , int end ,int[] check ) {
		return boarddao.selectFreeChecklist(start,end,check);
	}


	//자유게시글 리스트 다 가져오기
	public List<BoardFreeDTO> selectAllFree() {
		return boarddao.selectAllFree();

	}

	//자유게시글 리스트 다 가져오기 - 체크분류
	public List<BoardFreeDTO> selectCheckAllFree(int[] check) {
		return boarddao.selectCheckAllFree(check);

	}

	//자유게시글 리스트 조건에 따라 가져오기 - 검색
	public List<BoardFreeDTO> selectSearchFree(int start , int end , String search, String searchCate) {
		return boarddao.selectSearchFree(start,end,search,searchCate);
	}

	//자유게시글 리스트 다 가져오기 - 검색
	public List<BoardFreeDTO> selectAllSearchFree(String search, String searchCate) {
		return boarddao.selectAllSearchFree(search,searchCate);
	}


	//자유게시글 리스트 조건에 따라 가져오기 - 검색(카테고리 있을때)
	public List<BoardFreeDTO> selectSearchCheckFree(int start , int end , String search, String searchCate ,int[] check) {
		return boarddao.selectSearchCheckFree(start,end,search,searchCate,check);
	}


	//자유게시글 리스트 다 가져오기 - 검색 (카테고리 있을때)
	public List<BoardFreeDTO> selectAllSearchCheckFree(String search, String searchCate,int[] check) {
		return boarddao.selectAllSearchCheckFree(search,searchCate,check);
	}



	//공지사항게시글 리스트 조건에 따라 가져오기
	public List<BoardAnnouncementDTO> selectAnnouncementlist(int start , int end) {
		return boarddao.selectAnnouncementlist(start,end);
	}

	//공지사항게시글 리스트 다 가져오기
	public List<BoardAnnouncementDTO> selectAllAnnouncement() {
		return boarddao.selectAllAnnouncement();
	}

	//공지사항게시글 리스트 조건에 따라 가져오기 - 검색
	public List<BoardAnnouncementDTO> selectSearchAnnounce(int start , int end , String search, String searchCate) {
		return boarddao.selectSearchAnnounce(start,end,search,searchCate);
	}

	//공지사항게시글 리스트 다 가져오기 - 검색
	public List<BoardAnnouncementDTO> selectAllSearchAnnounc(String search, String searchCate) {
		return boarddao.selectAllSearchAnnounc(search,searchCate);
	}


	//리뷰게시글 리스트 조건에 따라 가져오기
	public List<BoardReviewDTO> selectReviewlist(int start, int end) {
		return boarddao.selectReviewlist(start,end);
	}
	//리뷰게시글 리스트 다 가져오기
	public List<BoardReviewDTO> selectAllReview() {
		return boarddao.selectAllReview();
	}

	//리뷰게시글 리스트 조건에 따라 가져오기 - 검색
	public List<BoardReviewDTO> selectSearchReview(int start , int end , String search, String searchCate) {
		return boarddao.selectSearchReview(start,end,search,searchCate);
	}

	//리뷰게시글 리스트 다 가져오기 - 검색
	public List<BoardReviewDTO> selectAllSearchReview(String search, String searchCate) {
		return boarddao.selectAllSearchReview(search,searchCate);
	}


	//====================================================================================


	//자유게시판 리스트중 누른 해당 글 가져오기
	@Transactional
	public BoardFreeDTO selectFreeContent(int code,boolean viewchoose) {

		int boardKindCode = 1002 ;
		boarddao.insertViewCount(code,boardKindCode,viewchoose);

		return boarddao.selectFreeContent(code);
	}

	//공지게시판 리스트중 누른 해당 글 가져오기
	@Transactional
	public BoardAnnouncementDTO selectAnnouncementContent(int code,boolean viewchoose) {

		int boardKindCode = 1001 ;
		boarddao.insertViewCount(code,boardKindCode,viewchoose);

		return boarddao.selectAnnouncementContent(code);
	}

	//리뷰게시판 리스트중 누른 해당 글 가져오기
	@Transactional
	public BoardReviewDTO selectReviewContent(int code,boolean viewchoose) {

		int boardKindCode = 1003 ;
		boarddao.insertViewCount(code,boardKindCode,viewchoose);

		return boarddao.selectReviewContent(code);
	}


	// 네비게이터를 만들기 위해 필요한 초기정보
	public List<String> selectPageNavi(int recordTotalCount , int cpage) throws Exception {

		int pageTotalCount = 0; // 총 페이지의 개수

		if (recordTotalCount % recordCountPerPage > 0) { //총 네비게이터 
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (cpage < 1) { //현재 페이지 설정
			cpage = 1;
		} else if (cpage > pageTotalCount) {
			cpage = pageTotalCount;
		}

		int startNavi = (cpage - 1) / naviCountPerPage * naviCountPerPage + 1; // 네비게이터 시작 값
		int endNavi = startNavi + (naviCountPerPage - 1); // 네비게이터 끝 값

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}
		List<String> list = new ArrayList<>();



		if (needPrev) {


			// sb.append("<a href='/list.board?cpage=" + (startNavi - 1) + "'> < </a> ");
			list.add("<");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			// sb.append("<a href='/list.board?cpage=" + i + "'>" + i + "</a> ");
			list.add(Integer.toString(i));
		}

		if (needNext) {
			// sb.append("<a href='/list.board?cpage=" + (endNavi + 1) + "'> > </a> ");
			list.add(">");
		}
		return list;
	}

	//자유게시판 게시물 수정
	public int updateFree(BoardFreeDTO dto) {

		return boarddao.updateFree(dto);

	}
	//공지게시판 게시물 수정
	public int updateAnnouncement(BoardAnnouncementDTO dto) {
		return boarddao.updateAnnouncement(dto);
	}

	//리뷰게시판 게시물 수정
	public int updateReview(BoardReviewDTO dto) {
		return boarddao.updateReview(dto);
	}

	//공지게시판 게시물 삭제
	public int deleteAnnouncement(int code) {
		return boarddao.deleteAnnouncement(code);
	}

	//리뷰게시판 게시물 삭제
	public int deleteReview(int code) {
		return boarddao.deleteReview(code);
	}

	//자유게시판 게시물 삭제
	public int deleteFree(int code) {
		return boarddao.deleteFree(code);
	}

	//신고당한사람 이름찾기
	public String selectReporteeName(int reporteeCode,int authGradeCode) {
		return boarddao.selectReporteeName(reporteeCode,authGradeCode);
	}

	//신고하기
	public int insertReport(ReportDTO dto) {

		return boarddao.insertReport(dto);
	}


	// 좋아요 수 증가
	public int updateLikeCount(String code,int likeCount,int boardKindCode) {
		return boarddao.updateLikeCount(code,likeCount,boardKindCode);
	}



	// =======================================================================================

	// 자유게시판 댓글 입력 
	public int insertFreeReply(ReplyFreeDTO dto) {
		return boarddao.insertFreeReply(dto);
	}

	// 자유게시판 댓글 가져오기
	public List<ReplyFreeDTO> selectReplyFreeList(int postCode) {
		return boarddao.selectReplyFreeList(postCode);
	}

	// 후기게시판 댓글 입력
	public int insertReviewReply(ReplyReviewDTO dto) {
		return boarddao.insertReviewReply(dto);
	}

	// 후기게시판 댓글 가져오기
	public List<ReplyReviewDTO> selectReplyReviewList(int postCode) {
		return boarddao.selectReplyReviewList(postCode);
	}

	
	// 공지사항 게시판 댓글 입력
	public int insertAnnouncementReply(ReplyAnnouncementDTO dto) {
		return boarddao.insertAnnouncementReply(dto);
	}
	
	// 공지사항 게시판 댓글 가져오기
	public List<ReplyAnnouncementDTO> selectReplyAnnouncementList(int postCode) {
		return boarddao.selectReplyAnnouncementList(postCode);
	}



	// ===============================================================================================

	// 자유게시판 댓글 수정
	public int updateFreeReply(ReplyFreeDTO dto) {
		return boarddao.updateFreeReply(dto);
	}

	// 후기게시판 댓글 수정
	public int updateReviewReply(ReplyReviewDTO dto) {
		return boarddao.updateReviewReply(dto);
	}
	
	// 공지사항 게시판 댓글 수정
	public int updateAnnouncementReply(ReplyAnnouncementDTO dto) {
		return boarddao.updateAnnouncementReply(dto);
	}



	// ================================================================================================

	// 자유게시판 댓글 삭제
	public int deleteFreeReply(ReplyFreeDTO dto) {
		return boarddao.deleteFreeReply(dto);
	}

	// 후기게시판 댓글 삭제
	public int deleteReviewReply(ReplyReviewDTO dto) {
		return boarddao.deleteReviewReply(dto);
	}
	
	// 공지사항 게시판 댓글 삭제
	public int deleteAnnouncementReply(ReplyAnnouncementDTO dto) {
		return boarddao.deleteAnnouncementReply(dto);
	}


	// =================================================================================================

	// 자유게시판 댓글 좋아요 up, 좋아요 누른 후 좋아요 수 가져오기
	@Transactional
	public ReplyFreeDTO upFreeReplyLikeCount(ReplyFreeDTO dto) {
		boarddao.upFreeReplyLikeCount(dto);
		return boarddao.selectFreeReplyLikeCount(dto); 
	}

	// 후기게시판 댓글 좋아요 up, 좋아요 누른 후 좋아요 수 가져오기
	@Transactional
	public ReplyReviewDTO upReviewReplyLikeCount(ReplyReviewDTO dto) {
		boarddao.upReviewReplyLikeCount(dto);
		return boarddao.selectReviewReplyLikeCount(dto);
	}
	
	// 공지사항 게시판 댓글 좋아요 up, 좋아요 누른 후 좋아요 수 가져오기
	@Transactional
	public ReplyAnnouncementDTO upAnnouncementReplyLikeCount(ReplyAnnouncementDTO dto) {
		boarddao.upAnnouncementReplyLikeCount(dto);
		return boarddao.selectAnnouncementReplyLikeCount(dto);
	}


}
