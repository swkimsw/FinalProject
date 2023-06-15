package cc.spring.services;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import cc.spring.dto.ChatDTO;
import cc.spring.dto.MealDTO;
import cc.spring.provider.ChatGPTProvider;

@Service
public class MealService {
	
	@Autowired
	private ChatGPTProvider GPTprovider;
	
	@Autowired
	private Gson gson;
	
	// content 까지는 provider에서 가공해서 가져오고 그뒤는 service에서 각자 가공하기
	// 식단 추출 기능
	public List<MealDTO> makeMeal(String sendMsg, int dayTime, int timeArrLength) throws Exception {
		
		JsonObject content = GPTprovider.makeMeal(sendMsg);
		
		List<MealDTO> result = new ArrayList<>();
		
		// 날짜 관련 로직
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		// Calendar -> Timestamp

		for(int i = 0; i < dayTime; i++) {
			System.out.println(dayTime);

			JsonObject day = content.get("day"+(i+1)).getAsJsonObject();
//			System.out.println("day"+(i+1));
			
			ChatDTO dto = gson.fromJson(day.toString(), ChatDTO.class);
			System.out.println(Arrays.toString(dto.getBreakfast()));
			
			for(int x = 0; x < timeArrLength; x++) {
				if(dto.getClass().getDeclaredFields()[x].getName().equals("breakfast") && dto.getBreakfast() != null) {
					for(int j = 0; j < dto.getBreakfast().length; j++) {
						result.add(new MealDTO(0, 0, new Timestamp(cal.getTimeInMillis()), 1001, 1001, dto.getBreakfast()[j]));
					}
				}else if(dto.getClass().getDeclaredFields()[x].getName().equals("lunch") && dto.getLunch() != null) {
					for(int j = 0; j < dto.getLunch().length; j++) {
						result.add(new MealDTO(0, 0, new Timestamp(cal.getTimeInMillis()), 1002, 1001, dto.getLunch()[j]));
					}
				}else if(dto.getClass().getDeclaredFields()[x].getName().equals("dinner") && dto.getDinner() != null) {
					for(int j = 0; j < dto.getDinner().length; j++) {
						result.add(new MealDTO(0, 0, new Timestamp(cal.getTimeInMillis()), 1003, 1001, dto.getDinner()[j]));
					}
				}
			}
			cal.add(Calendar.DATE, 1);	
		}
		
		
		return result;
	}

}
