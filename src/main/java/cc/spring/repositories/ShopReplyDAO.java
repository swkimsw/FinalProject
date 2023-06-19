package cc.spring.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.ShopReplyAskDTO;

@Repository
public class ShopReplyDAO {
	
	@Autowired
	private SqlSessionTemplate db;
	
	public List<ShopReplyAskDTO> selectShopReply(int code) {
		return db.selectList("ShopReply.selectShopReply", code);
	}
	
}
