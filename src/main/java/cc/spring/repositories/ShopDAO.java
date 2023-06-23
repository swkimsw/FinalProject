package cc.spring.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.MyShopListDTO;
import cc.spring.dto.RequestListDTO;
import cc.spring.dto.ShopDTO;
import cc.spring.dto.ShopListDTO;

@Repository
public class ShopDAO {
	
	@Autowired
	private SqlSessionTemplate db;
	
	public int insertShop(ShopDTO dto) {
		db.insert("Shop.insertShop", dto);
		return dto.getCode();
	}
	
	public int isClientMemberCode(String loginId) {
		return db.selectOne("Shop.isClientMemberCode", loginId);
	}
	
	public int isBusinessMemberCode(String loginId) {
		return db.selectOne("Shop.isBusinessMemberCode", loginId);
	}
	
	public ShopDTO selectShopInfo(int code) {
		return db.selectOne("Shop.selectShopInfo", code);
	}
	
	public int updateShop(ShopDTO dto) {
		return db.update("Shop.updateShop", dto);
	}
	
	public int deleteShop(int code) {
		return db.delete("Shop.deleteShop", code);
	}
	
	public int insertShopRequest(RequestListDTO dto) {
		return db.insert("Shop.insertShopRequest", dto);
	}
	
	public List<ShopListDTO> shopList() {
		return db.selectList("Shop.shopList");
	}
	
	public List<ShopListDTO> getStatusList(String status) {
		return db.selectList("Shop.getStatusList",status);
	}

	public List<ShopListDTO> searchByKeyword(String category, String keyword ) {
		Map<String, Object> param = new HashMap<>();
		param.put("category", category);
		param.put("keyword", keyword);
		return db.selectList("Shop.searchByKeyword",param);
	}
	
	public MyShopListDTO getInfo(int code) {
		return db.selectOne("Shop.getInfo",code);
	}
	
	public List<MyShopListDTO> clientBuyingList(int code){
		return db.selectList("Shop.clientBuyingList",code);
	}
	
	public List<MyShopListDTO> businessRegisterList(int code){
		return db.selectList("Shop.businessRegisterList",code);
	}
	
	public List<MyShopListDTO> buyingMemberInfoList(int groupbuyingCode){
		return db.selectList("Shop.buyingMemberInfoList", groupbuyingCode);
	}

}
