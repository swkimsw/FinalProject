package cc.spring.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.BasketDTO;

@Repository
public class BasketDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<BasketDTO> selectBasket(int memberCode){
		return mybatis.selectList("Basket.selectBasket", memberCode);
	}
}
