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
import cc.spring.dto.BusinessMemberDTO;
import cc.spring.dto.MemberDTO;
import cc.spring.services.BusinessMemberService;
import cc.spring.services.SmsService;

@Controller
@RequestMapping("/businessMember/")
public class BusinessMemberController {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BusinessMemberService bms;
	
	//  로그인 창으로 이동
	@RequestMapping("login_form")
	public String login_form() throws Exception {
		return "member/clientLogin";
	}
	
	//사업자 로그인
		@RequestMapping("login")
		public String login(MemberDTO dto, RedirectAttributes redir) throws Exception {
			
			String loginPw = EncryptionUtils.sha512(dto.getPw());
			dto.setPw(loginPw);
			boolean result = bms.login(dto);
			if(result) {
				// 입력한 id와 일치하는 회원의 정보 dto로 가져오기
				MemberDTO bmd = bms.selectBusinessMemberInfo(dto.getBusinessId());
				
				session.setAttribute("code", bmd.getCode());
				session.setAttribute("id",bmd.getBusinessId());
				session.setAttribute("companyName",bmd.getCompanyName());
				session.setAttribute("authGradeCode",bmd.getAuthGradeCode());
				System.out.println("로그인 실행!");
				return "redirect:/";
			}
			System.out.println("로그인 실패!!");
			redir.addFlashAttribute("status","false2");
			return "redirect:/businessMember/login_form";
		}
//		비밀번호 찾기할때 폰번호로 아이디값 받아오는 코드
		@RequestMapping("getIdByPhone")
		public String getIdByPhone(String phone) {
			String result = bms.getIdByPhone(phone);
			return null;
		}
		
		// 계정찾기시 인증번호 랜덤 발송
		@ResponseBody
		@RequestMapping(value="sendSmsLogin", produces="text/html;charset=utf8")
		public String sendSms2(String phone) throws Exception {
			// 이미 가입한 연락처가 있는지 확인
			boolean result = bms.phoneCheck(phone);
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
		@RequestMapping("certificationLogin")
		public Map<String, Object> certification2(String code) {
			String numStr = (String) session.getAttribute("numStr");
			
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			
			if(code.equals(numStr)) {
				String phone = (String) session.getAttribute("phone");
				String businessId = bms.getIdByPhone(phone);
				System.out.println(businessId);
				result.put("businessId", businessId);
				result.put("success", true);
				
				session.removeAttribute("phone");
				session.removeAttribute("numStr");
			}
			return result;
		}
		
		// 비밀번호 재설정
		@ResponseBody
		@RequestMapping("changePw")
		public void changePw(MemberDTO dto) throws Exception {
			String updatePw = EncryptionUtils.sha512(dto.getPw());
			dto.setPw(updatePw);
			bms.updatePwBusiness(dto);
		}
		
		// 로그아웃
		@RequestMapping("logout")
		public String logout() {
			session.invalidate();
			System.out.println("로그아웃");
			return "redirect:/";
		}
		
			

		// 비즈니스 회원가입 창으로 이동
		@RequestMapping("sign_form")
		public String sign_form() throws Exception {
			return "member/businessSign";
		}
		
		// 회원가입 시 중복체크
		@ResponseBody
		@RequestMapping(value="checkSum", produces="text/html;charset=utf8")
		public String checkId(String key, String value) throws Exception {
			// 같은 연락처와 이메일로 클라이언트와 비즈니스 회원가입 한 번씩 가능
			if(key.equals("PHONE") || key.equals("EMAIL")) {
				boolean result = bms.phoneAndemailDuplication(key,value);
				return String.valueOf(result);
			}

			boolean result = bms.isBusinessMember(key,value);
			return String.valueOf(result);
		}
		
		// 회원가입 시 인증번호 랜덤 발송
		@ResponseBody
		@RequestMapping(value="sendSmsSign", produces="text/html;charset=utf8")
		public String sendSms(String phone) throws Exception {
			// 이미 가입한 연락처가 있는지 확인
			boolean result = bms.phoneCheck(phone);
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

		
		// 인증번호 시간초과 시 세션에 저장된 인증번호 삭제
		@ResponseBody
		@RequestMapping(value="removeSession")
		public void removeSession() {
			session.removeAttribute("numStr");
		}
		
		// 회원가입 폼에서 입력한 값들 넘어옴
		@RequestMapping("signup")
		public String signup(MemberDTO dto, String member_birth_year, String member_birth_month, String member_birth_day, Model m) throws Exception{
			// 받은 생년월일 합치기
			String birthDate = member_birth_year + member_birth_month + member_birth_day;
			dto.setBirthDate(birthDate);
			// 비밀번호 암호화
			String shaPw = EncryptionUtils.sha512(dto.getPw());
			dto.setPw(shaPw);
			// 판매자회원 가입 시 authgradecode 1002 삽입
			dto.setAuthGradeCode(1002);

			
			
			int result = bms.insertBusiness(dto);
			if(result == 1) {
				System.out.println(dto.getName());
				m.addAttribute("businessName", dto.getName());
				m.addAttribute("status", "complete");
				return "member/businessSign";
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
