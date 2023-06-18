package cc.spring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.spring.services.ReplyService;

@Controller
@RequestMapping("/reply/")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	
}
