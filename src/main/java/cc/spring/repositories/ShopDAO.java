package cc.spring.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.ShopDTO;

@Repository
public class ShopDAO {
	
	@Autowired
	private SqlSessionTemplate db;
	
	public int insertShop(ShopDTO dto) {
		db.insert("insertShop", dto);
		return dto.getCode();
	}
	
	public ShopDTO selectShopInfo(int code) {
		return db.selectOne("selectShopInfo", code);
	}

}
