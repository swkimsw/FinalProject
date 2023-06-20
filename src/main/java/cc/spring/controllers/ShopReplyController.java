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
	
	// 공구샵 댓글 입력
	@RequestMapping("insertReplyAsk")
	public String insertReplyAsk(ShopReplyAskDTO dto) {
		shopReplyService.insertReplyAsk(dto);
		return "redirect:/shop/toShopApply?code="+dto.getPostCode();
	}
	
	// 공구샵 본인 댓글 수정
	@RequestMapping("updateReplyAsk")
	public String updateReplyAsk(int code, int postCode, String content) {
		ShopReplyAskDTO dto = new ShopReplyAskDTO(code, postCode, 0, content, null, null, null, null);
		
		shopReplyService.updateReplyAsk(dto);
		return "redirect:/shop/toShopApply?code="+postCode;
	}
	
	// 공구샵 본인 댓글 삭제
	@RequestMapping("deleteReplyAsk")
	public String deleteReplyAsk(int code, int postCode) {
		ShopReplyAskDTO dto = new ShopReplyAskDTO(code, postCode);
		
		shopReplyService.deleteReplyAsk(dto);
		return "redirect:/shop/toShopApply?code="+postCode;
	}
	
	// 공구샵 판매자 답글 입력
	@RequestMapping("insertReplyAnswer")
	public String insertReplyAnswer() {
		
		return "";
	}
	
	
}
