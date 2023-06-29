package cc.spring.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.BoardAnnouncementDTO;
import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.dto.ReplyFreeDTO;
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

	public List<BoardFreeDTO> selectAllFree() {
		return  mybatis.selectList("Board.selectAllFree");
	}

	
	//공지게시판 글 조건에 따라 가져오기	
	public List<BoardAnnouncementDTO> selectAnnouncementlist(int start,int end) {
		Map<String ,Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return  mybatis.selectList("Board.selectAnnouncementlist",param);
	}
	
	public List<BoardAnnouncementDTO> selectAllAnnouncement() {
		return  mybatis.selectList("Board.selectAllAnnouncement");
	}
	
	//공지게시판 글 조건에 따라 가져오기 - 검색
	public List<BoardAnnouncementDTO> selectSearchAnnouncelist(int start,int end,String search, String searchCate) {
		
		
		Map<String ,Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("search", search );
		
		if(searchCate.equals("제목")) { //검색카테고리가 제목일때
			return  mybatis.selectList("Board.selectTitleAnnouncementlist",param);
		}else { // 검색 카테고리가 작성자일때
			return  mybatis.selectList("Board.selectMemberAnnouncementlist",param);
		}
		
	}
	
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


	public List<BoardReviewDTO> selectAllReview() {
		return  mybatis.selectList("Board.selectAllReview");
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




	
	





	


	







}
