package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.BoardAnnouncementDTO;
import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.repositories.BoardDAO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boarddao;
	
	
//리뷰게시판 글 작성할때 seq가져오기
	public int selectReviewSeq() {
		return boarddao.selectReviewSeq();
	}

	//리뷰 게시판 작성하기
	public int insertReview(BoardReviewDTO dto,String writer,int parent_seq) {
		return boarddao.insertReview(dto,writer,parent_seq);
		
	}


	//자유게시판 작성하기
	public int insertFree(BoardFreeDTO dto, String writer) {
		return boarddao.insertFree(dto,writer);
		
	}
	
	//공지게시판 작성하기
	public int insertAnnouncement(BoardAnnouncementDTO dto, String writer) {
		return boarddao.insertAnnouncement(dto,writer);
		
	}



}
