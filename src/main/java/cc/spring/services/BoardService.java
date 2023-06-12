package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.repositories.BoardDAO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boarddao;
	
	

	public int selectReviewSeq() {
		return boarddao.selectReviewSeq();
	}

	
	public int insertReview(BoardReviewDTO dto,String writer,int parent_seq) {
		return boarddao.insertReview(dto,writer,parent_seq);
		
	}



}
