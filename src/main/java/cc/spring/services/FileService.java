package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;

import cc.spring.dto.FileDTO;
import cc.spring.repositories.FileDAO;

public class FileService {
	
	@Autowired
	private FileDAO dao;
	
	public int insertShopImage(FileDTO dto) {
		return dao.insertShopImage(dto);
	}
	
}
