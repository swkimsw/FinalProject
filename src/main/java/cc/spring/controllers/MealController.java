package cc.spring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;


@Controller
@RequestMapping("/meal/")
public class MealController {
	
	@RequestMapping("list")
	public String list() {
		return "meal/list";
	}
	
	@RequestMapping("basket")
	public String cart() {
		return "meal/basket";
	}
	
	@ResponseBody
	@RequestMapping(value="aiMeal",  produces="text/plain;charset=utf-8")
	public String aiMeal(String sendMsg) throws Exception {
//		ChatGPTUtils chatGPT = new ChatGPTUtils();
		JsonObject result = chatGPT.makeMeal(sendMsg);
		return "home?result" + result;
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}


}
