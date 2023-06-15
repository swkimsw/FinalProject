package cc.spring.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.RequestListDTO;
import cc.spring.dto.ShopDTO;
import cc.spring.dto.ShopListDTO;

@Repository
public class ShopDAO {
	
	@Autowired
	private SqlSessionTemplate db;
	
	public int insertShop(ShopDTO dto) {
		db.insert("insertShop", dto);
		return dto.getCode();
	}
	
	public int isClientMemberCode(String loginId) {
		return db.selectOne("isClientMemberCode", loginId);
	}
	
	public ShopDTO selectShopInfo(int code) {
		return db.selectOne("selectShopInfo", code);
	}
	
	public int updateShop(ShopDTO dto) {
		System.out.println(dto.getDeadLine());
		System.out.println(dto.getDeadLineTemp());
		return db.update("updateShop", dto);
	}
	
	public int deleteShop(int code) {
		return db.delete("deleteShop", code);
	}
	
	public int insertShopRequest(RequestListDTO dto) {
		return db.insert("insertShopRequest", dto);
	}

	public List<ShopListDTO> ShopList() {
		List<ShopListDTO> result = db.selectList("Shop.shopList");
 		System.out.println(result);
		return result;
	}

	

}
