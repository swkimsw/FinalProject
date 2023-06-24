package cc.spring.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.MealDTO;

@Repository
public class MealDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//내 식단표 들어갔을 때 오늘날짜부터 7일치 식단 리스트 가져가 출력
	public List<MealDTO> selectMealCalendar(int memberCode, String today, String endDate){
		Map<String, Object> param = new HashMap<>();
		param.put("memberCode", memberCode);
		param.put("today", today);
		param.put("endDate", endDate);
		return mybatis.selectList("Meal.selectMealCalendar", param);
	}
	
	//내 식단표에서 1주일씩 이동했을 때 해당 날짜부터 7일치 식단 리스트 가져가 출력
	public List<MealDTO> selectWeekMeal(int memberCode, String startDate, String endDate){
		Map<String, Object> param = new HashMap<>();
		param.put("memberCode", memberCode);
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		return mybatis.selectList("Meal.selectWeekMeal", param);
	}

	//내 식단표에서 한끼 식단 수정할 때 메뉴 하나당 insert
	public int insertMeal(MealDTO dto) {
		return mybatis.insert("Meal.insertMeal", dto);
	}
	
	//내 식단표에서 한끼 식단 수정할 때 메뉴 하나당 delete
	public int deleteMeal(MealDTO dto) {
		return mybatis.delete("Meal.deleteMeal", dto);
	}
	
	public int updateMeal(MealDTO dto, String modDate, int modTime) {
		Map<String, Object> param = new HashMap<>();
		param.put("mealDTO", dto);
		param.put("modDate", modDate);
		param.put("modTime", modTime);
		return mybatis.update("Meal.updateMeal", param);
	}
	
	//내 식단표에서 한끼 식단 수정할 때 메뉴 하나당 delete
	public int deleteMeal(MealDTO dto) {
		return mybatis.delete("Meal.deleteMeal", dto);
	}
}
