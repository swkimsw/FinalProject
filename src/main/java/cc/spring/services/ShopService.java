package cc.spring.services;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.ShopDTO;
import cc.spring.repositories.ShopDAO;

@Service
public class ShopService {
	
	@Autowired
	private ShopDAO shopDAO;
	
	public int insertShop(ShopDTO dto) throws Exception {
		String deadLineTemp = dto.getDeadLineTemp();
		if(deadLineTemp != null) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date parsedDate = dateFormat.parse(deadLineTemp);
			Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
			dto.setDeadLine(timestamp);
			
			return shopDAO.insertShop(dto);
		}
		return 0;
	}
	
}
