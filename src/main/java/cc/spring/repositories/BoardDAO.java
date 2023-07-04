package cc.spring.repositories;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.BoardAnnouncementDTO;
import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.dto.ReplyAnnouncementDTO;
import cc.spring.dto.ReplyFreeDTO;
import cc.spring.dto.ReplyReviewDTO;
import cc.spring.dto.ReportDTO;
import cc.spring.dto.ReviewImgDTO;

@Repository
public class BoardDAO {


	@Autowired
	private SqlSessionTemplate mybatis;





	//===========================================================================================


	public int selectReviewSeq() {
		return mybatis.selectOne("Board.selectReviewSeq");
	}

	public int insertReview(BoardReviewDTO dto) {

		mybatis.insert("Board.insertReview",dto);
		return dto.getCode();
	}

	public int insertReviewImage(ReviewImgDTO rdto) {
		return mybatis.insert("Board.insertReviewImage", rdto);
	}

	
	
	public int insertFree(BoardFreeDTO dto, int membercode) {
		Map<String ,Object> param = new HashMap<>();
		param.put("dto", dto);
		param.put("membercode", membercode);
		return mybatis.insert("Board.insertFree",param);
	}

	public int insertAnnouncement(BoardAnnouncementDTO dto,int membercode) {
		Map<String ,Object> param = new HashMap<>();
		param.put("dto", dto);
		param.put("membercode", membercode);
		return  mybatis.insert("Board.insertAnnouncement",param);
	}


	//자유게시판 글 조건에 따라 가져오기	
	public List<BoardFreeDTO> selectFreelist(int start, int end) {
		Map<String ,Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return  mybatis.selectList("Board.selectFreelist",param);
	}

	//자유게시판 전부 가져오기
	public List<BoardFreeDTO> selectAllFree() {
		return  mybatis.selectList("Board.selectAllFree");
	}


	//자유게시판 글 조건에 따라 가져오기 - check분류
	public List<BoardFreeDTO> selectFreeChecklist(int start, int end,int[] check) {
		Map<String ,Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);


