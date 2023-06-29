package cc.spring.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.spring.dto.MemberDTO;
import cc.spring.services.AdminMemberService;

@Controller
@RequestMapping("/adminPage/")
public class AdminController {
	
	@Autowired
	private AdminMemberService aService;
	
	@RequestMapping("/**")
	public String toAdmin() {
		return "forward:/admin/index.html";
	}
	
	@ResponseBody
	@RequestMapping(value = "selectSuccessMeal")
	public int selectSuccessMeal() {
		int successMeal = aService.selectSuccessMeal();
		return successMeal;
	}	
}
