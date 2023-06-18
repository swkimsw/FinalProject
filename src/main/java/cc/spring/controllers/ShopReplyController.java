package cc.spring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.spring.services.ShopReplyService;

@Controller
@RequestMapping("/shopReply/")
public class ShopReplyController {

	@Autowired
	private ShopReplyService replyService;
	
	
}
