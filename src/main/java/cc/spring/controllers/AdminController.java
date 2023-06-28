package cc.spring.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/data/")
public class AdminController {
	
	@RequestMapping("business")
	public int countBusinessMember() {
		int countBusinessMember = 55;
		return countBusinessMember;
	}
	
	
}
