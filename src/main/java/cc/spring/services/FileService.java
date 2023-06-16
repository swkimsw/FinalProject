package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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




	public int insertReviewImage(int postcode,String path,String oriname,String sysname) {
		 ReviewImgDTO dto = new ReviewImgDTO(0 , postcode, path, oriname, sysname);
		  return  dao.insertReviewImage(dto);
	}

	
	
}
