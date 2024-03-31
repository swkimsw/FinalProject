package cc.spring.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.BanMemberDTO;
import cc.spring.dto.BoardCountDTO;
import cc.spring.dto.MemberDTO;
import cc.spring.dto.ShopListDTO;
import cc.spring.dto.gptCountDTO;
import cc.spring.dto.loginCountDTO;


@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public boolean login(String id, String pw) {
		Map<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return mybatis.selectOne("Admin.login", param);
	}
	
	public MemberDTO selectAdminMemberInfo(String id, String pw) {
		Map<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return mybatis.selectOne("Admin.selectAdminMemberInfo",param);
	}
	
	public int selectSuccessMeal() {
		return mybatis.selectOne("Admin.selectSuccessMeal");
	}
	
	public int selectFailMeal() {
		return mybatis.selectOne("Admin.selectFailMeal");
	}
	
	public int selectSuccessBasket() {
		return mybatis.selectOne("Admin.selectSuccessBasket");
	}
	
	public int selectFailBasket() {
		return mybatis.selectOne("Admin.selectFailBasket");
	}
	
	public int selectTotalSuccess() {
		return mybatis.selectOne("Admin.selectTotalSuccess");
	}
	
	public int selectTotalFail() {
		return mybatis.selectOne("Admin.selectTotalFail");
	}
	public List<ShopListDTO> selectShopList() {
		return mybatis.selectList("Admin.selectShopList");
	}
	public int insertGptCount(gptCountDTO dto) {
		return mybatis.insert("Admin.insertGptCount", dto);
	}
	
	public int insertloginCount(loginCountDTO dto) {
		return mybatis.insert("Admin.insertLoginCount", dto);
	}
	
	public int updatelogintCount(loginCountDTO dto) {
		return mybatis.update("Admin.updateLoginCount", dto);
	}
	
	public int recentVisitClient() {
		return mybatis.selectOne("Admin.recentVisitClient");
	}
	
	public int recentVisitBusiness() {
		return mybatis.selectOne("Admin.recentVisitBusiness");
	}
	
	public int deleteBanMember(int memberCode) {
		return mybatis.delete("Admin.deleteBanMember", memberCode);
	}
	
	public int insertBanMember(BanMemberDTO dto) {
		return mybatis.insert("Admin.insertBanMember", dto);
	}
	
	public List<MemberDTO> selectUserList(){
		return mybatis.selectList("Admin.selectUserList");
	}
	
	public List<BanMemberDTO> selectBanUserList(){
		return mybatis.selectList("Admin.selectBanUserList");
	} 
	public List<BoardCountDTO> boardAnnouncementCount(){
		return mybatis.selectList("Admin.boardAnnouncementCount");
	}
	
	public List<BoardCountDTO> boardFreeCount(){
		return mybatis.selectList("Admin.boardFreeCount");
	}
	
	public List<BoardCountDTO> boardReviewCount(){
		return mybatis.selectList("Admin.boardReviewCount");
	}
	
	public MemberDTO selectBanUser(int memberCode) {
		return mybatis.selectOne("Admin.selectBanUser", memberCode);
	}
	
	public boolean banCheck(int code) {
		return mybatis.selectOne("Admin.banCheck", code);
	}
}