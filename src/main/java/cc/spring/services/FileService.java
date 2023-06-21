package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import cc.spring.dto.FileDTO;
import cc.spring.dto.ReviewImgDTO;
import cc.spring.repositories.FileDAO;

@Service
public class FileService {
	
	@Autowired
	private FileDAO dao;
	
	
	
	
	public int insertShopImage(FileDTO dto) {
		return dao.insertShopImage(dto);
	}


	

	public String uploadImage(MultipartFile file) {
		// TODO Auto-generated method stub
		return null;
	}



	


	
	
}
