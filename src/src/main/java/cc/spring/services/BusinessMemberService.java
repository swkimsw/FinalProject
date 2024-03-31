package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.spring.dto.MemberDTO;
import cc.spring.dto.gptCountDTO;
import cc.spring.dto.loginCountDTO;
import cc.spring.repositories.AdminDAO;
import cc.spring.repositories.BusinessMemberDAO;

@Service
public class BusinessMemberService {

	@Autowired
	private BusinessMemberDAO bdao;

	@Autowired
	private AdminDAO adminDAO;

	public boolean existingMember(MemberDTO dto) {
		return bdao.login(dto);
	}

	@Transactional
	public boolean login(loginCountDTO ldto, MemberDTO dto) {
		adminDAO.updatelogintCount(ldto);
		return bdao.login(dto);
	}

	public String getIdByPhone(String phone) {
		return bdao.getIdByPhone(phone);
	}

	public boolean isBusinessMember(String key, String value) {
		return bdao.isBusinessMember(key, value);
	}

	public boolean phoneAndemailDuplication(String key, String value) {
		return bdao.phoneAndemailDuplication(key, value);
	}

	public boolean phoneCheck(String phone) {
		return bdao.phoneCheck(phone);
	}

	@Transactional
	public int insertBusiness(MemberDTO dto) {
		int memberCode = bdao.insertBusiness(dto);
		adminDAO.insertloginCount(new loginCountDTO(memberCode, 0, null));
		adminDAO.insertGptCount(new gptCountDTO(memberCode, 0, 0, 0, 0));
		return memberCode;
	}

	public int updatePwBusiness(MemberDTO dto) {
		return bdao.updatePw(dto);
	}

	public MemberDTO selectBusinessMemberInfo(String businessId) {
		return bdao.selectBusinessMemberInfo(businessId);
	}

	public MemberDTO selectMemberInfoByCode(int code) {
		return bdao.selectMemberInfoByCode(code);
	}

	public boolean checkPw(String id, String pw) {
		return bdao.checkPw(id, pw);
	}

	public int updateMemberInfo(MemberDTO dto) {
		return bdao.updateMemberInfo(dto);
	}

	public boolean checkGroupBuying(int code) {
		return bdao.checkGroupBuying(code);
	}

	public int deleteMember(int code) {
		return bdao.deleteMember(code);
	}
}
