package cc.spring.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.BoardAnnouncementDTO;
import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.dto.ReviewImgDTO;
import cc.spring.dto.TotalMemberDTO;
import cc.spring.repositories.BoardDAO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boarddao;


	//=====================================================================================


	//리뷰게시판 글 작성할때 seq가져오기
	public int selectReviewSeq() {
		return boarddao.selectReviewSeq();
	}

	//리뷰 게시판 작성하기												==postcode
	public void insertReview(BoardReviewDTO dto,int membercode,int parent_seq) {
		boarddao.insertReview(dto,membercode,parent_seq);

	}

	//리뷰게시판- 이미지 작성
	public void insertReviewImage(int postcode,String path,String oriname,String sysname) {
		ReviewImgDTO rdto = new ReviewImgDTO(0 , postcode, path, oriname, sysname);
		boarddao.insertReviewImage(rdto);
	}


	//자유게시판 작성하기
	public int insertFree(BoardFreeDTO dto, int membercode) {
		return boarddao.insertFree(dto, membercode );

	}


	//공지게시판 작성하기
	public int insertAnnouncement(BoardAnnouncementDTO dto,int membercode) {
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		return boarddao.insertAnnouncement(dto,membercode);

	}



//=====================================================================================

	//자유게시글 리스트 다 가져오기
	public List<BoardFreeDTO> selectFreelist() {
		return boarddao.selectFreelist();

	}

	//공지사항게시글 리스트 다 가져오기
	public List<BoardAnnouncementDTO> selectAnnouncementlist() {
		return boarddao.selectAnnouncementlist();

	}
	//리뷰게시글 리스트 다 가져오기
	public List<BoardReviewDTO> selectReviewlist() {
		return boarddao.selectReviewlist();
	}


	












}
