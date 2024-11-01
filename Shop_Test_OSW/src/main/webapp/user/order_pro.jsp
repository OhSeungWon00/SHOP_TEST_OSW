<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.OrderRepository"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 세션 및 요청 처리
    HttpSession session = request.getSession();
    
    // 비회원 주문 정보를 세션에서 가져오기
    String orderPhone = request.getParameter("phone"); // 입력한 전화번호
    String orderPw = request.getParameter("orderPw"); // 입력한 주문 비밀번호

    // 주문 내역을 저장할 리스트
    List<Product> orderList = null;

    if (orderPhone != null && !orderPhone.isEmpty() && orderPw != null && !orderPw.isEmpty()) {
        // OrderRepository 인스턴스 생성
        OrderRepository orderRepository = new OrderRepository();

        // 비회원 주문 내역 가져오기 (주문 비밀번호를 통한 검증 로직 추가 필요)
        orderList = orderRepository.getOrderListByPhoneAndPassword(orderPhone, orderPw);

        // 주문 내역이 존재하는 경우 세션에 저장
        if (orderList != null && !orderList.isEmpty()) {
            session.setAttribute("orderList", orderList);
            session.setAttribute("orderPhone", orderPhone);
        } else {
            // 주문 내역이 없으면 에러 메시지 설정
            session.setAttribute("orderError", "주문 내역이 없습니다.");
        }
    } else {
        // 전화번호와 비밀번호 입력이 없으면 에러 메시지 설정
        session.setAttribute("orderError", "전화번호와 주문 비밀번호를 입력해주세요.");
    }

    // 주문 내역 페이지로 리다이렉트
    response.sendRedirect(request.getContextPath() + "/user/order.jsp");
%>
