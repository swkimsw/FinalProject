package cc.spring.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.dto.MemberDTO;
import cc.spring.repositories.MyPageDAO;

@Service
public class MyPageService {

	@Autowired
	private MyPageDAO cmdao;
	//클라이언트 마이페이지 자유게시판 서비스
	public List<BoardFreeDTO> myPageList(int code) {
		System.out.println("마이페이지 자유게시판");
		return cmdao.selectCode(code);
}
	//클라이언트 마이페이지 후기게시판 서비스 
	public List<BoardReviewDTO> myPageReview(int code){
		System.out.println("마이페이지 후기게시판 서비스");
		return cmdao.selectReview(code);
	}
	//비지니스 마이페이지 자유게시판 서비스
	public List<BoardFreeDTO> businessMypageList(int code){
		System.out.println("비지니스 자유게시판 서비스");
	return cmdao.businessSelectReview(code);
	}
	
	public boolean checkPw(String id, String pw) {
		return cmdao.checkPw(id, pw);
	}
	public MemberDTO selectClientMemberInfo(String id) {
		return cmdao.selectClientMemberInfo(id);
	}
}
