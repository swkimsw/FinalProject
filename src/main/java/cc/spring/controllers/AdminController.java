package cc.spring.controllers;

<<<<<<< HEAD
import java.util.Map;
=======
import java.util.List;
>>>>>>> 1eb869eecb12ab30d63ec1bc046ad756d580cc5e

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
