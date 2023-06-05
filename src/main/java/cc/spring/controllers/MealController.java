package cc.spring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	

}
