<%@page import="shop.dao.UserRepository"%>
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
		String loginId = (String) session.getAttribute("loginId");
		
		if (loginId == null || loginId.equals("")) {
			response.sendRedirect(root);
		}

		UserRepository userDAO = new UserRepository();
		User loginUser = userDAO.getUserById(loginId);
	%>

	<jsp:include page="/layout/header.jsp" />

	<div class="container shop m-auto mb-5">
		<h1 class="display-5 fw-bold text-body-emphasis">회원 정보 수정</h1>
		
		<!-- 회원 정보 수정 폼 -->
		<form name="updateForm" action="<%= root %>/user/update_pro.jsp" method="post">
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2">아이디</label>
				<input type="text" class="form-control col-md-10" name="id" required value="<%= loginUser.getId() %>" readonly>
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2">이름</label>
				<input type="text" class="form-control col-md-10" name="name" required value="<%= loginUser.getName() %>">
			</div>
			
			<div class="input-group mb-3 row">
				<div class="col-md-2 p-0">
					<label class="input-group-text">성별</label>
				</div>
				<div class="col-md-10 d-flex align-items-center">
					<input type="hidden" name="temp-gender" value="<%= loginUser.getGender() %>" id="temp-gender" />
					<div class="radio-box d-flex">
						<div class="radio-item mx-5">
							<input type="radio" class="form-check-input" name="gender" value="여" id="gender-female"> 
							<label for="gender-female">여자</label>
						</div>
						<div class="radio-item mx-5">
							<input type="radio" class="form-check-input" name="gender" value="남" id="gender-male"> 
							<label for="gender-male">남자</label>
						</div>
					</div>
				</div>
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2">생일</label>
				<div class="col-md-10 d-flex align-items-center">
					<div class="row">
						<div class="col">
							<input type="text" class="form-control" name="year" placeholder="출생년도" size="6" value="<%= loginUser.getBirth().split("/")[0] %>">
						</div>
						<div class="col">
							<select name="month" class="h-100 form-select">
								<option value="01">1월</option>
								<option value="02">2월</option>
								<option value="03">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</div>
						<div class="col">
							<input type="text" class="form-control" name="day" placeholder="일자" size="4" value="<%= loginUser.getBirth().split("/")[2] %>">
						</div>
					</div>
				</div>
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2">이메일</label>
				<div class="row col-md-10 align-items-center">
					<div class="col-4 px-0">
						<input type="text" class="form-control" name="email1" placeholder="이메일" value="<%= loginUser.getMail().split("@")[0] %>">
					</div>
					<div class="col-auto">@</div>
					<div class="col-4 px-0">
						<select name="email2" class="form-select">
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="kakao.com">kakao.com</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2">전화번호</label>
				<input type="text" class="form-control col-md-10" name="phone" placeholder="전화번호" value="<%= loginUser.getPhone() %>">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2">주소</label>
				<input type="text" class="form-control col-md-10" name="address" placeholder="주소" value="<%= loginUser.getAddress() %>">
			</div>
			
			<div class="d-flex justify-content-between mt-5 mb-5">
				<a href="javascript:;" onclick="alertDel()" class="btn btn-lg btn-danger">탈퇴</a>
				<input type="submit" class="btn btn-lg btn-primary" value="수정" />
			</div>
		</form>
	</div>

	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />

	<script>
		function alertDel() {
			let form = document.updateForm;
			let check = confirm('정말 탈퇴하시겠습니까?');
			if (check) {
				form.action = 'delete_pro.jsp'; // 탈퇴 처리 JSP
				form.submit();
			}
		}
	</script>
</body>
</html>
