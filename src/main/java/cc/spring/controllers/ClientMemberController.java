package cc.spring.controllers;

import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String login(ClientMemberDTO dto) throws Exception {
		System.out.println(dto);
		boolean result = cms.login(dto);
		System.out.println(result);
		if(result) {
			session.setAttribute("loginID",dto.getId());
			System.out.println("로그인 실행!");
			return "home";
		}
		System.out.println("로그인 실패!!");
		return "error";
	}
//	비밀번호 찾기할때 폰번호로 아이디값 받아오는 코드
	@RequestMapping("getIdByPhone")
	public String getIdByPhone(String phone) {
		String result = cms.getIdByPhone(phone);
		return null;
//		return 값 아직 안적어놓음
	}
//	종료
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
	@RequestMapping(value="sendSms", produces="text/html;charset=utf8")
	public String sendSms(String phone) throws Exception {
		// 이미 가입한 연락처가 있는지 확인
		boolean result = cms.phoneCheck(phone);
<<<<<<< HEAD
				System.out.println(phone);
=======
		
		// 같은 연락처가 DB에 없으면 실행
>>>>>>> f43573cd88bfb89164291008d12302dbac50ed45
		if(!result) {
			Random rand = new Random(); 
			String numStr = "";
			for(int i=0; i<5; i++) {
				String ran = Integer.toString(rand.nextInt(10));
				numStr+=ran;
			}
			SmsService.certifiedPhoneNumber(phone, numStr);
			session.setAttribute("numStr", numStr);	
			
			// 인증번호 발송하고 3분 후 세션의 numStr을 삭제
//			Timer timer = new Timer();
//	        int delay = 180000; // 3분
//	        
//	        timer.schedule(new TimerTask() {
//	            @Override
//	            public void run() {
//	                session.removeAttribute("numStr");
//	            }
//	        }, delay);
			
		}

		return String.valueOf(result);
	}
	
<<<<<<< HEAD
//	 인증번호 입력 후 인증 버튼 클릭 시
=======
	// 인증번호 입력 후 인증 버튼 클릭 시
>>>>>>> f43573cd88bfb89164291008d12302dbac50ed45
	@ResponseBody
	@RequestMapping(value="certification", produces="text/html;charset=utf8")
	public String certification(String code) {
		String numStr = (String) session.getAttribute("numStr");
<<<<<<< HEAD
=======
				
		if(numStr.equals(code)) {
			return String.valueOf(true);
		}
		else {
			return String.valueOf(false);
		}
		
>>>>>>> f43573cd88bfb89164291008d12302dbac50ed45
	}
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}

}
