package cc.spring.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import cc.spring.dto.BasketDTO;
import cc.spring.dto.ChatBasketDTO;
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
	
	@ResponseBody
	@RequestMapping(value="aiBasket", produces="text/plain; charset=utf8;")
	public String aiBasket(String targetList) throws Exception{
		String[] targetMeals = g.fromJson(targetList, String[].class);
		List<ChatBasketDTO> result = bService.extractIngredient(targetMeals);
		return g.toJson(result);
	}
	
	@RequestMapping("aiAddBasket")
	public String aiAddBasket(String aiBasketArr) {
		String[] targetIngredients = g.fromJson(aiBasketArr, String[].class);
		
		
		return "redirect:/basket/toMyBasket";
	}
}
