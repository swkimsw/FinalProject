package cc.spring.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.MemberDTO;
import cc.spring.repositories.AdminMemberDAO;
import cc.spring.repositories.BusinessMemberDAO;
import cc.spring.repositories.ClientMemberDAO;

@Service
public class AdminMemberService {
	@Autowired
	private AdminMemberDAO aDAO;
	
	@Autowired
	private BusinessMemberDAO bDAO;
	
	@Autowired
	private ClientMemberDAO cDAO;
	
	public boolean login(String id, String pw) {
		return aDAO.login(id, pw);
	}
	
	public MemberDTO selectAdminMemberInfo(String id, String pw) {
		return aDAO.selectAdminMemberInfo(id, pw);
	}
	
	public List<MemberDTO> selectAllBusinessMember() {
		return bDAO.selectAllBusinessMember();
	}
	
	public List<MemberDTO> selectAllClientMember() {
		return cDAO.selectAllClientMember();
	}
	
	public Map<String, Integer> selectMealCount() {
		Map<String, Integer> mealCountMap = new HashMap<String, Integer>();
		mealCountMap.put("mealSuccessTotal", aDAO.selectSuccessMeal());
		mealCountMap.put("mealFailTotal", aDAO.selectFailMeal());
		return mealCountMap;
	}	
	
	public Map<String, Integer> selectBasketCount(){
		Map<String, Integer> basketCountMap = new HashMap<>();
		basketCountMap.put("basketSuccess", aDAO.selectSuccessBasket());
		basketCountMap.put("basketFail", aDAO.selectFailBasket());
		return basketCountMap;
	}
	
	public Map<String, Integer> selectTotalCount(){
		Map<String, Integer> totalCountMap = new HashMap<>();
		totalCountMap.put("totalSuccess", aDAO.selectTotalSuccess());
		totalCountMap.put("totalFail", aDAO.selectTotalFail());
		return totalCountMap;
	}
	
	public List<MemberDTO> ClinetUserList() {
		return aDAO.clientUserList();
	}

  public List<MemberDTO> BusinessUserList() {
		return aDAO.businessUserList();
	}
	
	public Map<String, Integer> recentVisitCount() {
		Map<String, Integer> recentVisitMap = new HashMap<>();
		recentVisitMap.put("recentVisitClient", aDAO.recentVisitClient());
		recentVisitMap.put("recentVisitBusiness", aDAO.recentVisitBusiness());
		return recentVisitMap;
  }

}
