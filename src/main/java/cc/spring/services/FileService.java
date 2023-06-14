package cc.spring.services;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

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


	public void insertReviewImage(String realPath, MultipartFile[] file_list, int parent_seq) throws Exception{

		File realPathFile = new File(realPath); //realPath의 경로를 기반으로 한 file 객체 생성
		if(!realPathFile.exists()) { realPathFile.mkdir(); } //경로에 upload라는 파일이객체가 없으면 생성해라
		
		if(file_list != null) { //jsp에서 설정한 name이름이 files인데 그 안에 값이 없으면 null로 들어옴
			for(MultipartFile file : file_list) {
				if(file.isEmpty()) {break;} // 파일이 비어있는지 검색하는 로직
				String oriName = file.getOriginalFilename(); //파일의 원래 이름
				String sysName = UUID.randomUUID() + "_" + oriName ; 

				file.transferTo(new File(realPath + "/" + sysName));
				//새로운 파일의 이름으로 realpath경로에 파일을 저장하는것

				dao.insertReviewImage(new ReviewImgDTO(0,parent_seq,realPath,oriName,sysName));
				
			}
		}
		
		
	}


	public String uploadImage(MultipartFile file) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
