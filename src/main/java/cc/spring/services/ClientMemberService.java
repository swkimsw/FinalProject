package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import cc.spring.dto.ClientMemberDTO;
import cc.spring.repositories.ClientMemberDAO;

@Service
public class ClientMemberService {
	@Autowired
	private ClientMemberDAO cdao;
	
	public boolean login(ClientMemberDTO dto){
		return cdao.login(dto);
	}
	public String getIdByPhone(String phone) {
		return cdao.getIdByPhone(phone);
	}
	public boolean isClientMember(String key, String value) {
		return cdao.isClientMember(key, value);
	}
	
	public boolean phoneCheck(String phone) {
		return cdao.phoneCheck(phone);
	}
	
	@Transactional
	public int insertClient(ClientMemberDTO dto) {
	    int clientmemberSeq = cdao.insertClient(dto);
	    int result = cdao.insertTotal(clientmemberSeq);
	    return result;
	}
	
	public int updatePw(ClientMemberDTO dto) {
		return cdao.updatePw(dto);
	}
	
	public ClientMemberDTO selectClientMemberInfo(String id) {
		return cdao.selectClientMemberInfo(id);
	}
}
