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
import org.springframework.web.bind.annotation.RequestBody;
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
		int memberCode = 0;
		if(session.getAttribute("code")!=null) {
			memberCode = (int)session.getAttribute("code");
		}
		
		if(memberCode==0) {
			return "redirect:/clientMember/login_form";
		}
		else {
			List<MealDTO> mealList = mService.selectMealCalendar(memberCode);
			model.addAttribute("mealList", g.toJson(mealList));
			return "meal/mealCalendar";			
		}
	}
	
	//내 식단 목록에서 한끼 식단 편집할 때
	//ajax
	@RequestMapping("insertMeal")
	public void insertMeal(MealDTO dto) {
		int memberCode = (int)session.getAttribute("code");
		dto.setMemberCode(memberCode);
		mService.insertMeal(dto);
	}
	
	//내 식단 목록에서 한끼 식단 편집할 때
	//ajax
	@RequestMapping("deleteMeal")
	public void deleteMeal(MealDTO dto) {
		int memberCode = (int)session.getAttribute("code");
		dto.setMemberCode(memberCode);
		mService.deleteMeal(dto);
	}
	
	//내 식단 목록에서 한끼 식단 편집할 때
	//ajax
	@RequestMapping("updateMeal")
	public void updateMeal(MealDTO dto, String modDate, int modTime) {
		int memberCode = (int)session.getAttribute("code");
		dto.setMemberCode(memberCode);
		mService.updateMeal(dto, modDate, modTime);
	}
	
	//ajax
	@ResponseBody
	@RequestMapping(value="selectWeekMeal", produces="text/html; charset=utf8;")
	public String selectWeekMeal(String startDate) {
		int memberCode = (int)session.getAttribute("code");
		List<MealDTO> mealList = mService.selectWeekMeal(memberCode, startDate);
		return g.toJson(mealList);
	}
	
	@RequestMapping("toMyBasket")
	public String toMyBasket(Model model) {
		int memberCode = 0;
		if(session.getAttribute("code")!=null) {
			memberCode = (int)session.getAttribute("code");
		}
		
		if(memberCode==0) {
			return "redirect:/clientMember/login_form";
		}
		else {
			return "meal/basket";			
		}
	}
	
	@RequestMapping("toAiMeal")
	public String toAiMeal() {
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value="aiMeal",  produces="text/plain;charset=utf-8")
	public ResponseEntity<List<MealDTO>> aiMeal( int dayTime, int special ,String timeStr) throws Exception {
		
		List<MealDTO> result = mService.makeMeal(dayTime, special, timeStr);
		
		System.out.println("Controller: ");
		System.out.println(result.toString());
	    // ResponseEntity를 사용하여 결과 반환
	    return ResponseEntity.status(HttpStatus.OK)
	            .contentType(MediaType.APPLICATION_JSON)
	            .body(result);
	}
	
	@ResponseBody
	@RequestMapping(value="addAiMeal", produces="text/plain;charset=utf-8")
	public void aiAddMeal(@RequestBody List<MealDTO> aiMealArr) {
		
		int memberCode = (int)session.getAttribute("code");
		String mealDate = ""; 
		int timeCode = 0;
		
		for(int i=0; i<aiMealArr.size(); i++) {
			// 식단 추가하기 전에 기존에 있던 데이터 DB에서 삭제하기
			timeCode = aiMealArr.get(i).getTimeCode();
			mealDate  = aiMealArr.get(i).getMealDate();
			mService.deleteAiMeal(memberCode, timeCode, mealDate);
			
			aiMealArr.get(i).setMemberCode(memberCode);
			mService.insertMeal(aiMealArr.get(i));
		}
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}


}
