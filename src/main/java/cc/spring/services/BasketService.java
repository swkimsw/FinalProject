package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.provider.ChatGPTProvider;
import cc.spring.repositories.BasketDAO;

@Service
public class BasketService {
	
	@Autowired
	private ChatGPTProvider GPTprovider;
	
	@Autowired
	private BasketDAO basketDAO;
	
}
