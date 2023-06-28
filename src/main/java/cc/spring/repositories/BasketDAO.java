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
		mybatis.insert("Basket.insertBasket", dto);
		return dto.getCode();
	}
	
	public int deleteBasket(BasketDTO dto) {
		return mybatis.delete("Basket.deleteBasket", dto);
	}
	public int deleteAllBasket(int memberCode) {
		return mybatis.delete("Basket.deleteAllBasket", memberCode);
	}
	
	public int updateChecked(BasketDTO dto) {
		return mybatis.update("Basket.updateChecked", dto);
	}
	
	public int updateUnchecked(BasketDTO dto) {
		return mybatis.update("Basket.updateUnchecked", dto);
	}
	
	public int successCount(int memberCode) {
		return mybatis.update("Basket.successCount", memberCode);
	}
	
	public int failCount(int memberCode) {
		return mybatis.update("Basket.failCount", memberCode);
	}
}
