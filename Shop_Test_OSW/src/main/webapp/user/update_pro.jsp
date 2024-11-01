<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String phone = request.getParameter("phone");
String address = request.getParameter("address");

String birth = year + "/" + month + "/" + day;
String mail = email1 + "@" + email2;

User user = new User();
user.setId(id);
user.setName(name);
user.setGender(gender);
user.setBirth(birth);
user.setMail(mail);
user.setPhone(phone);
user.setAddress(address);

UserRepository userDAO = new UserRepository();
int result = userDAO.update(user);

if (result > 0) {
	// 세션에서 사용자 정보 업데이트
	session.setAttribute("loginUser", user);
%>
<script>
	alert("회원 정보가 성공적으로 업데이트 되었습니다.");
	window.location.href = "index2.jsp";
</script>
<%
} else {
%>
<script>
	alert("회원 정보 업데이트에 실패했습니다.");
	window.location.href = "update.jsp";
</script>
<%
}
%>
