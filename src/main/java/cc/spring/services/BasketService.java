package cc.spring.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

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
	
	public List<BasketDTO> extractIngredient(String[] targetList){
		
		//String sendMsg = String.join(", ", targetList)+"의 재료를 JSON 데이터로 작성해줘";
		String sendMsg = "부대찌개, 해물찜의 재료를 JSON 데이터로 작성해줘";
		JsonObject content = GPTprovider.extractIngredients(sendMsg);
		System.out.println(sendMsg);
		
		List<BasketDTO> result = new ArrayList<>();
		
		JsonObject test = content.getAsJsonObject();
		ChatBasketDTO dto = gson.fromJson(test.toString(), ChatBasketDTO.class);
		
		System.out.println("Service");
		System.out.println(dto.toString());
		
		return result;
	}
}
