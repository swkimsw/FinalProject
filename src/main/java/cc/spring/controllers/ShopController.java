package cc.spring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.spring.services.ShopService;

@Controller
@RequestMapping("/shop/")
public class ShopController {
	
	@Autowired
	private ShopService shopService;

	@RequestMapping("toShopRegister")
	public String toShopRegister() {
		return "/shop/shopRegister";
	}
	
	@RequestMapping("toShopList")
	public String toShopList() {
		return "/shop/shopList";
	}
	
	@RequestMapping("insertShop")
	public String insertShop() {
		
		
		return "/shop/shopList";
	}
	
}
