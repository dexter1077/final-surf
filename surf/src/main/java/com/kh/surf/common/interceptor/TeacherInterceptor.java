package com.kh.surf.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.surf.member.model.vo.Member;

public class TeacherInterceptor extends HandlerInterceptorAdapter{
	
	/**
	 * 강사 확인
	 * @author HeeRak
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		// 1. 로그인 안된경우
		if(session.getAttribute("loginUser") == null) {
			// 로그인 안된경우 메인페이지로 요청
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스 입니다.");
			response.sendRedirect(request.getContextPath());
			// controller 실행x
			return false;
		}
		
		if(!((Member)session.getAttribute("loginUser")).getUserCode().equals("T")) {
			
			session.setAttribute("alertMsg", "강사신청, 승인 이후 이용 가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath() + "/enrollTeacher.tea");
			return false;
		}
		
		return true;
		
	}
	
}
