package cc.spring.controllers;


import java.io.UnsupportedEncodingException;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.spring.commons.EncryptionUtils;
import cc.spring.dto.BoardFreeDTO;

import cc.spring.dto.MemberDTO;

import cc.spring.services.ClientMyPageService;

@Controller
@RequestMapping("/clientMyPage/")
public class ClientMyPageController {
	@Autowired
	private HttpSession session;

	@Autowired
	private ClientMyPageService cmp;

	@RequestMapping("myPage")
	public String myPageList(Model model) {
		int code = (int) session.getAttribute("code");
		//int code = 11;
		System.out.println("신발");
		System.out.println(code);
		List<BoardFreeDTO> list = cmp.myPageList(code);
		System.out.println(list);
		model.addAttribute("list",list);
		return "/member/myPage";
	}
	
//    @RequestMapping("/study_select.adminBoard")
//    public String clientFreeBoard(HttpServletRequest request, Model model) throws UnsupportedEncodingException {
//        request.setCharacterEncoding("UTF-8");
//        int currentPage = Integer.parseInt(request.getParameter("cpage"));
//        System.out.println("currentPage: " + currentPage);
//
//        // 페이지 번호 검증
//        int totalPage = (int) Math.ceil(cmp.getRecordCount() / (double) Settings.BOARD_RECORD_COUNT_PER_PAGE);
//        if (currentPage < 0) {
//            currentPage = 1;
//        } else if (currentPage > totalPage) {
//            currentPage = totalPage;
//        }
//
//        int start = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE - (Settings.BOARD_RECORD_COUNT_PER_PAGE - 1);
//        int end = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE;
//
//        int first = (currentPage - 1) / Settings.BOARD_NAVI_COUNT_PER_PAGE * Settings.BOARD_NAVI_COUNT_PER_PAGE;
//        int last = (currentPage - 1) / Settings.BOARD_NAVI_COUNT_PER_PAGE * Settings.BOARD_NAVI_COUNT_PER_PAGE + Settings.BOARD_NAVI_COUNT_PER_PAGE + 1;
//
//        System.out.println("start/end: " + start + "/" + end);
//        System.out.println("first/last: " + first + "/" + last);
//        System.out.println("currentPage: " + currentPage);
//
//        List<BoardFreeDTO> list = cmp.selectStudyBoard(start, end);
//        List<String> pageNavi = cmp.getPageNavi(cmp.getRecordCount(), currentPage);
//
//        System.out.println("pageNavi: " + pageNavi);
//
//        model.addAttribute("list", list);
//        model.addAttribute("navi", pageNavi);
//        model.addAttribute("cpage", currentPage);
//        model.addAttribute("start", first);
//        model.addAttribute("end", last);
//
//        return "/admin/admin_StudyBoard";
//    }
	// 내 정보 보기 클릭 시 페이지 이동
	@RequestMapping("clientMyInfo")
	public String myInfo() {
		return "/member/clientMyInfo";
	}
	
	// 비밀번호 입력 시 로그인한 회원의 비밀번호와 일치하는지 확인
	@ResponseBody
	@RequestMapping("checkPw")
	public String checkPw(String pw) throws Exception {
		String enPw = EncryptionUtils.sha512(pw);
		String id = (String) session.getAttribute("id");
		boolean result = cmp.checkPw(id, enPw);
		return String.valueOf(result);
	}
	
	// 입력한 비밀번호 일치 시 회원정보 가져오기
	@ResponseBody
	@RequestMapping("selectClientMemberInfo")
	public MemberDTO selectClientMemberInfo(String id) throws Exception {
		MemberDTO dto = cmp.selectClientMemberInfo(id);
		return dto;
	}
	
	

	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}
	
}
