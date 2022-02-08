package com.care.root.admin.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.care.root.common.MemberSessionName;

public class AdminInterceptor extends HandlerInterceptorAdapter implements MemberSessionName{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();		
		if(session.getAttribute(LOGIN)==null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('접근 권한이 없습니다');"
					+"location.href='"+request.getContextPath()+"';</script>");
					return false;
		} else if (session.getAttribute(LOGIN).equals("group6")) {
			return true;
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('접근 권한이 없습니다');"
					+"location.href='"+request.getContextPath()+"';</script>");
					return false;
		}
	}	
	
}
