package cc.spring.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.ShopReplyAskDTO;
import cc.spring.repositories.ShopReplyDAO;

@Service
public class ShopReplyService {
	
	@Autowired
	private ShopReplyDAO shopReplyDAO;
	
	// 모든 댓글 select
	public List<ShopReplyAskDTO> selectShopReply(int code) {
		return shopReplyDAO.selectShopReply(code);
	}
	
	// 댓글 insert
	public int insertReplyAsk(ShopReplyAskDTO dto) {
		return shopReplyDAO.insertReplyAsk(dto);
	}
	
	// 댓글 update
	public int updateReplyAsk(ShopReplyAskDTO dto) {
		return shopReplyDAO.updateReplyAsk(dto);
	}
	
}
