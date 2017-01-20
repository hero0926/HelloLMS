package com.ja.id.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ja.id.controller.AdminController2;

public class LoginInterceptor implements HandlerInterceptor {
	
	private static final String LOGIN ="login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mav)
			throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = req.getSession();
		
		ModelMap modelmap = mav.getModelMap();
		
		Object memberVO = modelmap.get("memberVO");
		
		if(memberVO != null){
			
			logger.info("로그인 성공!!");
			session.setAttribute(LOGIN, memberVO);
			res.sendRedirect("/");
			
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		
		if(session.getAttribute(LOGIN)!=null){
			logger.info("로그인데이터 지우기!");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}

}
