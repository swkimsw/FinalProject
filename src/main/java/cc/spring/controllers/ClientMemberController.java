package cc.spring.controllers;


import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cc.spring.commons.EncryptionUtils;
import cc.spring.dto.ClientMemberDTO;
import cc.spring.services.ClientMemberService;
import cc.spring.services.SmsService;

@Controller
@RequestMapping("/clientMember/")
public class ClientMemberController {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ClientMemberService cms;
	
	
	// 클라이언트 로그인 창으로 이동
	@RequestMapping("login_form")
	public String login_form() throws Exception {
		return "member/clientLogin";
	}

	// 클라이언트 로그인
	@RequestMapping("login")
	public String login(ClientMemberDTO dto, RedirectAttributes redir) throws Exception {
		// 입력한 id와 일치하는 회원의 정보 dto로 가져오기
		ClientMemberDTO cmd = cms.selectClientMemberInfo(dto.getId());
		
		String pw = EncryptionUtils.sha512(dto.getPw());
		dto.setPw(pw);
		boolean result = cms.login(dto);
		if(result) {
			session.setAttribute("id",cmd.getId());
			session.setAttribute("nickname", cmd.getNickName());
			session.setAttribute("authGradeCode", cmd.getAuthGradeCode());
			
			
			return "redirect:/";
		}
		System.out.println("로그인 실패!!");
		redir.addFlashAttribute("status", "false");
		return "redirect:/clientMember/login_form";
	}
//	비밀번호 찾기할때 폰번호로 아이디값 받아오는 코드
	@RequestMapping("getIdByPhone")
	public String getIdByPhone(String phone) {
		String result = cms.getIdByPhone(phone);
		return null;
	}
	
	// 로그아웃
	@RequestMapping("logout")
	public String logout() {
		session.removeAttribute("id");
		session.removeAttribute("nickname");
		session.removeAttribute("authGradeCode");
		return "redirect:/";
	}
	// 클라이언트 회원가입 창으로 이동
	@RequestMapping("sign_form")
	public String sign_form() throws Exception {
		return "member/clientSign";
	}
	
	// 회원가입 시 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="checkId", produces="text/html;charset=utf8")
	public String checkId(String value) throws Exception {
		boolean result = cms.isClientMember(value);
		return String.valueOf(result);
	}
	
	// 회원가입 시 인증번호 랜덤 발송
	@ResponseBody
	@RequestMapping(value="sendSmsSign", produces="text/html;charset=utf8")
	public String sendSms(String phone) throws Exception {
		// 이미 가입한 연락처가 있는지 확인
		boolean result = cms.phoneCheck(phone);
				System.out.println(phone + ":" + result);
		
		// 같은 연락처가 DB에 없으면 실행
		if(!result) {
			Random rand = new Random(); 
			String numStr = "";
			for(int i=0; i<5; i++) {
				String ran = Integer.toString(rand.nextInt(10));
				numStr+=ran;
			}
			SmsService.certifiedPhoneNumber(phone, numStr);
			session.setAttribute("numStr", numStr);	
		
		}
		return String.valueOf(result);
	}
	
	// 계정찾기시 인증번호 랜덤 발송
	@ResponseBody
	@RequestMapping(value="sendSmsLogin", produces="text/html;charset=utf8")
	public String sendSms2(String phone) throws Exception {
		// 이미 가입한 연락처가 있는지 확인
		boolean result = cms.phoneCheck(phone);
				System.out.println(phone + ":" + result);
		
		// 같은 연락처가 DB에 없으면 실행
		if(result) {
			Random rand = new Random(); 
			String numStr = "";
			for(int i=0; i<5; i++) {
				String ran = Integer.toString(rand.nextInt(10));
				numStr+=ran;
			}
			SmsService.certifiedPhoneNumber(phone, numStr);
			session.setAttribute("numStr", numStr);	
			session.setAttribute("phone", phone);
			
		}

		return String.valueOf(result);
	}
	
	// 인증번호 입력 후 인증 버튼 클릭 시
	@ResponseBody
	@RequestMapping(value="certificationSign", produces="text/html;charset=utf8")
	public String certification(String code) {
		String numStr = (String) session.getAttribute("numStr");
		System.out.println(numStr);
				
		if(numStr.equals(code)) {
			System.out.println("인중 성공");
			return String.valueOf(true);
		}

		else {
			System.out.println("인중 실패");
			return String.valueOf(false);
		}	
	}
	// 인증번호 입력 후 인증 버튼 클릭 시
	@ResponseBody
	@RequestMapping("certificationLogin")
	public Map<String, Object> certification2(String code) {
		String numStr = (String) session.getAttribute("numStr");
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		
		if(code.equals(numStr)) {
			String phone = (String) session.getAttribute("phone");
			String searchId = cms.getIdByPhone(phone);
			System.out.println(searchId);
			result.put("searchId", searchId);
			result.put("success", true);
			
			session.removeAttribute("phone");
			session.removeAttribute("numStr");
		}
		return result;
	}
	
	// 비밀번호 재설정
	@ResponseBody
	@RequestMapping("changePw")
	public void changePw(ClientMemberDTO dto) throws Exception {
		String updatePw = EncryptionUtils.sha512(dto.getPw());
		dto.setPw(updatePw);
		cms.updatePw(dto);
	}
	
	// 인증번호 시간초과 시 세션에 저장된 인증번호 삭제
	@ResponseBody
	@RequestMapping(value="removeSession")
	public void removeSession() {
		session.removeAttribute("numStr");
	}
	
	// 회원가입 폼에서 입력한 값들 넘어옴
	@RequestMapping("signup")
	public String signup(ClientMemberDTO dto, String member_birth_year, String member_birth_month, String member_birth_day, Model m) throws Exception{
		// 받은 생년월일 합치기
		String birthDate = member_birth_year + member_birth_month + member_birth_day;
		dto.setBirthDate(birthDate);
		// 비밀번호 암호화
		String shaPw = EncryptionUtils.sha512(dto.getPw());
		dto.setPw(shaPw);
		// 일반회원 가입 시 authgradecode 1003 삽입
		dto.setAuthGradeCode(1003);
		
		
		int result = cms.insertClient(dto);
		if(result == 1) {
			m.addAttribute("clientName", dto.getName());
			m.addAttribute("status", "complete");
			return "member/clientSign";
		}
		else {
			return "error";
		}
	}
	
	
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}

}
