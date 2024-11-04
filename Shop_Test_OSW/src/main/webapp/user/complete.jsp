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
	<jsp:include page="/layout/header.jsp" />


	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">회원 정보</h1>

		<%
		String status = request.getParameter("msg");
		// status 값에 따른 메시지 출력
		if (status.equals("0")) {
			
		// 로그인 성공 시 이동	
		%>
		<h2>로그인 성공!</h2>
		<br> <br>
		<br>
		<form action="index2.jsp" method="post">
			<button class="btn btn-primary w-100 py-2" type="submit">메인화면</button>
		</form>
		<%
		} else if (status.equals("1")) {
		
		// 회원가입 성공 시 이동	
		%>
		<h2>회원가입 성공!</h2>
		<br> <br>
		<br>
		<form action="index2.jsp" method="post">
			<button class="btn btn-primary w-100 py-2" type="submit">메인화면</button>
		</form>
		<%
		} else if (status.equals("2")) {
			
		// 수정 성공 시 이동	
		%>
		<h2>수정 완료!</h2>
		<br> <br>
		<br>
		<form action="index2.jsp" method="post">
			<button class="btn btn-primary w-100 py-2" type="submit">메인화면</button>
		</form>
		<%
		} else if (status.equals("3")) {
			
		// 탈퇴 성공 시 이동	
		%>
		<h2>회원 정보가 삭제되었습니다.</h2>
		<br> <br>
		<br>
		<form action="index2.jsp" method="post">
			<button class="btn btn-primary w-100 py-2" type="submit">메인화면</button>
		</form>
		<%
		}

		// 메시지를 출력한 후 상태 값을 세션에서 제거하여 새로고침 시 중복 출력 방지
		session.removeAttribute("status");
		%>
	</div>

	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
