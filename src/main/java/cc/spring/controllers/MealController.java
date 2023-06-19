package cc.spring.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.spring.dto.MealDTO;
import cc.spring.services.MealService;


@Controller
@RequestMapping("/meal/")
public class MealController {
//	mmmm
	@Autowired
	private MealService mService;
	
	@RequestMapping("toMyMeal")
	public String toMyMeal() {
		return "meal/mealCalendar";
	}
	
	@RequestMapping("toMyBasket")
	public String toMyBasket() {
		return "meal/basket";
	}
	
	@ResponseBody
	@RequestMapping(value="aiMeal",  produces="text/plain;charset=utf-8")
	public void aiMeal( int dayTime) throws Exception {
		//, int special ,int timeArrLength, String timeStr
//		List<MealDTO> result = mService.makeMeal(dayTime, special,timeArrLength, timeStr);
	 mService.makeMeal(dayTime);
		
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}


}
