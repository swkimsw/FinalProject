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
	
//---김은지 part------------------------------------------------------------------------------------------------
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
	
	public int updateShopTotal(RequestListDTO dto) {
		return db.update("Shop.updateShopTotal", dto);
	}
	
	public int isExistRequest(int code, String memberCode) {
		Map<String, Object> param = new HashMap<>();
		param.put("code", code);
		param.put("memberCode", memberCode);
		return db.selectOne("Shop.isExistRequest", param);
	}
	
	public int countShopRequest(int code) {
		return db.selectOne("Shop.countShopRequest", code);
	}
	
//---최은지 part------------------------------------------------------------------------------------------------
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
	
	public List<MyShopListDTO> clientBuyingList(int code,int statusCode){
		Map<String, Object> param = new HashMap<>();
		param.put("statusCode", statusCode);
		param.put("code", code);
		return db.selectList("Shop.clientBuyingList",param);
	}

	public List<MyShopListDTO> businessRegisterList(int code,int statusCode){
		Map<String, Object> param = new HashMap<>();
		param.put("statusCode", statusCode);
		param.put("code", code);
		return db.selectList("Shop.businessRegisterList",param);
	}
	
	public List<MyShopListDTO> groupbuyingCountByStatus(int code){
		return db.selectList("Shop.groupbuyingCountByStatus",code);
	}
	
	public List<MyShopListDTO> buyingMemberInfoList(int groupbuyingCode){
		return db.selectList("Shop.buyingMemberInfoList", groupbuyingCode);
	}
	
}
