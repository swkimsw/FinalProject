package cc.spring.services;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import cc.spring.dto.FileDTO;
import cc.spring.dto.ShopDTO;
import cc.spring.repositories.FileDAO;
import cc.spring.repositories.ShopDAO;

@Service
public class ShopService {
	
	@Autowired
	private ShopDAO shopDAO;
	
	@Autowired
	private FileDAO fileDAO;
	
	@Transactional
	public void insertShop(ShopDTO dto, MultipartFile[] files, String realPath) throws Exception {
		int parentSeq = 0;
		
		// shop 정보 insert
		String deadLineTemp = dto.getDeadLineTemp();
		if(deadLineTemp != null) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date parsedDate = dateFormat.parse(deadLineTemp);
			Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
			dto.setDeadLine(timestamp);
			
			parentSeq = shopDAO.insertShop(dto);
		}
		
		// shop image insert
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) realPathFile.mkdir();
		if(files != null) {
			for(MultipartFile file : files) {
				if(file.isEmpty()) {break;}
				String oriName = file.getOriginalFilename();
				String sysName = UUID.randomUUID() + "_" + oriName;
				file.transferTo(new File(realPath+"/"+sysName));
				fileDAO.insertShopImage(new FileDTO(0, parentSeq, realPath,oriName, sysName));
			}
		}
	}
	
	public ShopDTO selectShopInfo(int code) {
		
		ShopDTO dto = shopDAO.selectShopInfo(code);
		
		// Timestamp -> String
		Timestamp deadLine = dto.getDeadLine();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dto.setDeadLineTemp(dateFormat.format(deadLine));
		
		return dto;
	}
	
	public List<FileDTO> selectShopImg(int code) {
		return fileDAO.selectShopImg(code);
	}
	
//	public ? insertShopRequest() {
//		
//	}
	
}
