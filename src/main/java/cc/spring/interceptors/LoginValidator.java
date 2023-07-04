package cc.spring.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import cc.spring.services.AdminMemberService;

public class LoginValidator implements HandlerInterceptor{
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private AdminMemberService adminService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		Integer code = (Integer)session.getAttribute("code");
		if(code!=null) {
			boolean isMember = adminService.banCheck(code);
			if(!isMember) {
				session.invalidate();
				response.sendRedirect("/clientMember/login_form");
				return false;
			}else {
				return true;				
			}
		}else {
			response.sendRedirect("/clientMember/login_form");
			return false;
		}
		
	}

}
