package cc.spring.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cc.spring.dto.MemberDTO;

@RestController
@RequestMapping("/data/")
public class DataController {
	
	@RequestMapping("business")
	public int countBusinessMember() {
		int countBusinessMember = 55;
		return countBusinessMember;
	}
	
}