		if (check.length == 1) {//체크가 한개일때
			int headLineCode = check[0];
			param.put("headLineCode", headLineCode);
			return mybatis.selectList("Board.selectFreeChecklist", param);
		} else {//체크가 여러개일때
			List<Integer> headLineCodes = new ArrayList<>();
			for (int i = 0; i < check.length; i++) {
				headLineCodes.add(check[i]);
			}
			param.put("headLineCodes", headLineCodes);
			return mybatis.selectList("Board.selectFreeCheckslist", param);
		}
	}

	//자유게시판 전부 가져오기 - check분류	
	public List<BoardFreeDTO> selectCheckAllFree(int[] check) {


		if (check.length == 1) {//체크가 한개일때
			int headLineCode = check[0];
			return mybatis.selectList("Board.selectCheckAllFree", headLineCode);
		} else {//체크가 여러개일때
			List<Integer> headLineCodes = new ArrayList<>();
			for (int i = 0; i < check.length; i++) {
				headLineCodes.add(check[i]);
			}

			return mybatis.selectList("Board.selectChecksAllFree", headLineCodes);
		}
	}




	//자유게시판 글 조건에 따라 가져오기 - 검색
	public List<BoardFreeDTO> selectSearchFree(int start,int end,String search, String searchCate) {


		Map<String ,Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("search", search );

		if(searchCate.equals("제목")) { //검색카테고리가 제목일때
			return  mybatis.selectList("Board.selectTitleFree",param);
		}else { // 검색 카테고리가 작성자일때
			return  mybatis.selectList("Board.selectMemberFree",param);
		}

	}
	//자유게시판 글 전부 가져오기 - 검색
	public List<BoardFreeDTO> selectAllSearchFree(String search, String searchCate) {


		if(searchCate.equals("제목")) { //검색카테고리가 제목일때
			return  mybatis.selectList("Board.selectAllTitleFree",search);
		}else { // 검색 카테고리가 작성자일때
			return  mybatis.selectList("Board.selectAllMemberFree",search);
		}

	}

	//자유게시판 글 조건에 따라 가져오기 - 검색(체크분류o)
	public List<BoardFreeDTO> selectSearchCheckFree(int start,int end,String search, String searchCate,int[] check) {

		Map<String ,Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("search", search );

		List<Integer> headLineCodes = new ArrayList<>();
		for (int i = 0; i < check.length; i++) {
			headLineCodes.add(check[i]);
		}
		param.put("headLineCodes", headLineCodes);
		
		if(searchCate.equals("제목")) { //검색카테고리가 제목일때
			return  mybatis.selectList("Board.selectTitleCheckFree",param);
		}else { // 검색 카테고리가 작성자일때
			return  mybatis.selectList("Board.selectMemberCheckFree",param);
		}
	}

	//자유게시판 글 조전부가져오기 - 검색(체크분류o)
	public List<BoardFreeDTO> selectAllSearchCheckFree(String search, String searchCate,int[] check) {
		Map<String ,Object> param = new HashMap<>();
		param.put("search", search);
		param.put("headLineCode", check);

		if(searchCate.equals("제목")) { //검색카테고리가 제목일때
			return  mybatis.selectList("Board.selectAllTitleCheckFree",param);
		}else { // 검색 카테고리가 작성자일때
			return  mybatis.selectList("Board.selectAllMemberCheckFree",param);
		}

	}


	//공지게시판 글 조건에 따라 가져오기	
	public List<BoardAnnouncementDTO> selectAnnouncementlist(int start,int end) {
		Map<String ,Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return  mybatis.selectList("Board.selectAnnouncementlist",param);
	}
	//공지게시판 전부 가져오기
	public List<BoardAnnouncementDTO> selectAllAnnouncement() {
		return  mybatis.selectList("Board.selectAllAnnouncement");
	}

	//공지게시판 글 조건에 따라 가져오기 - 검색
	public List<BoardAnnouncementDTO> selectSearchAnnounce(int start,int end,String search, String searchCate) {


		Map<String ,Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("search", search );

		if(searchCate.equals("제목")) { //검색카테고리가 제목일때
			return  mybatis.selectList("Board.selectTitleAnnouncement",param);
		}else { // 검색 카테고리가 작성자일때
			return  mybatis.selectList("Board.selectMemberAnnouncement",param);
		}

	}
	
	//공지게시판 전부 가져오기 - 검색
	public List<BoardAnnouncementDTO> selectAllSearchAnnounc(String search, String searchCate) {


		if(searchCate.equals("제목")) { //검색카테고리가 제목일때
			return  mybatis.selectList("Board.selectAllTitleAnnounc",search);
		}else { // 검색 카테고리가 작성자일때
			return  mybatis.selectList("Board.selectAllMemberAnnounce",search);
		}

	}


	//리뷰게시판 글 조건에 따라 가져오기	
	public List<BoardReviewDTO> selectReviewlist(int start, int end) {
		Map<String ,Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return  mybatis.selectList("Board.selectReviewlist",param);
	}

	//리뷰게시판 전부 가져오기
	public List<BoardReviewDTO> selectAllReview() {
		return  mybatis.selectList("Board.selectAllReview");
	}


	//리뷰게시판 글 조건에 따라 가져오기 - 검색
	public List<BoardReviewDTO> selectSearchReview(int start,int end,String search, String searchCate) {


		Map<String ,Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("search", search );

		if(searchCate.equals("제목")) { //검색카테고리가 제목일때
			return  mybatis.selectList("Board.selectTitleReviewlist",param);
		}else { // 검색 카테고리가 작성자일때
			return  mybatis.selectList("Board.selectMemberReviewlist",param);
		}
	}
	
	//리뷰게시판 전부 가져오기- 검색
	public List<BoardReviewDTO> selectAllSearchReview(String search, String searchCate) {

		if(searchCate.equals("제목")) { //검색카테고리가 제목일때
			return  mybatis.selectList("Board.selectAllTitleReview",search);
		}else { // 검색 카테고리가 작성자일때
			return  mybatis.selectList("Board.selectAllMemberReview",search);
		}

	}


	//=====================================================================

	public void insertViewCount(int code,int boardKindCode,boolean viewchoose) {
		if(viewchoose) {

			if(boardKindCode == 1001) {
				mybatis.update("Board.updateAnnouncementView",code);
			}else if(boardKindCode ==1002 ) {
				mybatis.update("Board.updateFreeView",code);
			}else {
				mybatis.update("Board.updateReviewView",code);
			}

		}
	}


	public BoardFreeDTO selectFreeContent(int code) {
		return  mybatis.selectOne("Board.selectFreeContent",code);
	}



	public BoardAnnouncementDTO selectAnnouncementContent(int code) {
		return  mybatis.selectOne("Board.selectAnnouncementContent",code);
	}


	public BoardReviewDTO selectReviewContent(int code) {
		return  mybatis.selectOne("Board.selectReviewContent",code);
	}



	public int updateFree(BoardFreeDTO dto) {
		return mybatis.update("Board.updateFree",dto);
	}



	public int updateAnnouncement(BoardAnnouncementDTO dto) {
		return mybatis.update("Board.updateAnnouncement",dto);
	}



	public int updateReview(BoardReviewDTO dto) {
		return mybatis.update("Board.updateReview",dto);
	}



	public int deleteAnnouncement(int code) {
		return mybatis.delete("Board.deleteAnnouncement",code);
	}



	public int deleteReview(int code) {
		return mybatis.delete("Board.deleteReview",code);
	}



	public int deleteFree(int code) {
		return mybatis.delete("Board.deleteFree",code);
	}



	public String selectReporteeName(int reporteeCode,int authGradeCode) {

		if (authGradeCode == 1003) {
			//사람nickname
			return mybatis.selectOne("Board.selectReporteeNickname", reporteeCode);
		} else {
			//회사이름
			return mybatis.selectOne("Board.selectReporteeCompanyName", reporteeCode);
		}
	}



	public int insertReport(ReportDTO dto) {
		return mybatis.insert("Board.insertReport",dto);
	}


	public int updateLikeCount(String code,int likeCount,int boardKindCode) {


		Map<String ,Object> param = new HashMap<>();
		param.put("code", code);
		param.put("likeCount", likeCount);


		if(boardKindCode == 1001) {
			return mybatis.insert("Board.updateAnnouncementLike",param);
		}else if(boardKindCode == 1002) {
			return mybatis.insert("Board.updateFreeLike",param);
		}else {
			return mybatis.insert("Board.updateReviewLike",param);
		}

	}


	// =======================================================================================


	// 자유게시판 댓글입력
	public int insertFreeReply(ReplyFreeDTO dto) {
		return mybatis.insert("Board.insertFreeReply", dto);
	}

	// 자유게시판 댓글 가져오기
	public List<ReplyFreeDTO> selectReplyFreeList(int postCode) {
		return mybatis.selectList("Board.selectReplyFreeList",postCode);
	}

	// 후기게시판 댓글입력
	public int insertReviewReply(ReplyReviewDTO dto) {
		return mybatis.insert("Board.insertReviewReply", dto);
	}

	// 후기게시판 댓글 가져오기
	public List<ReplyReviewDTO> selectReplyReviewList(int postCode) {
		return mybatis.selectList("Board.selectReplyReviewList", postCode);
	}
	
	// 공지사항 게시판 댓글입력
	public int insertAnnouncementReply(ReplyAnnouncementDTO dto) {
		return mybatis.insert("Board.insertAnnouncementReply", dto);
	}
	
	// 공지사항 게시판 댓글 가져오기
	public List<ReplyAnnouncementDTO> selectReplyAnnouncementList(int postCode) {
		return mybatis.selectList("Board.selectReplyAnnouncementList", postCode);
	}



	// =================================================================================================

	// 자유게시판 댓글 수정
	public int updateFreeReply(ReplyFreeDTO dto) {
		return mybatis.update("Board.updateFreeReply", dto);
	}

	// 후기게시판 댓글 수정
	public int updateReviewReply(ReplyReviewDTO dto) {
		return mybatis.update("Board.updateReviewReply", dto);
	}



	// ==================================================================================================


	
	// 공지사항 게시판 댓글 수정
	public int updateAnnouncementReply(ReplyAnnouncementDTO dto) {
		return mybatis.update("Board.updateAnnouncementReply", dto);
	}
	
	
