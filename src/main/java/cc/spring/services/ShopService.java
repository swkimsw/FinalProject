package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.repositories.ShopDAO;

@Service
public class ShopService {
	
	@Autowired
	private ShopDAO shopDAO;
	
	
}
