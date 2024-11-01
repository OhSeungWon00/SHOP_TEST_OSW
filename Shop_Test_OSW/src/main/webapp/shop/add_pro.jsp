<%@page import="shop.dao.ProductRepository"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.Part"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");

    // 상품 정보 가져오기
    String productId = request.getParameter("productId");
    String name = request.getParameter("name");
    Integer unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
    String description = request.getParameter("description");
    String manufacturer = request.getParameter("manufacturer");
    String category = request.getParameter("category");
    long unitsInStock = Long.parseLong(request.getParameter("unitsInStock"));
    String condition = request.getParameter("condition");

    /* // 파일 업로드 처리
    Part filePart = request.getPart("file"); // 업로드된 파일
    String fileName = filePart.getSubmittedFileName(); // 파일 이름 가져오기
    String filePath = "/uploads/" + fileName; // 파일 저장 경로 (기본 설정)
    String fullPath = application.getRealPath(filePath); // 서버에서의 실제 경로

    // 파일을 서버에 저장
    File fileSaveDir = new File(application.getRealPath("/uploads"));
    if (!fileSaveDir.exists()) {
        fileSaveDir.mkdirs(); // 업로드 디렉토리가 없으면 생성
    }
    
    filePart.write(fullPath); // 파일을 지정된 경로에 저장 */

    // Product 객체 생성
    String filePath = "abc";
    Product product = new Product();
    product.setProductId(productId);
    product.setName(name);
    product.setUnitPrice(unitPrice);
    product.setDescription(description);
    product.setManufacturer(manufacturer);
    product.setCategory(category);
    product.setUnitsInStock(unitsInStock);
    product.setCondition(condition);
    product.setFile(filePath); // 파일 경로 설정

    // 데이터베이스에 상품 정보 저장
    ProductRepository productRepository = new ProductRepository();
    int result = productRepository.insert(product); // 수정된 부분
    boolean isSuccess = (result > 0); // 추가된 상품의 수에 따라 성공 여부 판단

    if (isSuccess) {
        out.println("<script>alert('상품이 성공적으로 등록되었습니다.'); location.href='./products.jsp';</script>");
    } else {
        out.println("<script>alert('상품 등록에 실패하였습니다.'); history.back();</script>");
    }

%>
