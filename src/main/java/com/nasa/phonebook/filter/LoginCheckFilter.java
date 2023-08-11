package com.nasa.phonebook.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.PatternMatchUtils;

@WebFilter(urlPatterns = "/phonebook/*")
public class LoginCheckFilter implements Filter {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private static final String[] whitelist 
	= {"/phonebook/signrequest","/phonebook/idcheck"
			,"/phonebook/login", "/phonebook/loginrequest", "/phonebook/signup"
			, "/phonebook/checkph"};

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String requestURI = httpRequest.getRequestURI();

		HttpServletResponse httpResponse = (HttpServletResponse) response;

		try {
			logger.info("인증 체크 필터 시작 {}", requestURI);
			if (isLoginCheckPath(requestURI)) {
				logger.info("인증 체크 로직 실행 {}", requestURI);
				HttpSession session = httpRequest.getSession(false);
				if (session == null || session.getAttribute(SessionConst.LOGIN_MEMBER) == null) {
					logger.info("미인증 사용자 요청 {}", requestURI);
					// 로그인으로 redirect
					httpResponse.sendRedirect("/phonebook/login?redirectURL=" + requestURI);
					return;
				}
			}

			chain.doFilter(request, response);
		} catch (Exception e) {
			throw e; // 예외 로깅 가능 하지만, 톰캣까지 예외를 보내주어야 함
		} finally {
			logger.info("인증 체크 필터 종료 {} ", requestURI);
		}

	}

	/**
	 * 화이트 리스트의 경우 인증 체크X
	 */
	private boolean isLoginCheckPath(String requestURI) {
		return !PatternMatchUtils.simpleMatch(whitelist, requestURI);
	}
}