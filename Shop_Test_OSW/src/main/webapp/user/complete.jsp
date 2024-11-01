<%@page import="shop.dto.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shop</title>
    <jsp:include page="/layout/meta.jsp" /> 
    <jsp:include page="/layout/link.jsp" />
</head>
<body>   
    <% String root = request.getContextPath(); %>
    
    <jsp:include page="/layout/header.jsp" />
    <div class="px-4 py-5 my-5 text-center">
        <h1 class="display-5 fw-bold text-body-emphasis">회원 정보</h1>
        
        <br><br><br><br>

        <%
            // 세션에서 아이디 가져오기
            User user = (User) session.getAttribute("loginUser"); 
            String name = (user != null) ? user.getName() : "로그인 후 이용해주세요."; 
        %>

        <h1><%= "회원 가입이 완료되었습니다." %></h1> 

        <br><br>
    
        <a href="index2.jsp">메인화면으로</a>
    </div>
    
    <jsp:include page="/layout/footer.jsp" />
    <jsp:include page="/layout/script.jsp" />
</body>
</html>
