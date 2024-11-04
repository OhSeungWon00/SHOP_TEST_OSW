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
    
    if (loginUser == null) {
       
        response.sendRedirect("login.jsp?error=0");
    } else {
       
        session.setAttribute("status", "login");
        session.setAttribute("loginId", loginUser.getId());

       
        String rememberId = request.getParameter("remember-id");
        if ("on".equals(rememberId)) {
            Cookie idCookie = new Cookie("id", URLEncoder.encode(loginUser.getId(), "UTF-8"));
            idCookie.setMaxAge(60 * 60 * 24 * 30); // 30일 동안 유효
            response.addCookie(idCookie);
        } else {
            Cookie idCookie = new Cookie("id", "");
            idCookie.setMaxAge(0);
            response.addCookie(idCookie);
        }
        
        
        String rememberMe = request.getParameter("remember-me");
        if ("on".equals(rememberMe)) {
            String token = UUID.randomUUID().toString();
            Cookie rememberMeCookie = new Cookie("rememberMe", token);
            rememberMeCookie.setMaxAge(60 * 60 * 24 * 30);
            response.addCookie(rememberMeCookie);
            userDAO.savePersistentLogin(loginUser.getId(), token);
        }

        
        response.sendRedirect("complete.jsp?msg=0");
    }
%>