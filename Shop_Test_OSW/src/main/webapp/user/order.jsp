<%@page import="shop.dao.OrderRepository"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="/">Home</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="/shop/products.jsp">Product</a>
	        </li>
	      </ul>
	       <ul class="navbar-nav d-flex align-items-center px-3">
	        <li class="nav-item">
	        <div class="dropdown">
		      <a href="#" class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
		        <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
		        <strong>zzzx</strong>
		      </a>
		      <ul class="dropdown-menu text-small shadow">
		        <li><a class="dropdown-item" href="/user/index.jsp">마이 페이지</a></li>
		        <li><a class="dropdown-item" href="/user/update.jsp">회원정보 수정</a></li>
		        <li><a class="dropdown-item" href="/user/order.jsp">주문내역</a></li>
		        <li><hr class="dropdown-divider"></li>
		        <li><a class="dropdown-item" href="/user/logout.jsp">로그아웃</a></li>
		      </ul>
		    </div>
	        </li>
	        <li class="nav-item">
		        <a class="nav-link position-relative" aria-current="page" href="/shop/cart.jsp">
		        	<i class="material-symbols-outlined">shopping_bag</i>
		        	<span class="cart-count">2</span>
		        </a>
	        </li>
	      </ul>
	      <form class="d-flex" role="search" action="/shop/products.jsp" method="get">
	        <input class="form-control me-2" type="search" name="keyword" placeholder="Search" aria-label="Search"
	        		value="">
	        <button class="btn btn-outline-success" type="submit">Search</button>
	      </form>
	    </div>
	  </div>
	</nav>

	<div class="row m-0 mypage">
		<div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary">
			    <ul class="nav nav-pills flex-column mb-auto">
			      <li class="nav-item">
			        <a href="/user/index.jsp" class="nav-link link-body-emphasis">마이 페이지</a>
			      </li>
			      <li class="nav-item">
			        <a href="/user/update.jsp" class="nav-link link-body-emphasis">회원정보 수정</a>
			      </li>
			      <li>
			        <a href="#" class="nav-link active" aria-current="page">주문내역</a>
			      </li>
			    </ul>
			    <hr>
			  </div>
		</div>
		
		<div class="col-md-9 ms-sm-auto col-lg-10 p-0 m-0">
			<div class="px-4 py-3 my-3 text-center">
				<h1 class="display-5 fw-bold text-body-emphasis">주문 내역</h1>
				<div class="col-lg-6 mx-auto">
					<!-- 주문 내역 조회 양식 -->
					<form action="/user/order_pro.jsp" method="post">
						<div class="mb-3">
							<label for="phone" class="form-label">전화번호</label>
							<input type="text" id="phone" name="phone" class="form-control" required placeholder="전화번호 입력" />
						</div>
						<div class="mb-3">
							<label for="orderPassword" class="form-label">주문 비밀번호</label>
							<input type="password" id="orderPassword" name="orderPassword" class="form-control" required placeholder="주문 비밀번호 입력" />
						</div>
						<button type="submit" class="btn btn-primary">조회</button>
					</form>
				</div>
			</div>
			
			<!-- 주문 내역 목록 -->
			<div class="container shop m-auto mb-5">
				<table class="table table-striped table-hover table-bordered text-center align-middle">
					<thead>
						<tr class="table-primary">
							<th>주문번호</th>
							<th>상품</th>
							<th>가격</th>
							<th>수량</th>
							<th>소계</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<!-- 주문 내역 데이터가 여기에 표시됩니다 -->
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6">추가된 상품이 없습니다.</td>	
						</tr>
					</tfoot>
				</table>
			</div>
			
<footer class="container p-5">
	<p>copyright Shop</p>
</footer>
		</div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="/static/js/validation.js"></script>

<script>
	// 기존 스크립트가 여기에 들어갑니다.
</script>
</body>
</html>
