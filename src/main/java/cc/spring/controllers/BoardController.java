package cc.spring.controllers;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board/")
public class BoardController {

	@RequestMapping("free")
	public String list_free() {
		return "/board/boardFree";
	}
	
	
	@RequestMapping("announcement")
	public String list_Announcement() {
		return "/board/boardAnnouncement";
	}
	
	@RequestMapping("free_write")
	public String free_write() {
		return "/board/boardFreeWrite";
	}
	
	@RequestMapping("announcement_write")
	public String announcement_write() {
		return "/board/boardAnnouncementWrite";
	}
}
