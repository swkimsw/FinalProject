package cc.spring.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.BoardFreeDTO;
import cc.spring.repositories.ClientMyPageDAO;

@Service
public class ClientMyPageService {

	@Autowired
	private ClientMyPageDAO cmdao;
	
	public List<BoardFreeDTO> myPageList(int code) {
		System.out.println("죽고잡냐");
		return cmdao.selectCode(code);
	
	
}
//	잠시 대기 하단페이징
//	public List<String> getPageNavi(int recordCount, int currentPage) throws Exception {
//		int recordTotalCount = recordCount;
//		int recordCountPerPage = 10;
////				Settings.BOARD_RECORD_COUNT_PER_PAGE;
//		int naviCountPerPage = 10;
////				Settings.BOARD_NAVI_COUNT_PER_PAGE;
//
//		int pageTotalCount = (int) Math.ceil(recordTotalCount / (double) recordCountPerPage);
//
//		if (currentPage < 1) {
//			currentPage = 1;
//		} else if (currentPage > pageTotalCount) {
//			currentPage = pageTotalCount;
//		}
//		int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
//		int endNavi = startNavi + (naviCountPerPage - 1);
//		if (endNavi > pageTotalCount) {
//			endNavi = pageTotalCount;
//		}
//		boolean needPagePrev = true;
//		boolean needPageNext = true;
//		boolean needPrev = true;
//		boolean needNext = true;
//		if (startNavi == 1) {
//			needPagePrev = false;
//		}
//		if (endNavi == pageTotalCount) {
//			needPageNext = false;
//		}
//		if (currentPage == pageTotalCount) {
//			needNext = false;
//		}
//		if (currentPage == 1) {
//			needPrev = false;
//		}
//		List<String> list = new ArrayList<>();
//		if (needPagePrev) {
//			list.add("<<");
//		}
//		if (needPrev) {
//			list.add("<");
//		}
//		for (int i = startNavi; i <= endNavi; i++) {
//
//			list.add(String.valueOf(i));
//
//		}
//		if (needNext) {
//			list.add(">");
//		}
//		if (needPageNext) {
//			list.add(">>");
//		}
//
//		return list;
//
//	}

}
