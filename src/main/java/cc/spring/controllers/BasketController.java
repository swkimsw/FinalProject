package cc.spring.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
		
		int memberCode = -1;
		if(session.getAttribute("code") != null) {
			memberCode = (int)session.getAttribute("code");
		}
		
		if(memberCode == -1) {
			return "redirect:/clientMember/login_form";
		}else {
			List<BasketDTO> basketList = bService.selectBasket(memberCode);
			model.addAttribute("basketList", basketList);
			return "meal/basket";		
		}
	}
	
	@ResponseBody
	@RequestMapping(value="updateChecked", produces="text/plain; charset=utf8;")
	public String updateChecked(int code) {
		int memberCode = (int)session.getAttribute("code");
		int result = bService.updateChecked(new BasketDTO(code,memberCode,null,0));
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping(value="updateUnchecked", produces="text/plain; charset=utf8;")
	public String updateUnchecked(int code) {
		int memberCode = (int)session.getAttribute("code");
		int result = bService.updateUnchecked(new BasketDTO(code,memberCode,null,0));
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping(value="checkAll", produces="text/plain; charset=utf8;")
	public String checkAll() {
		int memberCode = (int)session.getAttribute("code");
		return bService.checkAll(memberCode)+"";
	}
	
	@ResponseBody
	@RequestMapping(value="uncheckAll", produces="text/plain; charset=utf8;")
	public String uncheckAll() {
		int memberCode = (int)session.getAttribute("code");
		return bService.uncheckAll(memberCode)+"";
	}
	
	@ResponseBody
	@RequestMapping(value="insertOne", produces="text/plain; charset=utf8;")
	public String insertOne(String name) {
		int memberCode = (int)session.getAttribute("code");
		return bService.insertOne(new BasketDTO(0,memberCode, name, 0))+"";
	}
	
	@ResponseBody
	@RequestMapping("deleteBasket")
	public String deleteBasket(int basketCode) {
		int memberCode = (int)session.getAttribute("code");
		return bService.deleteBasket(new BasketDTO(basketCode, memberCode, null, 0))+"";
	}
	
	@ResponseBody
	@RequestMapping("deleteAllBasket")
	public String deleteAllBasket () {
		int memberCode = (int)session.getAttribute("code");
		return bService.deleteAllBasket(memberCode)+"";
	}
	
	@ResponseBody
	@RequestMapping(value="aiBasket", produces="text/plain; charset=utf8;")
	public String aiBasket(String targetList) throws Exception{
		System.out.println(targetList.toString());
		String[] targetMeals = g.fromJson(targetList, String[].class);
		List<ChatBasketDTO> result = bService.extractIngredient(targetMeals);
		System.out.println(result.toString());
		return g.toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value="addAiBasket", produces="text/plain; charset=utf8;")
	public void aiAddBasket(String aiBasketArr) {
		String[] targetIngredients = g.fromJson(aiBasketArr, String[].class);
		int memberCode = (int)session.getAttribute("code");
		bService.insertAiIngredients(memberCode, targetIngredients);
	}
	
	@ResponseBody
	@RequestMapping(value="successCount", produces="text/plain; charset=utf8;")
	public void successCount() {
		int memberCode = (int)session.getAttribute("code");
		bService.successCount(memberCode);
	}
	
	@ResponseBody
	@RequestMapping(value="failCount", produces="text/plain; charset=utf8;")
	public void failCount() {
		int memberCode = (int)session.getAttribute("code");
		bService.failCount(memberCode);
	}
}