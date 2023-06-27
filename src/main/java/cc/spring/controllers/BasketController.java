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
			model.addAttribute("basketList", basketList);
			return "meal/basket";		
		}
	}
	
	@RequestMapping("insertBasket")
	public void insertBasket(BasketDTO dto) {
		int memberCode = (int)session.getAttribute("code");
		dto.setCode(memberCode);
		bService.insertBasket(dto);
	}
	
	@RequestMapping("deleteBasket")
	public void deleteBasket(BasketDTO dto) {
		int memberCode = (int)session.getAttribute("code");
		dto.setCode(memberCode);
		bService.deleteBasket(dto);
	}
	
	@RequestMapping("deleteAllBasket")
	public String deleteAllBasket() {
		int memberCode = (int)session.getAttribute("code");
		bService.deleteAllBasket(memberCode);
		return "redirect:/";
	}
	@RequestMapping("updateBasket")
	public void updateBasket (BasketDTO dto) {
		int memberCode = (int)session.getAttribute("code");
		dto.setCode(memberCode);
		bService.updateBasket(dto);
	}
	
	@ResponseBody
	@RequestMapping(value="aiBasket", produces="text/plain; charset=utf8;")
	public String aiBasket(String targetList) throws Exception{
		String[] targetMeals = g.fromJson(targetList, String[].class);
		List<ChatBasketDTO> result = bService.extractIngredient(targetMeals);
		return g.toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value="addAiBasket", produces="text/plain; charset=utf8;")
	public void aiAddBasket(String aiBasketArr) {
		System.out.println(aiBasketArr);
		String[] targetIngredients = g.fromJson(aiBasketArr, String[].class);
		System.out.println(targetIngredients[0]);
		int memberCode = (int)session.getAttribute("code");
		bService.insertAiIngredients(memberCode, targetIngredients);
	}
}
