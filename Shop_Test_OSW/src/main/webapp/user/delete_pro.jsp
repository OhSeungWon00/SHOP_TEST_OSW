<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");

    UserRepository userDAO = new UserRepository();
    int result = userDAO.delete(id); 

    if (result > 0) {
        // 세션 무효화
         response.sendRedirect("complete.jsp?msg=3");
        session.invalidate(); 
%>
<script>
    alert("회원 탈퇴 성공!"); // 더조은!!!!!!!!
    window.location.href = "login.jsp?msg=2"; /
<%
    } else {
%>
</script>
    alert("회원 탈퇴 실패!"); 
    window.location.href = "update.jsp"; 
<%
    }
%>
