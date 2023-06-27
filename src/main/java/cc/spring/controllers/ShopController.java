package cc.spring.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cc.spring.dto.FileDTO;
import cc.spring.dto.MemberDTO;
import cc.spring.dto.MyShopListDTO;
import cc.spring.dto.RequestListDTO;
import cc.spring.dto.ShopDTO;
import cc.spring.dto.ShopListDTO;
import cc.spring.dto.ShopReplyAnswerDTO;
import cc.spring.dto.ShopReplyAskDTO;
import cc.spring.services.BusinessMemberService;
import cc.spring.services.ShopReplyService;
import cc.spring.services.ShopService;

@Controller
@RequestMapping("/shop/")
public class ShopController {

	@Autowired
	private ShopService shopService;

	@Autowired
	private ShopReplyService shopReplyService;

	@Autowired
	private BusinessMemberService businessMemberService;

	@Autowired
	private HttpSession session;


//--김은지 Part--------------------------------------------------------------------------------------------------------	
	// 공구샵 등록 폼으로 이동
	@RequestMapping("toShopRegister")
	public String toShopRegister(Model model) {

		// 업체명 / 배송 업체 정보 가져오기
		String loginId = (String) session.getAttribute("id");

		MemberDTO memberDTO = businessMemberService.selectBusinessMemberInfo(loginId);
		model.addAttribute("memberDTO", memberDTO);

		return "/shop/shopRegister";
	}

	// 공구샵 신청 폼으로 이동
	@RequestMapping("toShopApply")
	public String toShopApply(int code, Model model) {

		// 선택한 공구샵 정보 가져오기
		ShopDTO shopDTO = shopService.selectShopInfo(code);

		// 선택한 공구샵 이미지 가져오기
		List<FileDTO> fileDTO = shopService.selectShopImg(code);
		
		// 선택한 공구샵 업체 정보 가져오기
		MemberDTO memberDTO = businessMemberService.selectMemberInfoByCode(shopDTO.getMemberCode());

		// 선택한 공구샵 댓글 목록 가져오기
		List<ShopReplyAskDTO> shopReplyAskDTO = shopReplyService.selectShopReply(code);

		// 선택한 공구샵 답글 목록 가져오기
		List<ShopReplyAnswerDTO> shopReplyAnswerDTO = shopReplyService.selectShopReplyAnswer(code);

		model.addAttribute("shopDTO", shopDTO);
		model.addAttribute("fileDTO", fileDTO);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("shopReplyAskDTO", shopReplyAskDTO);
		model.addAttribute("shopReplyAnswerDTO", shopReplyAnswerDTO);
		return "/shop/shopApply";
	}

	// 공구샵 등록시 DB에 insert
	@RequestMapping("insertShop")
	public String insertShop(ShopDTO dto, String shippingCompany, MultipartFile[] files) throws Exception {

		// realPath - 폴더가 없다면 만들기
		String realPath = session.getServletContext().getRealPath("/resources/shopImg");
		shopService.insertShop(dto, shippingCompany, files, realPath);

		System.out.println(dto.getDeadLineTemp());
		
		return "redirect:/";
	}

