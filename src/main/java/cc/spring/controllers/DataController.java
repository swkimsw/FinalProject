package cc.spring.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cc.spring.dto.MemberDTO;
import cc.spring.services.DataService;

@RestController
@RequestMapping("/data/")
public class DataController {
	@Autowired
	private DataService ds;
	
	@RequestMapping("business")
	public int countBusinessMember() {
		int countBusinessMember = 55;
		return countBusinessMember;
	}
	@RequestMapping("clientUserList")
	public String clinetUserList(Model model) {
		List<MemberDTO> list = ds.ClinetUserList();
		model.addAttribute("list",list);
		return "";
	}
}
