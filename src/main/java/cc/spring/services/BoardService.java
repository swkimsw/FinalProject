package cc.spring.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	public void insertReview(BoardReviewDTO dto,int membercode,int parent_seq,String realPath,String[] oriName,String[] sysName) {


		boarddao.insertReview(dto,membercode,parent_seq);

		for(int i = 0 ; i<oriName.length ; i++) {

			System.out.println(oriName[i]);  //oriName
			System.out.println(sysName[i]);  //oriName
			System.out.println(realPath); //realpath

			ReviewImgDTO rdto = new ReviewImgDTO(0 , parent_seq , realPath, oriName[i], sysName[i]);
			boarddao.insertReviewImage(rdto); //후기게시판 글에 들어가는 이미지 db넣기

		}

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

	
//====================================================================================
	
	//자유게시판 리스트중 누른 해당 글 가져오기
	public BoardFreeDTO selectFreeContent(int code) {
		return boarddao.selectFreeContent(code);
		
	}

	//공지게시판 리스트중 누른 해당 글 가져오기
	public BoardAnnouncementDTO selectAnnouncementContent(int code) {
		return boarddao.selectAnnouncementContent(code);
	}

	//리뷰게시판 리스트중 누른 해당 글 가져오기
	public BoardReviewDTO selectReviewContent(int code) {
		return boarddao.selectReviewContent(code);
	}


	












}
