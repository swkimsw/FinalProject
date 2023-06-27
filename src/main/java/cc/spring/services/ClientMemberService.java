package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.spring.dto.ClientMemberDTO;
import cc.spring.dto.MemberDTO;
import cc.spring.dto.gptCountDTO;
import cc.spring.dto.loginCountDTO;
import cc.spring.repositories.ClientMemberDAO;

@Service
public class ClientMemberService {
	@Autowired
	private ClientMemberDAO cdao;
	
	@Transactional
	public boolean login(loginCountDTO ldto ,MemberDTO mdto){
		cdao.updatelogintCount(ldto);
		return cdao.login(mdto);
	}
	public String getIdByPhone(String phone) {
		return cdao.getIdByPhone(phone);
	}
	public boolean isClientMember(String key, String value) {
		return cdao.isClientMember(key, value);
	}
	
	public boolean phoneAndemailDuplication(String key, String value) {
		return cdao.phoneAndemailDuplication(key, value);
	}
	
	public boolean phoneCheck(String phone) {
		return cdao.phoneCheck(phone);
	}
	
	@Transactional
	public int insertClient(MemberDTO mdto) {
		int memberCode = cdao.insertClient(mdto);
		cdao.insertloginCount(new loginCountDTO(memberCode, 0, null));
		cdao.insertGptCount(new gptCountDTO(memberCode, 0, 0, 0, 0));
		return memberCode;
	}
	
	public int updatePw(MemberDTO dto) {
		return cdao.updatePw(dto);
	}
	
	public MemberDTO selectClientMemberInfo(String id) {
		return cdao.selectClientMemberInfo(id);
	}
	
	public boolean checkPw(String id, String pw) {
		return cdao.checkPw(id, pw);
	}
	
	public int updateMemberInfo(MemberDTO dto) {
		return cdao.updateMemberInfo(dto);
	}
	
	public int deleteMember(int code) {
		return cdao.deleteMember(code);
	}
}
