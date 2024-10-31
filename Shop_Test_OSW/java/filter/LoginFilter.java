package filter;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Iterator;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.impl.IOFileUploadException;

import shop.dto.PersistentLogin;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter extends HttpFilter implements Filter {
	

	public LoginFilter() {
		super();
	}
	
	public void init(FilterConfig fConfig) throws ServletException{
		
	}
	
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, SecurityException{
		// 쿠키 확인
		//1. 자동 로그인 여부
		//2. 인증 토큰
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		Cookie[] cookies =  httpRequest.getCookies();
		
		String rememberMe = null;
		String token = null;
		
		if( cookies != null) {
			for (Cookie cookie : cookies) {
				String cookieName = cookie.getName();
				String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
				switch(cookieName) {
				case "rememberMe"	: rememberMe = cookieValue; break;
				case "token" 		: token = cookieValue; break;
				
				
			}
			
				
			}
		}
		System.out.println("LoginFilter...");
		System.out.println("rememberMe : " + rememberMe);
		System.out.println("token : " + token);
		
		// 자동 로그인 & 토큰 ok
		HttpSession session = httpRequest.getSession();
		if( rememberMe != null && token != null) {
			PersistentLogin persistentLogin = ????;
			if(persistentLogin != null) {
				// 로그인 처리
				session.setAttribute("loginId", persistentLogin);
			}
		}
		
		chain.doFilter(request, response);
	
}
	public void destroy() {
		
	}
}
