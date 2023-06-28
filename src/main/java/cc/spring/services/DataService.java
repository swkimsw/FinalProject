package cc.spring.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.MemberDTO;
import cc.spring.repositories.DataDAO;

@Service
public class DataService {

@Autowired
private DataDAO ddao;
	
	public List<MemberDTO> ClinetUserList() {
		return ddao.clientUserList();
	}
}
