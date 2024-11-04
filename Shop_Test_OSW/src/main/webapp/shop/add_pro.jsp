<%@page import="shop.dto.Product"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
DiskFileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);

List<FileItem> items = upload.parseRequest(request);
String productId = null;
String name = null;
Integer unitPrice = null;
String description = null;
String manufacturer = null;
String category = null;
String fileName = null;


Integer unitsInStock = null;
String condition = null;


for (FileItem item : items) {
	if (item.isFormField()) {
		String fieldName = item.getFieldName();
		String fieldValue = item.getString("utf-8"); 

		switch (fieldName) {
		case "productId":
			productId = fieldValue;
			break;
		case "name":
			name = fieldValue;
			break;
		case "unitPrice":
			try {
				unitPrice = Integer.parseInt(fieldValue.trim());
			} catch (NumberFormatException e) {
				out.println("<p style='color:red;'>잘못된 가격 형식입니다. 숫자만 입력해 주세요.</p>");
				return;
			}
			break;
		case "description":
			description = fieldValue;
			break;
		case "manufacturer":
			manufacturer = fieldValue;
			break;
		case "category":
			category = fieldValue;
			break;
		case "unitsInStock":
			try {
				unitsInStock = Integer.parseInt(fieldValue.trim());
			} catch (NumberFormatException e) {
				out.println("<p style='color:red;'>잘못된 재고 수량 형식입니다. 숫자만 입력해 주세요.</p>");
				return;
			}
			break;
		case "condition":
			condition = fieldValue;
			break;
		}
	} else {
		fileName = item.getName(); 
		if (fileName != null && !fileName.isEmpty()) {
			
			String uploadDirectory = getServletContext().getRealPath("/") + "uploads"; // 업로드 디렉토리
			File uploadDir = new File(uploadDirectory);
			if (!uploadDir.exists()) uploadDir.mkdir(); // 디렉토리 생성

			
			File uploadedFile = new File(uploadDir, fileName);
			item.write(uploadedFile); 
		}
	}
}


Product product = new Product();
product.setProductId(productId);
product.setName(name);
product.setUnitPrice(unitPrice);
product.setDescription(description);
product.setManufacturer(manufacturer);
product.setCategory(category);
product.setUnitsInStock(unitsInStock);
product.setCondition(condition);
product.setFile(fileName); 


ProductRepository productRepo = new ProductRepository();
int insertResult = productRepo.insert(product); 


if (insertResult > 0) {
    out.println("<h2>제품 정보가 성공적으로 추가되었습니다!</h2>");
    out.println("<h3>추가된 제품 정보:</h3>");
    out.println("<ul>");
    out.println("<li><strong>제품 ID:</strong> " + product.getProductId() + "</li>");
    out.println("<li><strong>이름:</strong> " + product.getName() + "</li>");
    out.println("<li><strong>가격:</strong> " + product.getUnitPrice() + " 원</li>");
    out.println("<li><strong>설명:</strong> " + product.getDescription() + "</li>");
    out.println("<li><strong>제조사:</strong> " + product.getManufacturer() + "</li>");
    out.println("<li><strong>카테고리:</strong> " + product.getCategory() + "</li>");
    out.println("<li><strong>재고 수량:</strong> " + product.getUnitsInStock() + "</li>");
    out.println("<li><strong>상태:</strong> " + product.getCondition() + "</li>");
    out.println("<li><strong>파일:</strong> " + product.getFile() + "</li>");
    out.println("</ul>");
} else {
    out.println("<p style='color:red;'>제품 정보 추가에 실패했습니다.</p>");
}
%>
