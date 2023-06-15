package cc.spring.services;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import cc.spring.dto.ChatDTO;
import cc.spring.provider.ChatGPTProvider;

@Service
public class MealService {
	
	@Autowired
	private ChatGPTProvider GPTprovider;
	
	@Autowired
	private Gson gson;
	
	// content 까지는 provider에서 가공해서 가져오고 그뒤는 service에서 각자 가공하기
	// 식단 추출 기능
	public Map<String, Object> makeMeal(String sendMsg) throws Exception {
		
		JsonObject content = GPTprovider.makeMeal(sendMsg);
		Map<String, Object> data = gson.fromJson(content, Map.class);
		System.out.println("SERVICE1:");
		System.out.println(data.values());
		
		JsonParser parser = new JsonParser();
		JsonElement breakfast = parser.parse(data.get("breakfast").toString());
		JsonElement lunch = parser.parse(data.get("lunch").toString());
		JsonElement dinner = parser.parse(data.get("dinner").toString());
		System.out.println("SERVICE2:");
		System.out.println(breakfast);
		System.out.println(lunch);
		System.out.println(dinner);
		

		return data;
	}

}
