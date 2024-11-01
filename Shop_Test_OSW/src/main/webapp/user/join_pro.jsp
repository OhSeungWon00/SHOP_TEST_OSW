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

    // 생일과 이메일 주소 조합
    String birth = year + "-" + month + "-" + day; // 예: 1990-01-01
    String mail = mail1 + "@" + mail2; // 예: example@naver.com

    // User 객체 생성 및 값 설정
    User user = new User();
    user.setId(id);
    user.setPassword(password);
    user.setName(name);
    user.setGender(gender);
    user.setBirth(birth);
    user.setMail(mail);
    user.setPhone(phone);
    user.setAddress(address);

    // UserRepository를 이용해 회원 등록 처리
    UserRepository userRepository = new UserRepository();
    int result = userRepository.insert(user);

    // 회원가입 성공 여부에 따라 화면 전환
    if (result > 0) {
    	%>
        <script>
           window.location.href = "complete.jsp?msg=1"; // 리다이렉트
       </script>
       <%
    } else {
        // 회원가입 실패 시 에러 메시지와 함께 다시 회원가입 페이지로 이동
        %>
         <script>
            window.location.href = "join.jsp"; // 리다이렉트
        </script>
        <%
        return; // 중단
    }
%>
