package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.ClientMemberDTO;
import cc.spring.repositories.ClientMemberDAO;

@Service
public class ClientMemberService {
	@Autowired
	private ClientMemberDAO CDAO;
	
	public boolean login(ClientMemberDTO dto){
		return CDAO.login(dto);
	}
	public String getIdByPhone(String phone) {
		return CDAO.getIdByPhone(phone);
	}
	public boolean isClientMember(String id) {
		return CDAO.isClientMember(id);
	}
	
	public boolean phoneCheck(String phone) {
		return CDAO.phoneCheck(phone);
	}
	
	public int insertClient(ClientMemberDTO dto) {
		return CDAO.insertClient(dto);
	}
	
	public int updatePw(ClientMemberDTO dto) {
		return CDAO.updatePw(dto);
	}
	
	public ClientMemberDTO selectClientMemberInfo(String id) {
		return CDAO.selectClientMemberInfo(id);
	}
}
