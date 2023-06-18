package cc.spring.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.ShopReplyAskDTO;
import cc.spring.repositories.ReplyDAO;

@Service
public class ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;
	
	public List<ShopReplyAskDTO> selectShopReply(int code) {
		return replyDAO.selectShopReply(code);
	}
}
