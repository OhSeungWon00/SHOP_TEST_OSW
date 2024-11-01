<%@page import="shop.dto.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
<jsp:include page="/layout/meta.jsp" />
<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<%
	String root = request.getContextPath();
	%>

	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">상품목록</h1>
		<br>
		<h1>쇼핑몰 상품 목록입니다.</h1>
		<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
			<a href="<%=root%>/shop/add.jsp"
				class="btn btn-primary btn-lg px-4 gap-3">상품 등록</a> <a
				href="<%=root%>/product/edit.jsp"
				class="btn btn-success btn-lg px-4 gap-3">상품 편집</a> <a
				href="<%=root%>/cart.jsp" class="btn btn-warning btn-lg px-4 gap-3">장바구니</a>
		</div>
		<br> <br> <br>
		

		<div class="card p-3">
			<div class"img-content>
				<img src="img?id=P100001" class"w-100p-2">
			</div>
			<div class="content">
				<h3 class="text-center">자바 프로그래밍</h3>
				<p>안녕하세요 자바프로그래밍 강의입니다.</p>
				<p class="text-end price">50000원</p>
				<p class="d-flex justify-content-between"></p>
			</div>
	<a href="./cart_pro.jsp?id=P100001" class="btn btn-outline-primary">
		<i class="material-symbols-outlined">shopping_bag</i>
	</a>
	<a href="./product.jsp?id=P100001" class="btn btn-outline-primary">상세정보</a>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	






	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
