package cc.spring.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import cc.spring.services.AdminMemberService;

@RestController
@RequestMapping("/data/")
public class AdminController {
	
	@Autowired
	private AdminMemberService aService;
	
	@RequestMapping("/**")
	public String toAdmin() {
		return "forward:/admin/index.html";
	}
	
	@RequestMapping("selectMealCount")
	public Map<String, Integer> selectSuccessMeal() {
		Map<String, Integer> successMeal = aService.selectMealCount();
		return successMeal;
	}
	
	@RequestMapping("selectSuccessBasket")
	public int selectSuccessBasket() {
		return aService.selectSuccessBasket();
	}

	@RequestMapping("selectFailBasket")
	public int selectFailBasket() {
		return aService.selectFailBasket();
	}
}
