package cc.spring.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cc.spring.dto.ShopDTO;
import cc.spring.services.ShopService;

@Controller
@RequestMapping("/shop/")
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("toShopRegister")
	public String toShopRegister() {
		return "/shop/shopRegister";
	}
	
	@RequestMapping("toShopList")
	public String toShopList() {
		return "/shop/shopList";
	}
	
	@RequestMapping(value="insertShop")
	public String insertShop(ShopDTO dto, MultipartFile[] files) {
		try {
			// realPath - 폴더가 없다면 만들기
			String realPath = session.getServletContext().getRealPath("upload");
			System.out.println(realPath);
			System.out.println("왜 : " + files);
			shopService.insertShop(dto, files, realPath);
			
			return "redirect:/shop/toShopRegister";
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
