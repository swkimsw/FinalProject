package cc.spring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.spring.commons.ChatGPTUtils;

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
	public String aiMeal(String sendMsg) {
		ChatGPTUtils
		return "";
	}
	


}
