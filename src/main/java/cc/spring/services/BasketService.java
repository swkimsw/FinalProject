package cc.spring.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import cc.spring.dto.ChatBasketDTO;
import cc.spring.dto.BasketDTO;
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
	
	public List<BasketDTO> extractIngredient(String[] targetList) throws Exception{
		
		String sendMsg = String.join(", ", targetList)+"의 재료를 JSON 데이터로 작성해줘";
		System.out.println(sendMsg);
		JsonObject content = GPTprovider.extractIngredients(sendMsg);
		
		List<BasketDTO> result = new ArrayList<>();
		
		JsonObject test = content.getAsJsonObject();
		ChatBasketDTO dto = gson.fromJson(test.toString(), ChatBasketDTO.class);
		
		System.out.println("Service");
		System.out.println(dto.toString());
		
		return result;
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
	
	public int updateBasket(BasketDTO dto) {
		return basketDAO.updateBasket(dto);
	}
}
