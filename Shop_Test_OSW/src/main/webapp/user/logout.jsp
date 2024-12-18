<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%



session.invalidate(); 

Cookie rememberMeCookie = new Cookie("remember-me", null);
rememberMeCookie.setMaxAge(0); 
rememberMeCookie.setPath("/");
response.addCookie(rememberMeCookie); 


Cookie idCookie = new Cookie("id", null);
idCookie.setMaxAge(0); 
idCookie.setPath("/"); 
response.addCookie(idCookie); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
<jsp:include page="/layout/meta.jsp" />
<jsp:include page="/layout/link.jsp" />
</head>
<body>

	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">로그아웃</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">로그아웃 되었습니다.</p>
			
			<a href="login.jsp">로그인 화면으로</a>
			
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">

			</div>
		</div>
	</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
