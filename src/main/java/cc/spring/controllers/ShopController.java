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
		String loginId = "aaa";
		int authgradeCode = 1003;

		// 일반 사용자인 경우 해당 ID의 회원코드 가져오기
		if(authgradeCode == 1003) {
			int clientMemberCode = shopService.isClientMemberCode(loginId);
			model.addAttribute("clientMemberCode", clientMemberCode);
		}

		// 선택한 공구샵 정보 가져오기
		ShopDTO shopDTO = shopService.selectShopInfo(code);
		
		model.addAttribute("loginId", loginId);
		model.addAttribute("shopDTO", shopDTO);
		model.addAttribute("authgradeCode", authgradeCode);
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

	// 공구샵 수정
	//		@RequestMapping("updateShop")
	//		public String updateShop(ShopDTO dto) throws Exception {
	//			
	//		}

	// 공구샵 삭제
	@RequestMapping("deleteShop")
	public String deleteShop(int code) {
		shopService.deleteShop(code);
		// 공구샵 리스트로 가도록 수정 !!!!!!!
		return "redirect:/";
	}

	// 공구샵 신청시 DB에 insert
	@RequestMapping("insertShopRequest")
	public String insertShopRequest(int quantity, int code, int clientMemberCode) {
		shopService.insertShopRequest(quantity);
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
