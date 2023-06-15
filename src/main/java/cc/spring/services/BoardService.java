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

//	//로그인한사람의 id의 authgrade 가져오기 - 일반회원
//	public int selectClientAuthgrade(String user) {
//		return boarddao.selectClientAuthgrade(user);
//	}
//
//	//로그인한사람의 id의 authgrade 가져오기 - 사업자회원
//	public int selectBusinessAuthgrade(String user) {
//		return boarddao.selectBusinessAuthgrade(user);
//
//	}
//	//로그인한사람의 id의 authgrade 가져오기 - 관리자회원
//	public int selectAdminAuthgrade(String user) {
//		return boarddao.selectAdminAuthgrade(user);
//
//	}

	//로그인한사람이 관리자회원이면 1반환
	public int selectAdminresult(String user) {
		return boarddao.selectAdminresult(user);

	}

	//로그인한사람이 일반회원이면 1반환
	public int selectClientresult(String user) {
		return boarddao.selectClientresult(user);
	}
	
	
	public int selectClientSeq(String writer) {
		return boarddao.selectClientSeq(writer);
	}

	public int selectBusinessSeq(String writer) {
		return boarddao.selectBusinessSeq(writer);
	}
	
	
	//리뷰게시판 글 작성할때 seq가져오기
	public int selectReviewSeq() {
		return boarddao.selectReviewSeq();
	}

	//리뷰 게시판 작성하기
	public int insertReview(BoardReviewDTO dto,String writer,int parent_seq) {
		return boarddao.insertReview(dto,writer,parent_seq);

	}


	//자유게시판 작성하기
	public int insertFree(BoardFreeDTO dto, int writer_seq) {
		return boarddao.insertFree(dto,writer_seq);

	}
	

	//공지게시판 작성하기
	public int insertAnnouncement(BoardAnnouncementDTO dto, String writer) {
		return boarddao.insertAnnouncement(dto,writer);

	}

	


}
