package com.hotbody.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	private final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 클라이언트 요청을 처리한 뒤, 뷰를 통해 클라이언트에 응답을 전송하고 실행
		// 컨트롤러 처리 도중 예외가 발생해도 실행
		boolean result = false;
		try {
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String cp = request.getContextPath();
			String uri = request.getRequestURI();
			String queryString = request.getQueryString();
			
			if(info == null) {
				if(isAjax(request)) {
					response.sendError(403);
					return result;
				}
			}
			
			// 로그인 되지 않은 상태에서 게시판 이동 후, 로그인 페이지로 이동되고 로그인 했을 경우 게시판으로 그대로 이동
			if(info == null) {
				if(uri.indexOf(cp) == 0)
					uri = uri.substring(cp.length());
				if(queryString != null)
					uri += "?" + queryString;
					
				session.setAttribute("preLoginURI", uri);
				
				response.sendRedirect(cp + "/member/login");
			} else {
				result = true;
			}
			
		} catch (Exception e) {
			logger.info("pre : " + e.toString());
		}
		return result;
	}
	
	// AJAX 요청인지를 확인하기 위한 메소드
	private boolean isAjax(HttpServletRequest req) {
		String header = req.getHeader("AJAX");
		return header != null && header.equals("true");
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 클라이언트 요청을 처리한 후 호출,
		// 컨트롤러 실행 중 예외가 발생하면 실행하지 않음
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 클라이언트 요청이 컨트롤러에 도착하기 전에 호출
		// false를 리턴하면 컨트롤러 또는 HandlerInterceptor를 처리하지 않고 요청 종료
	}
	
}
