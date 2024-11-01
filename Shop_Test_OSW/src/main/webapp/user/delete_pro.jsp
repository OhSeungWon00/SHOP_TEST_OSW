<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id"); // ID를 요청 파라미터로 받음

    UserRepository userDAO = new UserRepository();
    int result = userDAO.delete(id); // ID를 전달하여 삭제 실행

    if (result > 0) {
        // 세션 무효화
        session.invalidate(); // 현재 세션 해제
%>
<script>
    alert("회원 탈퇴 성공!"); // 성공 메시지 표시
    window.location.href = "login.jsp?msg=2"; // 리다이렉트
</script>
<%
    } else {
%>
<script>
    alert("회원 탈퇴 실패!"); // 실패 메시지 표시
    window.location.href = "update.jsp"; // 리다이렉트
</script>
<%
    }
%>
