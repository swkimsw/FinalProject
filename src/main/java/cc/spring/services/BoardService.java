package cc.spring.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.spring.dto.BoardAnnouncementDTO;
import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.dto.ReplyFreeDTO;
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
	public List<BoardFreeDTO> selectFreelist(int start , int end) {
		return boarddao.selectFreelist(start,end);
	}
	//자유게시글 리스트 다 가져오기
	public List<BoardFreeDTO> selectAllFree() {
		return boarddao.selectAllFree();

	}

	//자유게시글 리스트 조건에 따라 가져오기 - 검색
		public List<BoardFreeDTO> selectSearchFree(int start , int end , String search, String searchCate) {
			return boarddao.selectSearchFree(start,end,search,searchCate);
		}

		//자유게시글 리스트 다 가져오기 - 검색
		public List<BoardFreeDTO> selectAllSearchFree(String search, String searchCate) {
			return boarddao.selectAllSearchFree(search,searchCate);
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

	
	
	public List<String> selectPageNavi(int recordTotalCount , int cpage) throws Exception {
	    // 네비게이터를 만들기 위해 필요한 초기정보
	    
	    

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
	  System.out.println(list);
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


	public int deleteAnnouncement(int code) {
		return boarddao.deleteAnnouncement(code);
	}


	public int deleteReview(int code) {
		return boarddao.deleteReview(code);
	}


	public int deleteFree(int code) {
		return boarddao.deleteFree(code);
	}


	public String selectReporteeName(int reporteeCode,int authGradeCode) {
		return boarddao.selectReporteeName(reporteeCode,authGradeCode);
	}


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
	










}
