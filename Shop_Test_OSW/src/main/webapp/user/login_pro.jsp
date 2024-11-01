<%@page import="java.util.UUID"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="shop.dto.User"%>
<%@page import="shop.dao.UserRepository"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    UserRepository userDAO = new UserRepository();
    User loginUser = userDAO.login(id, pw);
    
    // 로그인 실패
    if (loginUser == null) {
        // 로그인 실패 시, 에러 메시지를 포함하여 로그인 페이지로 리다이렉트
        response.sendRedirect("login.jsp?error=0");
    } else {
        // 로그인 성공
        // - 세션에 사용자 정보 등록
        session.setAttribute("loginUser", loginUser); // User 객체 전체 저장
        session.setAttribute("loginId", loginUser.getId()); // 아이디 저장

        // 아이디 저장 쿠키 가져오기
        String rememberId = request.getParameter("remember-id");
        if ("on".equals(rememberId)) {
            // 쿠키 생성 및 설정
            Cookie idCookie = new Cookie("id", URLEncoder.encode(loginUser.getId(), "UTF-8"));
            idCookie.setMaxAge(60 * 60 * 24 * 30); // 30일 동안 유효
            response.addCookie(idCookie);
        } else {
            // 기존 쿠키 삭제
            Cookie idCookie = new Cookie("id", "");
            idCookie.setMaxAge(0); // 즉시 만료
            response.addCookie(idCookie);
        }
        
        // 자동 로그인
        String rememberMe = request.getParameter("remember-me");
        if ("on".equals(rememberMe)) {
            // UUID 생성 및 토큰을 쿠키에 저장
            String token = UUID.randomUUID().toString();
            Cookie rememberMeCookie = new Cookie("rememberMe", token);
            rememberMeCookie.setMaxAge(60 * 60 * 24 * 30); // 30일 동안 유효
            response.addCookie(rememberMeCookie);
            
            // DB에 사용자 토큰 정보 저장 (UserRepository에 해당 메서드 추가 필요)
            userDAO.savePersistentLogin(loginUser.getId(), token);
        }

        // 로그인 성공 페이지로 이동
        response.sendRedirect("index2.jsp");
    }		
%>
