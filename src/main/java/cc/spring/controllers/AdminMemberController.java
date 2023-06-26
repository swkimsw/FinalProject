package cc.spring.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.spring.dto.MemberDTO;
import cc.spring.services.AdminMemberService;

@Controller
@RequestMapping("/admin/")
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping("toAdmin")
	public String toAdmin(Model model) {
		
		// business 멤버 정보 select
		List<MemberDTO> businessMemberDTO = adminMemberService.selectAllBusinessMember();
		
		// client 멤버 정보 select
		List<MemberDTO> clientMemberDTO = adminMemberService.selectAllClientMember();
		
		model.addAttribute("businessMemberDTO", businessMemberDTO);
		model.addAttribute("clientMemberDTO", clientMemberDTO);
		return "/admin/manage";
	}
	
}
