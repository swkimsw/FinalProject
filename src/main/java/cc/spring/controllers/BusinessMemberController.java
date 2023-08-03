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
import cc.spring.dto.MemberDTO;
import cc.spring.dto.loginCountDTO;
import cc.spring.services.BusinessMemberService;
import cc.spring.services.SensUtilsService;
import cc.spring.services.ShopService;
import cc.spring.services.SmsService;

@Controller
@RequestMapping("/businessMember/")
public class BusinessMemberController {
	@Autowired
	private HttpSession session;

	@Autowired
	private BusinessMemberService bms;

	// 로그인 창으로 이동
	@RequestMapping("login_form")
	public String login_form() throws Exception {
		return "member/clientLogin";
	}

	// 사업자 로그인
	@RequestMapping("login")
	public String login(MemberDTO dto, RedirectAttributes redir) throws Exception {

		String loginPw = EncryptionUtils.sha512(dto.getPw());
		dto.setPw(loginPw);

		// 입력한 id와 비밀번호가 일치하는 회원이 있으면 아래 구문 실행
		boolean memberCount = bms.existingMember(dto);

		if (memberCount) {
			// 로그인 시 count update
			loginCountDTO ldto = new loginCountDTO(bms.selectBusinessMemberInfo(dto.getBusinessId()).getCode(), 0,
					null);
			boolean result = bms.login(ldto, dto);
			if (result) {
				// 입력한 id와 일치하는 회원의 정보 dto로 가져오기
				MemberDTO bmd = bms.selectBusinessMemberInfo(dto.getBusinessId());

				session.setAttribute("code", bmd.getCode());
				session.setAttribute("id", bmd.getBusinessId());
				session.setAttribute("companyName", bmd.getCompanyName());
				session.setAttribute("authGradeCode", bmd.getAuthGradeCode());
				return "redirect:/";
			}
		}
		redir.addFlashAttribute("status", "false2");
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
	@RequestMapping(value = "sendSmsLogin", produces = "text/html;charset=utf8")
	public String sendSms2(String phone) throws Exception {
		// 이미 가입한 연락처가 있는지 확인
		boolean result = bms.phoneCheck(phone);

		// 같은 연락처가 DB에 없으면 실행
		if (result) {
			Random rand = new Random();
			String numStr = "";
			for (int i = 0; i < 5; i++) {
				String ran = Integer.toString(rand.nextInt(10));
				numStr += ran;
			}
			SensUtilsService.send_msg(phone, numStr);
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

		if (code.equals(numStr)) {
			String phone = (String) session.getAttribute("phone");
			String businessId = bms.getIdByPhone(phone);
			MemberDTO bdto = bms.selectBusinessMemberInfo(businessId);
			result.put("bdto", bdto);
			result.put("success", true);

			session.removeAttribute("phone");
			session.removeAttribute("numStr");
		}
		return result;
	}

	// 비밀번호 재설정
	@ResponseBody
	@RequestMapping("changePw")
	public int changePw(MemberDTO dto) throws Exception {
		String updatePw = EncryptionUtils.sha512(dto.getPw());
		dto.setPw(updatePw);
		bms.updatePwBusiness(dto);
		int result = bms.updatePwBusiness(dto);
		return result;
	}

	// 로그아웃
	@RequestMapping("logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}

	// 비즈니스 회원가입 창으로 이동
	@RequestMapping("sign_form")
	public String sign_form() throws Exception {
		return "member/businessSign";
	}

	// 회원가입 시 중복체크
	@ResponseBody
	@RequestMapping(value = "checkSum", produces = "text/html;charset=utf8")
	public String checkId(String key, String value) throws Exception {
		// 같은 연락처와 이메일로 클라이언트와 비즈니스 회원가입 한 번씩 가능
		if (key.equals("PHONE") || key.equals("EMAIL")) {
			boolean result = bms.phoneAndemailDuplication(key, value);
			return String.valueOf(result);
		}

		boolean result = bms.isBusinessMember(key, value);
		return String.valueOf(result);
	}

	// 회원가입 시 인증번호 랜덤 발송
	@ResponseBody
	@RequestMapping(value = "sendSmsSign", produces = "text/html;charset=utf8")
	public String sendSms(String phone) throws Exception {
		// 이미 가입한 연락처가 있는지 확인
		boolean result = bms.phoneCheck(phone);

		// 같은 연락처가 DB에 없으면 실행
		if (!result) {
			Random rand = new Random();
			String numStr = "";
			for (int i = 0; i < 5; i++) {
				String ran = Integer.toString(rand.nextInt(10));
				numStr += ran;
			}
			SensUtilsService.send_msg(phone, numStr);
			session.setAttribute("numStr", numStr);

		}
		return String.valueOf(result);
	}

	// 인증번호 입력 후 인증 버튼 클릭 시
	@ResponseBody
	@RequestMapping(value = "certificationSign", produces = "text/html;charset=utf8")
	public String certification(String code) throws Exception {
		String numStr = (String) session.getAttribute("numStr");

		if (numStr.equals(code)) {
			return String.valueOf(true);
		}

		else {
			return String.valueOf(false);
		}
	}

	// 인증번호 시간초과 시 세션에 저장된 인증번호 삭제
	@ResponseBody
	@RequestMapping(value = "removeSession")
	public void removeSession() throws Exception {
		session.removeAttribute("numStr");
	}

	// 회원가입 폼에서 입력한 값들 넘어옴
	@RequestMapping("signup")
	public String signup(MemberDTO dto, String member_birth_year, String member_birth_month, String member_birth_day,
			Model m) throws Exception {
		// 받은 생년월일 합치기
		String birthDate = member_birth_year + member_birth_month + member_birth_day;
		dto.setBirthDate(birthDate);
		// 비밀번호 암호화
		String shaPw = EncryptionUtils.sha512(dto.getPw());
		dto.setPw(shaPw);
		// 판매자회원 가입 시 authgradecode 1002 삽입
		dto.setAuthGradeCode(1002);

		int result = 0;
		result = bms.insertBusiness(dto);
		if (result != 0) {
			m.addAttribute("businessName", dto.getName());
			m.addAttribute("status", "complete");
			return "member/businessSign";
		} else {
			return "error";
		}

	}

	// 내 정보 보기 클릭 시 페이지 이동
	@RequestMapping("businessMyInfo")
	public String myInfo() throws Exception {
		return "/member/businessMyInfo";
	}

	// 비밀번호 입력 시 로그인한 회원의 비밀번호와 일치하는지 확인
	@ResponseBody
	@RequestMapping("checkPw")
	public String checkPw(String pw) throws Exception {
		String enPw = EncryptionUtils.sha512(pw);
		String id = (String) session.getAttribute("id");
		boolean result = bms.checkPw(id, enPw);
		return String.valueOf(result);
	}

	// 회원정보 가져오기
	@ResponseBody
	@RequestMapping("selectBusinessMemberInfo")
	public MemberDTO selectClientMemberInfo(String id) throws Exception {
		MemberDTO dto = bms.selectBusinessMemberInfo(id);
		return dto;
	}

	// 회원정보 수정이 가능한 폼으로 이동
	@RequestMapping("goUpdateInfo")
	public String goUpdateInfo(String id, Model m) throws Exception {
		MemberDTO dto = bms.selectBusinessMemberInfo(id);
		m.addAttribute("info", dto);
		return "/member/businessInfoUpdate";
	}

	// 회원정보 수정 시 모든 변경은 연락처 인증을 통해서만 가능해....
	// 이 부분은 로그인된 회원의 연락처와 비회원의 연락처만 넘어옴
	@ResponseBody
	@RequestMapping("sendSmsUpdate")
	public String sendSmsUpdate(String phone) throws Exception {

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 5; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		SensUtilsService.send_msg(phone, numStr);
		session.setAttribute("numStr", numStr);
		return String.valueOf(true);
	}

	// 회원정보(업데이트) 입력한 내용 넘어오는 곳
	@RequestMapping("updateMemberInfo")
	public String updateMemberInfo(MemberDTO dto, String member_birth_year, String member_birth_month,
			String member_birth_day, Model m) throws Exception {
		// 받은 생년월일 합치기
		String birthDate = member_birth_year + member_birth_month + member_birth_day;
		dto.setBirthDate(birthDate);
		// 회원 수정 시 where = id에서 id값이 필요함
		String id = (String) session.getAttribute("id");
		dto.setBusinessId(id);

		int result = bms.updateMemberInfo(dto);
		if (result == 1) {
			MemberDTO updateDto = bms.selectBusinessMemberInfo(id);
			// 업데이트된 정보 다시 세션에 담기
			session.setAttribute("code", updateDto.getCode());
			session.setAttribute("id", updateDto.getBusinessId());
			session.setAttribute("companyName", updateDto.getCompanyName());
			session.setAttribute("authGradeCode", updateDto.getAuthGradeCode());
			m.addAttribute("status", "complete");
			m.addAttribute("dto", updateDto);
			return "/member/businessMyInfo";
		} else {
			return "error";
		}
	}

	// 회원탈퇴하기
	@ResponseBody
	@RequestMapping("deleteMember")
	public boolean deleteMember() throws Exception {
		int code = (int) session.getAttribute("code");

		// 판매자가 등록한 공구가 있으면 계정 삭제를 막을거에요.
		boolean result1 = bms.checkGroupBuying(code);
		if (result1) {
			return true;
		} else {
			int result2 = bms.deleteMember(code);
			if (result2 == 1) {
				session.invalidate();
			}
			return false;
		}
	}
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}

}
