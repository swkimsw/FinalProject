package cc.spring.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import cc.spring.dto.MemberDTO;
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
	
	@ResponseBody
	@RequestMapping("selectMealCount")
	public Map<String, Integer> selectMealCount() {
		Map<String, Integer> successMeal = aService.selectMealCount();
		return successMeal;
	}
	
	@RequestMapping("clientUserList")
	public Map<String, Object> clinetUserList() {
		Map<String,Object> result = new HashMap<>();
		List<MemberDTO> list = aService.ClinetUserList();
		System.out.println("클라이언트출력");
		result.put("list",list);
		return result;
	}
	@RequestMapping("businessUserList")
	public Map<String, Object> businessUserList() {
		Map<String,Object> result = new HashMap<>();
		List<MemberDTO> list = aService.BusinessUserList();
		System.out.println("비지니스출력");
		result.put("list",list);
		return result;
	}
	
	@RequestMapping("selectSuccessBasket")
	public int selectSuccessBasket() {
		return aService.selectSuccessBasket();
	}

	@RequestMapping("selectFailBasket")
	public int selectFailBasket() {
		return aService.selectFailBasket();
	}
	
	@RequestMapping("selectTotalCount")
	public Map<String, Integer> selectTotalCount() {
		return aService.selectTotalCount();
	}
}