// ==================================================================================================
	

	// 자유게시판 댓글 삭제
	public int deleteFreeReply(ReplyFreeDTO dto) {
		return mybatis.delete("Board.deleteFreeReply", dto);
	}

	// 후기게시판 댓글 삭제
	public int deleteReviewReply(ReplyReviewDTO dto) {
		return mybatis.delete("Board.deleteReviewReply", dto);
	}
	
	// 공지사항 게시판 댓글 삭제
	public int deleteAnnouncementReply(ReplyAnnouncementDTO dto) {
		return mybatis.delete("Board.deleteAnnouncementReply", dto);
	}


	// ==================================================================================================

	// 자유게시판 댓글 좋아요 up
	public int upFreeReplyLikeCount(ReplyFreeDTO dto) {
		return mybatis.update("Board.upFreeReplyLikeCount", dto);
	}

	// 자유게시판 댓글의 좋아요 수 가져오기
	public ReplyFreeDTO selectFreeReplyLikeCount(ReplyFreeDTO dto) {
		return mybatis.selectOne("Board.selectReplyLikeCount",dto);
	}

	// 후기게시판 댓글 좋아요 up
	public int upReviewReplyLikeCount(ReplyReviewDTO dto) {
		return mybatis.update("Board.upReviewReplyLikeCount", dto);
	}

	// 후기게시판 댓글의 좋아요 수 가져오기
	public ReplyReviewDTO selectReviewReplyLikeCount(ReplyReviewDTO dto) {
		return mybatis.selectOne("Board.selectReviewReplyLikeCount", dto);
	}
	
	// 공지사항 게시판 댓글 좋아요 up
	public int upAnnouncementReplyLikeCount(ReplyAnnouncementDTO dto) {
		return mybatis.update("Board.upAnnouncementReplyLikeCount", dto);
	}
	
	// 공지사항 게시판 댓글의 좋아요 수 가져오기
	public ReplyAnnouncementDTO selectAnnouncementReplyLikeCount(ReplyAnnouncementDTO dto) {
		return mybatis.selectOne("Board.selectAnnouncementReplyLikeCount", dto);
	}


}
