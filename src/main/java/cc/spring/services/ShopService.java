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
import cc.spring.dto.MemberDTO;
import cc.spring.dto.RequestListDTO;
import cc.spring.dto.ShopDTO;
import cc.spring.dto.ShopListDTO;
import cc.spring.repositories.FileDAO;
import cc.spring.repositories.ShopDAO;

@Service
public class ShopService {
	
	@Autowired
	private ShopDAO shopDAO;

	@Autowired
	private FileDAO fileDAO;
	
	// ShopRegister - 업체 정보 select
	public MemberDTO selectBusinessInfo(int memberCode) {
		return shopDAO.selectBusinessInfo(memberCode);
	}
	
	// 공구샵 등록 insert
	@Transactional
	public void insertShop(ShopDTO dto, String shippingCompany, MultipartFile[] files, String realPath) throws Exception {
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
		
		// member 배송 업체명(shippingCompany) update
		
	}

	// 일반 사용자인 경우 회원코드 가져오기
	public int isClientMemberCode(String loginId){
		return shopDAO.isClientMemberCode(loginId);
	}

	// 판매자인 경우 회원코드 가져오기
	public int isBusinessMemberCode(String loginId) {
		return shopDAO.isBusinessMemberCode(loginId);
	}

	// 공구샵 정보 select
	public ShopDTO selectShopInfo(int code) {
		
		ShopDTO dto = shopDAO.selectShopInfo(code);

		// Timestamp -> String
		Timestamp deadLine = dto.getDeadLine();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dto.setDeadLineTemp(dateFormat.format(deadLine));

		return dto;
	}

	// 공구샵 사진 select
	public List<FileDTO> selectShopImg(int code) {
		return fileDAO.selectShopImg(code);
	}

	// 공구샵 상품 목록
	public List<ShopListDTO> shopList(){
		return shopDAO.shopList();
	}
	
	//마감된 공구 목록
	public List<ShopListDTO> getStatusList(String status){
		return shopDAO.getStatusList(status);
	}
		
	// 공구샵 삼품 목록 검색
	public List<ShopListDTO> searchByKeyword(String category,String keyword){
		return shopDAO.searchByKeyword(category,keyword);
	}
	
	//일반회원 내 공구목록
	public List<ShopListDTO> clientBuyingList(int code){
		return shopDAO.clientBuyingList(code);
	}


	// 공구샵 수정 update
	@Transactional
	public void updateShop(ShopDTO dto, MultipartFile[] files, String realPath) throws Exception {

		int parentSeq = dto.getCode();	

		// shop 정보 update
		String deadLineTemp = dto.getDeadLineTemp();
		if(deadLineTemp != null) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date parsedDate = dateFormat.parse(deadLineTemp);
			Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
			dto.setDeadLine(timestamp);

			shopDAO.updateShop(dto);
		}

		// shop image update
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) realPathFile.mkdir();
		if(files != null) {
			// 삭제할 image 리스트 뽑아서 삭제하기
			//List<String> imageList = fileDAO.deleteImageList(dto.getCode());
			
			for(MultipartFile file : files) {
				if(file.isEmpty()) {break;}
				String oriName = file.getOriginalFilename();
				String sysName = UUID.randomUUID() + "_" + oriName;
				file.transferTo(new File(realPath+"/"+sysName));
				fileDAO.updateShopImage(new FileDTO(0, parentSeq, realPath,oriName, sysName));
			}
		}
	}

	// 공구샵 삭제 delete
	public int deleteShop(int code) {
		return shopDAO.deleteShop(code);
	}

	// 공구 신청 insert
	public int insertShopRequest(RequestListDTO dto) {
		return shopDAO.insertShopRequest(dto);
	}



}
