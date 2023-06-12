package cc.spring.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
		String loginId = "11122541";
	
		// 선택한 공구샵 정보 가져오기
		ShopDTO shopDTO = shopService.selectShopInfo(code);
		
		// 이용자인지 판매자인지 검색 (result가 0:글 등록한 판매자 / 1:이용자 / 2:글 등록하지 않은 판매자)
		int result = shopService.isClientMember(loginId);
		if(result == 0) {
			if(loginId.equals(shopDTO.getBusinessId())) {
				System.out.println("내가 쓴 글 !");
				result = 2;
			}
		}
		
		model.addAttribute("shopDTO", shopDTO);
		model.addAttribute("result", result);
		return "/shop/shopApply";
	}

	// 공구샵 등록시 DB에 insert
	@RequestMapping("insertShop")
	public String insertShop(ShopDTO dto, MultipartFile[] files) throws Exception {

		// realPath - 폴더가 없다면 만들기
		String realPath = session.getServletContext().getRealPath("upload");
		shopService.insertShop(dto, files, realPath);

		return "redirect:/";
	}
	
	
//최은지 Part
 	
 	//공구 목록으로 이동
 	 	@RequestMapping("toShopList")
 		public String toShopList(Model model) {
 	 		List<ShopListDTO> list = shopService.ShopList();
 	 		model.addAttribute("list",list);
 			return "/shop/shopList";
 		}

	
	
	//예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}

}
