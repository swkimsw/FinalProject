package cc.spring.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import cc.spring.dto.MealDTO;
import cc.spring.services.MealService;


@Controller
@RequestMapping("/meal/")
public class MealController {
	@Autowired
	private MealService mService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private Gson g;
	
	@RequestMapping("toMyMeal")
	public String toMyMeal(Model model) {
//		int memberCode = (int)session.getAttribute("code");
		int memberCode = 0;
		List<MealDTO> mealList = mService.selectMealCalendar(memberCode);
		String mealStr = g.toJson(mealList);
		model.addAttribute("mealList", mealStr);
		return "meal/mealCalendar";
	}
	
	//내 식단 목록에서 한끼 식단 편집할 때
	//ajax
	@RequestMapping("insertMeal")
	public void insertMeal(MealDTO dto) {
		mService.insertMeal(dto);
	}
	
	//내 식단 목록에서 한끼 식단 편집할 때
	//ajax
	@RequestMapping("deleteMeal")
	public void deleteMeal(MealDTO dto) {
		mService.deleteMeal(dto);
	}
	
	//ajax
	@ResponseBody
	@RequestMapping(value="selectWeekMeal", produces="text/html; charset=utf8;")
	public List<MealDTO> selectWeekMeal(String startDate) {
		int memberCode = (int)session.getAttribute("code");
		List<MealDTO> mealList = mService.selectWeekMeal(memberCode, startDate);
		return mealList;
	}
	
	@RequestMapping("toMyBasket")
	public String toMyBasket() {
		return "meal/basket";
	}
	
	@ResponseBody
	@RequestMapping(value="aiMeal",  produces="text/plain;charset=utf-8")
	public ResponseEntity<List<MealDTO>> aiMeal( int dayTime, int special ,String timeStr, int timeArrLength) throws Exception {
		
		List<MealDTO> result = mService.makeMeal(dayTime, special, timeStr);
		
		System.out.println("Controller: ");
		System.out.println(result.toString());
	    // ResponseEntity를 사용하여 결과 반환
	    return ResponseEntity.status(HttpStatus.OK)
	            .contentType(MediaType.APPLICATION_JSON)
	            .body(result);
	}
	
	@ResponseBody
	@RequestMapping(value="addMeal", produces="text/plain;charset=utf-8")
	public void aiAddMeal() {
		
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}


}
