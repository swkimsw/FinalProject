package cc.spring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.spring.dto.ShopReplyAskDTO;
import cc.spring.services.ShopReplyService;

@Controller
@RequestMapping("/shopReply/")
public class ShopReplyController {

	@Autowired
	private ShopReplyService shopReplyService;
	
	@RequestMapping("insertReplyAsk")
	public String insertReplyAsk(ShopReplyAskDTO dto) {
		shopReplyService.insertReplyAsk(dto);
		return "redirect:/shop/toShopApply?code="+dto.getPostCode();
	}
	
	@RequestMapping("updateReplyAsk")
	public String updateReplyAsk(int code, String content) {
		System.out.println(code);
		System.out.println(content);
		ShopReplyAskDTO dto = new ShopReplyAskDTO(code,content);
		shopReplyService.updateReplyAsk(dto);
		return "";
	}
	
	
}
