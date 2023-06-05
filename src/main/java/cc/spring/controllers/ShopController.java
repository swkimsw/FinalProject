package cc.spring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shop/")
public class ShopController {

	@RequestMapping("toShopRegister")
	public String toShopRegister() {
		return "/shop/shopRegister";
	}
}
