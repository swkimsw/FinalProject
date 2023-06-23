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
import cc.spring.dto.MyShopListDTO;
import cc.spring.dto.MemberDTO;
import cc.spring.dto.RequestListDTO;
import cc.spring.dto.ShopDTO;
import cc.spring.dto.ShopListDTO;
import cc.spring.repositories.BusinessMemberDAO;
import cc.spring.repositories.FileDAO;
import cc.spring.repositories.ShopDAO;

@Service
public class ShopService {
	
	@Autowired
	private ShopDAO shopDAO;

	@Autowired
	private FileDAO fileDAO;
	
	@Autowired
	private BusinessMemberDAO businessMemberDAO;
	
//--김은지 Part---------------------------------------------------------------------------------------------------------	
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
		businessMemberDAO.updateShippingCompany(new MemberDTO(dto.getMemberCode(), shippingCompany));
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
	
	// 공구샵 수정 update
	@Transactional
	public void updateShop(ShopDTO dto, String shippingCompany, MultipartFile[] files, String realPath) throws Exception {

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
		
		// member 배송 업체명(shippingCompany) update
		businessMemberDAO.updateShippingCompany(new MemberDTO(dto.getMemberCode(), shippingCompany));		
	}

	// 공구샵 삭제 delete
	public int deleteShop(int code) {
		return shopDAO.deleteShop(code);
	}

	// 공구 신청 insert
	public int insertShopRequest(RequestListDTO dto) {
		return shopDAO.insertShopRequest(dto);
	}
	
	// 최대 인원수가 되면 더 이상 신청하지 못하도록 - 요청 인원수 select
	public int isCountRequest(int code) {
		return shopDAO.isCountRequest(code);
	}
	
	// 이미 공구 신청한 경우 더 이상 신청하지 못하도록 - 해당 멤버코드로 신청 select
	public int isExistRequest(int code, String memberCode) {
		return shopDAO.isExistRequest(code, memberCode);
	}

//--최은지 Part---------------------------------------------------------------------------------------------------------	
	// 전체 공구 목록
	public List<ShopListDTO> shopList(){
		return shopDAO.shopList();
	}
	
	//status별(진행중,마감,종료) 공구 목록
	public List<ShopListDTO> getStatusList(String status){
		return shopDAO.getStatusList(status);
	}
		
	// 공구 카테고리별 키워드 검색
	public List<ShopListDTO> searchByKeyword(String category,String keyword){
		return shopDAO.searchByKeyword(category,keyword);
	}
	
	//로그인한 회원의 이름, 사업장명, id만 가져오기
	public MyShopListDTO getInfo(int code) {
		return shopDAO.getInfo(code);
	}
	
	//일반회원 내 공구 신청 목록
	public List<MyShopListDTO> clientBuyingList(int code){
		return shopDAO.clientBuyingList(code);
	}
	
	//사업자회원 내 공구 등록 목록 
	public List<MyShopListDTO> businessRegisterList(int code){
		return shopDAO.businessRegisterList(code);
	}
	
	//사업자회원용 공구 신청인 정보(이름,배송지,전화번호,수량 등등) 목록
	public List<MyShopListDTO> buyingMemberInfoList(int groupbuyingCode){
		return shopDAO.buyingMemberInfoList(groupbuyingCode);
	}



}
