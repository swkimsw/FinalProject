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
import cc.spring.dto.TotalMemberDTO;

@Repository
public class BoardDAO {

	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	

//	public int selectClientAuthgrade(String user) {
//		return mybatis.selectOne("Board.selectClientAuthgrade",user);
//	}
//
//
//	public int selectBusinessAuthgrade(String user) {
//		return mybatis.selectOne("Board.selectBusinessAuthgrade",user);
//	}
//	
//	public int selectAdminAuthgrade(String user) {
//		return mybatis.selectOne("Board.selectAdminAuthgrade",user);
//	}

	
	public int selectAdminresult(String user) {
		return mybatis.selectOne("Board.selectAdminresult",user);
	}

	
	
	public int selectClientresult(String user) {
		return mybatis.selectOne("Board.selectClientresult",user);
	}

	
	

	public int selectClientSeq(String writer) {
		return mybatis.selectOne("Board.selectClientSeq",writer);
	}

	public int selectBusinessSeq(String writer) {
		return mybatis.selectOne("Board.selectBusinessSeq",writer);
	}

	public int selectAdminSeq(String writer) {
		return mybatis.selectOne("Board.selectAdminSeq",writer);
	}
	

	public int selectTotalCode() {
		return  mybatis.selectOne("Board.selectTotalCode");
	}
	
	public int insertTotalMemberClient(TotalMemberDTO dto) {
		return  mybatis.insert("Board.insertTotalMemberClient",dto);
	}

	public int insertTotalMemberBusiness(TotalMemberDTO dto) {
		return  mybatis.insert("Board.insertTotalMemberBusiness",dto);
	}
	
	
	public int selectCodeTotal(int member, int authgradecode,int code) {
		Map<String ,Object > param = new HashMap<>();
		param.put("member", member);
		param.put("authgradecode" , authgradecode);
		param.put("code" , code);
		return  mybatis.selectOne("Board.selectCodeTotal",param);
	}
	
	public int selectReviewSeq() {
		return mybatis.selectOne("Board.selectReviewSeq");
	}
	
	public int insertReview(BoardReviewDTO  dto,int writer_seq,int parent_seq) {
		Map<String ,Object> param = new HashMap<>();
		param.put("dto", dto);
		param.put("writer_seq", writer_seq);
		param.put("seq", parent_seq);
		
		return mybatis.insert("Board.insertReview",param);
	}

	public int insertFree(BoardFreeDTO dto, int membercode) {
		System.out.println(dto.getContent());
		System.out.println(dto.getHeadlinecode());
		System.out.println(dto.getTitle());
		Map<String ,Object> param = new HashMap<>();
		param.put("dto", dto);
		param.put("membercode", membercode);
		return mybatis.insert("Board.insertFree",param);
	}

	public int insertAnnouncement(BoardAnnouncementDTO dto) {
		return  mybatis.insert("Board.insertAnnouncement",dto);
	}



	public List<BoardFreeDTO> selectFreelist() {
		return  mybatis.selectList("Board.selectFreelist");
	}






	


	







}
