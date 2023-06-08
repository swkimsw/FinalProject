package cc.spring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.spring.dto.ShopDTO;
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
	public String insertShop(ShopDTO dto) {
		try {
			int parentSeq = shopService.insertShop(dto);
			System.out.println("부모 시퀀스 : " + parentSeq);
			return "/shop/shopRegister";
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}
	
}
