package cc.spring.services;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import cc.spring.dto.ChatMealDTO;
import cc.spring.dto.MealDTO;
import cc.spring.provider.ChatGPTProvider;
import cc.spring.repositories.MealDAO;

@Service
public class MealService {
	
	@Autowired
	private ChatGPTProvider GPTprovider;
	
	@Autowired
	private MealDAO mealDAO;
	
	@Autowired
	private Gson gson;
	
	public int insertMeal(MealDTO dto) {
		return mealDAO.insertMeal(dto);
	}
	
	public int deleteMeal(MealDTO dto) {
		return mealDAO.deleteMeal(dto);
	}
	
	public int updateMeal(MealDTO dto, String modDate, int modTime) {
		return mealDAO.updateMeal(dto, modDate, modTime);
	}
	
	public List<MealDTO> selectMealCalendar(int memberCode){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		String today = sdf.format(new Date());
		cal.add(Calendar.DATE, 6);
		Date tmp = cal.getTime();
		String endDate = sdf.format(tmp);
		
		return mealDAO.selectMealCalendar(memberCode, today, endDate);
	}
	
	public List<MealDTO> selectWeekMeal(int memberCode, String startDate){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		try {
			cal.setTime(sdf.parse(startDate));
		}catch(Exception e) {
			e.printStackTrace();
		}
		cal.add(Calendar.DATE, 6);
		Date tmp = cal.getTime();
		String endDate = sdf.format(tmp);
		return mealDAO.selectWeekMeal(memberCode, startDate, endDate);
	}

	private Map<Integer, String> specialValues = new HashMap<>(){
		{
			put(1000, "");
			put(1001, " 비건");
			put(1002, " 다이어트");
			put(1003, " 비건 다이어트");
		}
	};
	
	// content 까지는 provider에서 가공해서 가져오고 그뒤는 service에서 각자 가공하기
	// 식단 추출 기능
	public List<MealDTO> makeMeal(int dayTime, int special ,String timeStr) throws Exception {
		String sendMsg = Integer.toString(dayTime) + "일치" + specialValues.get(special) + " 식단 " + timeStr + "만 JSON데이터로 짜줘";
		JsonObject content = GPTprovider.makeMeal(sendMsg);
		System.out.println(sendMsg);
		
		List<MealDTO> result = new ArrayList<>();
		
		// Calendar 데이터를 년,월,일 만 추출
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String mealDate; 
		
		for(int i = 0; i < dayTime; i++) {
			mealDate = format.format(cal.getTime());

			JsonObject day = content.get("day"+(i+1)).getAsJsonObject();
			
			ChatMealDTO dto = gson.fromJson(day.toString(), ChatMealDTO.class);
			
			System.out.println("SERVICE--> ");
			System.out.println(dto.toString());
			
			for(int x = 0; x < 3; x++) {
				if(dto.getClass().getDeclaredFields()[x].getName().equals("breakfast") && dto.getBreakfast() != null) {
					for(int j = 0; j < dto.getBreakfast().length; j++) {
						result.add(new MealDTO(0, 0, mealDate, 1001, dto.getBreakfast()[j]));
					}
				}else if(dto.getClass().getDeclaredFields()[x].getName().equals("lunch") && dto.getLunch() != null) {
					for(int j = 0; j < dto.getLunch().length; j++) {
						result.add(new MealDTO(0, 0, mealDate, 1002, dto.getLunch()[j]));
					}
				}else if(dto.getClass().getDeclaredFields()[x].getName().equals("dinner") && dto.getDinner() != null) {
					for(int j = 0; j < dto.getDinner().length; j++) {
						result.add(new MealDTO(0, 0, mealDate, 1003, dto.getDinner()[j]));
					}
				}
			}
			cal.add(Calendar.DATE, 1);	
		}
		return result;
	}
	
	@Transactional
	public void insertAiMeal(List<MealDTO> aiMealArr) {
		
		for(int i=0; i<aiMealArr.size(); i++) {
			mealDAO.deleteAiMeal(aiMealArr.get(i));
		}
		for(int i=0; i<aiMealArr.size(); i++) {
			mealDAO.insertMeal(aiMealArr.get(i));
		}
	}
	
	public void updateMealSuccess(int memberCode) {
		mealDAO.updateMealSuccess(memberCode);
	}
	
	public void updateMealFail(int memberCode) {
		mealDAO.updateMealFail(memberCode);
	}
}
