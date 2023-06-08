package cc.spring.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.BusinessMemberDTO;

@Repository
public class BusinessMemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public boolean login(BusinessMemberDTO dto) {
		System.out.println(dto.getBusinessId() + " : " + dto.getPw());
		boolean result = mybatis.selectOne("Business.login", dto);
		System.out.println("DAO 리턴결과:" + result);
		return result;
	}
}
