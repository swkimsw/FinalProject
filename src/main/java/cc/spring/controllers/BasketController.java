package cc.spring.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import cc.spring.dto.BasketDTO;
import cc.spring.services.BasketService;

@Controller
@RequestMapping("/basket/")
public class BasketController {
	
	@Autowired
	private BasketService bService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private Gson g;
	
	@RequestMapping("toMyBasket")
	public String toMyBasket(Model model) {
		
		int memberCode = 0;
		if(session.getAttribute("code") != null) {
			memberCode = (int)session.getAttribute("code");
		}
		
		if(memberCode == 0) {
			return "redirect:/clientMember/login_form";
		}else {
			List<BasketDTO> basketList = bService.selectBasket(memberCode);
			model.addAttribute("basketList", g.toJson(basketList));
			return "meal/basket";		
		}
	}
	
	@RequestMapping("insertBasket")
	public void insertBasket() {
		
	}
	
	@RequestMapping("deleteBasket")
	public void deleteBasket() {
		
	}
	
	@RequestMapping("updateBasket")
	public void updateBasket () {
		
	}
	
	
}