	// 공구샵 수정
	@RequestMapping("updateShop")
	public String updateShop(ShopDTO dto, String shippingCompany, MultipartFile[] files) throws Exception {
		// realPath - 폴더가 없다면 만들기
		String realPath = session.getServletContext().getRealPath("/resources/shopImg");
		shopService.updateShop(dto, shippingCompany, files, realPath);
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
	public String insertShopRequest(int memberCode, int quantity, int parentCode) {
		shopService.insertShopRequest(new RequestListDTO(memberCode,quantity,parentCode));
		return "redirect:/shop/toShopList";
	}
	
	// 이미 공구 신청한 경우 더 이상 신청하지 못하도록 - 해당 멤버코드로 신청 select
	@ResponseBody
	@RequestMapping("isExistRequest")
	public int isExistRequest(int code, String memberCode) {
		int result = shopService.isExistRequest(code, memberCode);
		return result;
	}




//--최은지 Part---------------------------------------------------------------------------------------------------------
 	
	 	//공구 목록으로 이동:  key값이 status인 매개변수로 넘어오는 값에 따라 진행사항별(진행중,마감) 목록
	 	 	@RequestMapping("toShopList")
	 		public String toShopList(@RequestParam(name="status",required=false,defaultValue="") String status, Model model) throws Exception{
	 	 		List<ShopListDTO> list = new ArrayList<ShopListDTO>();
	 	 	
	 	 		if(status.equals("closed")){
	 	 			//마감된 공구 list: 매개변수가 closed일 때 ->  마감,실패한 공구 목록
	 	 			list = shopService.getStatusList(status);
	 	 		}else if(status.equals("open")){
	 	 			//진행중인 공구 list: 매개변수가 open일 때 -> 진행중인 공구 목록
	 	 	 		list = shopService.getStatusList(status);
	 	 		}else {
	 	 			//전체 공구 list: 매개변수가 없을 때 -> 전체 공구 목록
	 	 			list = shopService.shopList();
	 	 		}
	 	 		
	 	 		//마감일 디데이 계산
	 	 		Map< ShopListDTO, Integer> dDayMap = new HashMap<>();
	 	 		SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy-MM-dd");
	 	 		for(ShopListDTO d : list) {
	 	 			String deadLineFmt = dateFmt.format(d.getDeadLine());
	 	 			String todayFmt = dateFmt.format(new Date(System.currentTimeMillis()));
	 	 			
	 	 			Date deadLine = new Date(dateFmt.parse(deadLineFmt).getTime());
	 	 			Date today = new Date(dateFmt.parse(todayFmt).getTime());
	 	 			
	 	 			long calculate = deadLine.getTime() - today.getTime();
	 	 			int dDay = (int)(calculate / (24*60*60*1000));
	 	 			
	 	 			d.setdDay(dDay);
	 	 			dDayMap.put(d, dDay);
	 	 		}
	 	 		//상품정보, 이미지정보, 디데이 전송
	 	 		model.addAttribute("list",list);
	 	 		
	 			return "/shop/shopList";
	 		}
	 	
	 	 //공구 목록 검색: 검색어와 카테고리(상품명과 판매자명)에 따라 검색 
	 	 	@ResponseBody
	 	 	@RequestMapping("searchByKeyword")
	 	 	public List<ShopListDTO> searchByKeyword(String category, String keyword) throws Exception{
	 	 		List<ShopListDTO> searchList = shopService.searchByKeyword(category,keyword);
	 	 		
	 	 		Map< ShopListDTO, Integer> dDayMap = new HashMap<>();
	 	 		SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy-MM-dd");
	 	 		for(ShopListDTO d : searchList) {
	 	 			String deadLineFmt = dateFmt.format(d.getDeadLine());
	 	 			String todayFmt = dateFmt.format(new Date(System.currentTimeMillis()));
	 	 			
	 	 			Date deadLine = new Date(dateFmt.parse(deadLineFmt).getTime());
	 	 			Date today = new Date(dateFmt.parse(todayFmt).getTime());
	 	 			
	 	 			long calculate = deadLine.getTime() - today.getTime();
	 	 			int dDay = (int)(calculate / (24*60*60*1000));
	 	 			
	 	 			d.setdDay(dDay);
	 	 			dDayMap.put(d, dDay);
	 	 		}
	 	 		System.out.println("겨얼과는:" + searchList);
	 			return searchList;
	 	 	}
	 	 	
	 	 //내 공구목록: session에 저장된 authGradeCode(1002,1003)에 따라 다른 목록 출력
	 	 @RequestMapping("toMyShopList")
	 	 public String toMyShopList(Model model) {
	 		int code = (Integer)session.getAttribute("code");
	 		int authGradeCode = (Integer)session.getAttribute("authGradeCode");
	 		MyShopListDTO info = shopService.getInfo(code);
	 		model.addAttribute("info",info);
	 		
	 		List<MyShopListDTO> list = new ArrayList<>();
	 		//사업자일 때 공구 등록 목록으로 이동
	 		if(authGradeCode == 1002) {
	 			list = shopService.businessRegisterList(code);
	 			
	 		//일반회원일 때 공구 신청 목록으로 이동
	 		}else if(authGradeCode == 1003) {
	 			list = shopService.clientBuyingList(code);
	 		}
	 		
	 	 	model.addAttribute("list",list);
	 	 	return "/shop/myShopList";
	 	 }

	 	 //사업자회원용 공구 신청인 정보 목록: 사업자회원 공구 등록 목록에서 출력
	 	 @RequestMapping("buyingMemberInfoList")
	 	 public String buyingMemberInfoList(@RequestParam(name="code",required=true,defaultValue="") String code, Model model) {
	 		int groupbuyingCode = Integer.parseInt(code);
	 		System.out.println("넘어온 코드는"+groupbuyingCode);
	 		List<MyShopListDTO> list = shopService.buyingMemberInfoList(groupbuyingCode);
	 		System.out.println(list);
	 		model.addAttribute("list",list);
	 		return "/shop/infoPopup";
	 	 }
	
	
	//예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}

}
