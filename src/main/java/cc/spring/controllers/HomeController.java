package cc.spring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/admin/**")
	public String toAdmin() {
		System.out.println("하잉");
		return "forward:/adminPage/index.html";
	}
	
	@GetMapping("/error/{statusCode}")
	public String getErrorPage(@PathVariable String statusCode) {
		return "error/"+statusCode;
	}
}
