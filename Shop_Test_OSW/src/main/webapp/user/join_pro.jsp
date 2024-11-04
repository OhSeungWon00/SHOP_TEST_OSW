<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="shop.dao.UserRepository" %>
<%@ page import="shop.dto.User" %>

<%
    // 회원가입 폼에서 전달된 파라미터를 받기
    String id = request.getParameter("id");
    String password = request.getParameter("pw");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");
    String mail1 = request.getParameter("email1");
    String mail2 = request.getParameter("email2");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

   
    String birth = year + "-" + month + "-" + day; 
    String mail = mail1 + "@" + mail2; 

   
    User user = new User();
    user.setId(id);
    user.setPassword(password);
    user.setName(name);
    user.setGender(gender);
    user.setBirth(birth);
    user.setMail(mail);
    user.setPhone(phone);
    user.setAddress(address);

   
    UserRepository userRepository = new UserRepository();
    int result = userRepository.insert(user);

   
    if (result > 0) {
    	session.setAttribute("status", "signup");
    	   response.sendRedirect("complete.jsp?msg=1");
    	%>
        <script>
           window.location.href = "login.jsp"; // 리다이렉트
       </script>
       <%
    } else {
        
        %>
         <script>
            window.location.href = "join.jsp"; // 리다이렉트
        </script>
        <%
    }
%>
