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
	
	public int insertBasket(BasketDTO dto) {
		return mybatis.insert("Basket.insertBasket",dto);
	}
	
	public int updateChecked(BasketDTO dto) {
		return mybatis.update("Basket.updateChecked",dto);
	}
	
	public int updateUnchecked(BasketDTO dto) {
		return mybatis.update("Basket.updateUnchecked",dto);
	}
}
