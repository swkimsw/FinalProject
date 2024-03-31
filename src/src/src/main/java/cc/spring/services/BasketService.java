package cc.spring.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import cc.spring.dto.BasketDTO;
import cc.spring.dto.ChatBasketDTO;
import cc.spring.provider.ChatGPTProvider;
import cc.spring.repositories.BasketDAO;

@Service
public class BasketService {
	
	@Autowired
	private ChatGPTProvider GPTprovider;
	
	@Autowired
	private BasketDAO basketDAO;
	
	@Autowired
	private Gson gson;
	
	public List<ChatBasketDTO> extractIngredient(String[] targetList) throws Exception{
		
		String sendMsg = String.join(", ", targetList)+"의 재료를 JSON 데이터로 작성해줘";
		System.out.println(sendMsg);
		JsonObject content = GPTprovider.extractIngredients(sendMsg);
		
		List<ChatBasketDTO> result = new ArrayList<>();
		
		for(String target:targetList) {
			result.add(new ChatBasketDTO(target,gson.fromJson(content.get(target), String[].class)));
		}
		
		return result;
	}
	
	@Transactional
	public void insertAiIngredients(int memberCode, String[] targetIngredients) {
		for(String target:targetIngredients) {
			basketDAO.insertBasket(new BasketDTO(0,memberCode,target,0));
		}
	}
	
	public int insertOne(BasketDTO dto) {
		return basketDAO.insertBasket(dto);
	}
	
	public List<BasketDTO> selectBasket(int memberCode){
		return basketDAO.selectBasket(memberCode);
	}
	
	public int insertBasket(BasketDTO dto) {
		return basketDAO.insertBasket(dto);
	}
	
	public int deleteBasket(BasketDTO dto) {
		return basketDAO.deleteBasket(dto);
	}
	
	public int deleteAllBasket(int memberCode) {
		return basketDAO.deleteAllBasket(memberCode);
	}
	
	public int updateChecked(BasketDTO dto) {
		return basketDAO.updateChecked(dto);
	}
	
	public int updateUnchecked(BasketDTO dto) {
		return basketDAO.updateUnchecked(dto);
	}
	
	public int checkAll(int memberCode) {
		return basketDAO.checkAll(memberCode);
	}
	
	public int uncheckAll(int memberCode) {
		return basketDAO.uncheckAll(memberCode);
	}
	
	public int successCount(int memberCode) {
		return basketDAO.successCount(memberCode);
	}
	
	public int failCount(int memberCode) {
		return basketDAO.failCount(memberCode);
	}
}
