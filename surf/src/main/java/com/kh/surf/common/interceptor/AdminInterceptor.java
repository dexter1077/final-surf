package com.kh.surf.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.surf.member.model.vo.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	/**
	 * 어드민 확인
	 * @author eunyong
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		
		if(!((Member)session.getAttribute("loginUser")).getUserCode().equals("A")) {
			session.setAttribute("alertMsg", "어드민만이 이용 가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
		
		return true;
		
	}
	
}
