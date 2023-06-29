package cc.spring.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
	public Map<String, Integer> selectSuccessMeal() {
		Map<String, Integer> successMeal = aService.selectMealCount();
		return successMeal;
	}
	
	@RequestMapping("clientUserList")
	public String clinetUserList(Model model) {
		List<MemberDTO> list = aService.ClinetUserList();
		model.addAttribute("list",list);
		return "";
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
	
	@RequestMapping("recentVisitBusiness")
	public String recentVisitBusiness() {
		return aService.recentVisitBusiness();
	}
}
