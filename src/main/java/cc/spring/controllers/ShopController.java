package cc.spring.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cc.spring.dto.FileDTO;
import cc.spring.dto.RequestListDTO;
import cc.spring.dto.ShopDTO;
import cc.spring.dto.ShopListDTO;
import cc.spring.services.ShopService;

@Controller
@RequestMapping("/shop/")
public class ShopController {

	@Autowired
	private ShopService shopService;

	@Autowired
	private HttpSession session;


	//김은지 Part	
	// 공구샵 등록 폼으로 이동
	@RequestMapping("toShopRegister")
	public String toShopRegister() {
		return "/shop/shopRegister";
	}

	// 공구샵 신청 폼으로 이동
	@RequestMapping("toShopApply")
	public String toShopApply(int code, Model model) {
		// 세션에서 ID 받아오게 수정
		String loginId = "1112254";
		int authgradeCode = 1002;

		// 일반 사용자인 경우 해당 ID의 회원코드 가져오기
		if(authgradeCode == 1003) {
			int clientCode = shopService.isClientMemberCode(loginId);
			model.addAttribute("clientCode", clientCode);
		}
		model.addAttribute("clientCode", 0);
		
		// 선택한 공구샵 정보 가져오기
		ShopDTO shopDTO = shopService.selectShopInfo(code);
		
		// 선택한 공구샵 이미지 가져오기
		List<FileDTO> fileDTO = shopService.selectShopImg(code);
		
		model.addAttribute("loginId", loginId);
		model.addAttribute("shopDTO", shopDTO);
		model.addAttribute("fileDTO", fileDTO);
		model.addAttribute("authgradeCode", authgradeCode);
		return "/shop/shopApply";
	}

	// 공구샵 등록시 DB에 insert
	@RequestMapping("insertShop")
	public String insertShop(ShopDTO dto, MultipartFile[] files) throws Exception {

		// realPath - 폴더가 없다면 만들기
		String realPath = session.getServletContext().getRealPath("/resources/shopImg");
		shopService.insertShop(dto, files, realPath);

		return "redirect:/";
	}

	
//최은지 Part
 	
 	//공구 목록으로 이동
 	 	@RequestMapping("toShopList")
 		public String toShopList(Model model) throws Exception{
 	 		List<ShopListDTO> list = shopService.shopList();
 	 		System.out.println(list);
 	 		
 	 		Map< ShopListDTO, Integer> dDayMap = new HashMap<>();
 	 		SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy-MM-dd");
 	 		for(ShopListDTO d : list) {
 	 			String deadLineFmt = dateFmt.format(d.getDeadLine());
 	 			String todayFmt = dateFmt.format(new Date(System.currentTimeMillis()));
 	 			System.out.println("여긴 데이트포맷"+ deadLineFmt + "/" + todayFmt);
 	 			
 	 			Date deadLine = new Date(dateFmt.parse(deadLineFmt).getTime());
 	 			Date today = new Date(dateFmt.parse(todayFmt).getTime());
 	 			System.out.println("여긴 데이트타임"+ deadLine + "/" + today);
 	 			
 	 			long calculate = deadLine.getTime() - today.getTime();
 	 			System.out.println(calculate);
 	 			
 	 			int dDay = (int)(calculate / (24*62*62*1000));
 	 			System.out.println("디데이는" + dDay);
 	 			
 	 			d.setdDay(dDay);
 	 			dDayMap.put(d, dDay);
 	 		}
 	 		
 	 		model.addAttribute("list",list);
 			return "/shop/shopList";
 		}


	// 공구샵 수정
	@RequestMapping("updateShop")
	public String updateShop(ShopDTO dto, MultipartFile[] files) throws Exception {
		// realPath - 폴더가 없다면 만들기
		String realPath = session.getServletContext().getRealPath("/resources/shopImg");
		shopService.updateShop(dto, files, realPath);
		return "redirect:/shop/toShopApply?code="+dto.getCode();
	}

	// 공구샵 삭제
	@RequestMapping("deleteShop")
	public String deleteShop(int code) {
		shopService.deleteShop(code);
		return "redirect:/shop/toShopList";
	}

	// 공구샵 신청시 DB에 insert
	@RequestMapping("insertShopRequest")
	public String insertShopRequest(int clientCode, int quantity, int parentCode) {
		shopService.insertShopRequest(new RequestListDTO(clientCode,quantity,parentCode));
		return "redirect:/shop/toShopList";
	}




	//예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}

}
