package cc.spring.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import cc.spring.dto.BanMemberDTO;
import cc.spring.dto.BoardCountDTO;
import cc.spring.dto.MealDTO;
import cc.spring.dto.MemberDTO;
import cc.spring.dto.ShopListDTO;
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
	
	@RequestMapping("selectBasketCount")
	public Map<String, Integer> selectBasketCount() {
		return aService.selectBasketCount();
	}

	
	@RequestMapping("selectTotalCount")
	public Map<String, Integer> selectTotalCount() {
		return aService.selectTotalCount();
	}
	
	@RequestMapping("recentVisitCount")
	public Map<String, Integer> recentVisitBusiness() {
		return aService.recentVisitCount();
	}
	
	@RequestMapping("selectShopList")
	public Map<String, Object> selectShopList() {
		Map<String, Object> result = new HashMap<>();
		List<ShopListDTO> shopList = aService.selectShopList();
		result.put("shopList", shopList);
		return result;
	}
	
	@ResponseBody 
	@RequestMapping(value = "banMember", produces="text/plain;charset=utf-8")
	public int banMember(@RequestBody List<Integer> memberCodeArr) {
		
		return aService.BanMember(memberCode);
	}
	
	@ResponseBody
	@RequestMapping("selectUserList")
	public List<MemberDTO> selectUserList(){
		return aService.selectUserList();
	}
	
	@ResponseBody
	@RequestMapping("selectBanUserList") 
	public List<BanMemberDTO> selectBanUserList(){
		return aService.selectBanUserList();
	}
	
	@RequestMapping("recentBoardCount")
	public Map<String, List<BoardCountDTO>> recentBoardCount(){
		return aService.recentBoardCount();
	}
}
