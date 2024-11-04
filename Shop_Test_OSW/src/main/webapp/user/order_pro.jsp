<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    HttpSession session2 = request.getSession();
    List<Product> orderList = (List<Product>) session.getAttribute("orderList");
    String orderError = (String) session.getAttribute("orderError");

    
    session.removeAttribute("orderList");
    session.removeAttribute("orderError");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 내역</title>
</head>
<body>
    <h1>주문 내역</h1>
    
    <%
    if (orderError != null) {
    %>
        <p style="color: red;"><%= orderError %></p>
    <%
    } else if (orderList != null && !orderList.isEmpty()) {
    %>
        <table border="1">
            <tr>
                <th>주문번호</th>
                <th>상품명</th>
                <th>가격</th>
                <th>수량</th>
                <th>소계</th>
            </tr>
            <%
            for (Product product : orderList) {
            %>
            <tr>
                <td><%= product.getOrderNo() %></td>
                <td><%= product.getName() %></td>
                <td><%= product.getUnitPrice() %></td>
                <td><%= product.getQuantity() %></td>
                <td><%= product.getUnitPrice() * product.getQuantity() %></td>
            </tr>
            <%
            }
            %>
        </table>
    <%
    } else {
    %>
        <p>주문 내역이 없습니다.</p>
    <%
    }
    %>
</body>
</html>
