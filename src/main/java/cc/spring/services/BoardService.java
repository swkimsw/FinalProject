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

	//로그인한사람이 관리자회원이면 1반환
	public int selectAdminresult(String user) {
		return boarddao.selectAdminresult(user);

	}

	//로그인한사람이 일반회원이면 1반환
	public int selectClientresult(String user) {
		return boarddao.selectClientresult(user);
	}

//=====================================================================================
	
//	//자유게시판 글 작성할때 작성자가 일반회원인 사람의 seq가져오기
//	public int selectClientSeq(String writer) {
//		return boarddao.selectClientSeq(writer);
//	}
//	//자유게시판 글 작성할때 작성자가 사업자회원인 사람의 seq가져오기
//	public int selectBusinessSeq(String writer) {
//		return boarddao.selectBusinessSeq(writer);
//	}
//
//	//공지게시판 글 작성할때 작성자가 관리자회원인 사람의 seq가져오기
//	public int selectAdminSeq(String writer) {
//		return boarddao.selectAdminSeq(writer);
//	}

	//todtalmember테이블에 se.nextval가져오려는거
	public int selectTotalCode() {
		return boarddao.selectTotalCode();
	}


	//totalmember테이블에 값 집어넣기 - 일반회원
	public int insertTotalMemberClient(int member, int authgradecode ,int code) {
		TotalMemberDTO dto = new TotalMemberDTO(code , member , 0, authgradecode);
		return boarddao.insertTotalMemberClient(dto);

	}

	//totalmember테이블에 값 집어넣기 - 사업자회원
	public int insertTotalMemberBusiness(int member, int authgradecode,int code) {
		TotalMemberDTO dto = new TotalMemberDTO(code , 0 , member, authgradecode);
		return boarddao.insertTotalMemberBusiness(dto);

	}

	//totalmember테이블에서 code빼오기
	public int selectCodeTotal(int member,int authgradecode,int code) {
		return boarddao.selectCodeTotal(member,authgradecode,code);
	}

	//=====================================================================================


	//리뷰게시판 글 작성할때 seq가져오기
	public int selectReviewSeq() {
		return boarddao.selectReviewSeq();
	}

	//리뷰 게시판 작성하기												==postcode
	public void insertReview(BoardReviewDTO dto,int writer_seq,int parent_seq) {
		boarddao.insertReview(dto,writer_seq,parent_seq);

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
	public int insertAnnouncement(BoardAnnouncementDTO dto) {
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		return boarddao.insertAnnouncement(dto);

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
