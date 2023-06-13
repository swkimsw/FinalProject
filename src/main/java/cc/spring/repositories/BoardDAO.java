package cc.spring.repositories;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.BoardAnnouncementDTO;
import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;

@Repository
public class BoardDAO {

	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int selectReviewSeq() {
		return mybatis.selectOne("Board.selectReviewSeq");
	}
	
	public int insertReview(BoardReviewDTO  dto,String writer,int parent_seq) {
		Map<String ,Object> param = new HashMap<>();
		param.put("dto", dto);
		param.put("writer", writer);
		param.put("seq", parent_seq);
		
		return mybatis.insert("Board.insertReview",param);
	}

	public int insertFree(BoardFreeDTO dto, String writer) {
		Map<String ,Object> param = new HashMap<>();
		param.put("dto", dto);
		param.put("writer", writer);
		return mybatis.insert("Board.insertFree",param);
	}

	public int insertAnnouncement(BoardAnnouncementDTO dto, String writer) {
		Map<String ,Object> param = new HashMap<>();
		param.put("dto", dto);
		param.put("writer", writer);
		return  mybatis.insert("Board.insertAnnouncement",param);
	}



}
