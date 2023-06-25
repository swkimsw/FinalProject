package cc.spring.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.dto.MemberDTO;

@Repository
public class ClientMyPageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
//	내가 쓴 자유 게시판 목록
	public List<BoardFreeDTO> selectCode(int code) {
		System.out.println("아니 왜안되는데?");
		return mybatis.selectList("MyPage.freeBoard",code);
	}
// 내가 쓴 후기 게시판 목록	
	public List<BoardReviewDTO> selectReview(int code){
		System.out.println("내가쓴 후기게시판 DAO 실행");
		return mybatis.selectList("MyPage.reView",code);
	}
	public boolean checkPw(String id, String pw) {
		Map<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return mybatis.selectOne("MyPage.checkPw",param);
	}
	
	public MemberDTO selectClientMemberInfo(String id) {
		return mybatis.selectOne("MyPage.selectClientMemberInfo",id);
	}
}
