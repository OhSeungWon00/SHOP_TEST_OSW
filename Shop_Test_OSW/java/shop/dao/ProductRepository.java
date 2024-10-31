package shop.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductRepository extends JDBConnection {

	/**
	 * 상품 목록
	 * 
	 * @return
	 */
	public List<Product> list() {
		List<Product> list = new ArrayList<Product>();
		Product product = new Product();
		String sql = "SELECT * FROM product";

		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				psmt.setString(1, product.getProductId());
				psmt.setString(2, product.getName());
				psmt.setInt(3, product.getUnitPrice());
				psmt.setString(4, product.getDescription());
				psmt.setString(5, product.getManufacturer());
				psmt.setString(6, product.getCategory());
				psmt.setLong(7, product.getUnitsInStock());
				psmt.setString(8, product.getCondition());
				psmt.setString(9, product.getFile());
				psmt.setInt(10, product.getQuantity());

				list.add(product);

			}
		} catch (Exception e) {
			System.err.println("상품 목록 출력 시, 예외 발생!!");
			e.printStackTrace();
		}
		return list;
	}

	
	
	
	/**
	 * 상품 목록 검색
	 * 
	 * 
	 * 
	 * @param keyword
	 * @return
	 */
	public List<Product> list(String keyword) {

		List<Product> list = new ArrayList<Product>();
		Product product = new Product();
		String sql = "SELECT * FROM product WHERE name LIKE CONCAT('%', ?, '%') "
				+ "OR unitPrice LIKE CONCAT('%', ?, '%')" + "OR description LIKE CONCAT('%', ?, '%')";

		try {
			psmt = con.prepareStatement(sql);

			rs = psmt.executeQuery();
			while (rs.next()) {
				psmt.setString(1, product.getProductId());
				psmt.setString(2, product.getName());
				psmt.setInt(3, product.getUnitPrice());
				psmt.setString(4, product.getDescription());
				psmt.setString(5, product.getManufacturer());
				psmt.setString(6, product.getCategory());
				psmt.setLong(7, product.getUnitsInStock());
				psmt.setString(8, product.getCondition());
				psmt.setString(9, product.getFile());
				psmt.setInt(10, product.getQuantity());

				list.add(product);

			}
		} catch (Exception e) {
			System.err.println("상품 목록 검색 시, 예외 발생!!");
			e.printStackTrace();
		}
		return list;

	}

	
	
	
	/**
	 * 상품 조회
	 * 
	 * @param productId
	 * @return
	 */
	public Product getProductById(String productId) {
		Product product = null; // 기본값을 null로 설정
		String sql = "SELECT * FROM product WHERE productId = ?"; // 쿼리 수정

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, productId); // productId 설정
			rs = psmt.executeQuery();

			if (rs.next()) { // 결과가 있을 경우
				product = new Product(); // Product 객체 생성
				product.setProductId(rs.getString("productId"));
				product.setName(rs.getString("NAME"));
				product.setUnitPrice(rs.getInt("unitPrice"));
				product.setDescription(rs.getString("description"));
				product.setManufacturer(rs.getString("manufacturer"));
				product.setCategory(rs.getString("category"));
				product.setUnitsInStock(rs.getLong("unitsInStock"));
				product.setCondition(rs.getString("condition"));
				product.setFile(rs.getString("file"));
				product.setQuantity(rs.getInt("quantity"));
			}
		} catch (Exception e) {
			System.err.println("상품 검색 시, 예외 발생!!");
			e.printStackTrace();
		}
		return product; // 수정된 return
	}

	
	
	
	/**
	 * 상품 등록
	 * 
	 * @param product
	 * @return
	 */
	public int insert(Product product) {
		int result = 0;

		String sql = "INSERT INTO product( product_id, name, unit_price, description, manufacturer, category, units_inStock, condition, file, quantity)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, product.getProductId());
			psmt.setString(2, product.getName());
			psmt.setInt(3, product.getUnitPrice());
			psmt.setString(4, product.getDescription());
			psmt.setString(5, product.getManufacturer());
			psmt.setString(6, product.getCategory());
			psmt.setLong(7, product.getUnitsInStock());
			psmt.setString(8, product.getCondition());
			psmt.setString(9, product.getFile());
			psmt.setInt(10, product.getQuantity());
		} catch (Exception e) {
			System.err.println("상품 입출고 시, 예외 발생!!");
			e.printStackTrace();
		}
		return result;
	}

	
	
	
	/**
	 * 상품 수정
	 * 
	 * @param product
	 * @return 업데이트된 행의 수
	 */
	public int update(Product product) {
		int rowsUpdated = 0; // 업데이트된 행 수를 저장할 변수
		String sql = "UPDATE product SET NAME = ?, unit_price = ?, description = ?, "
				+ "manufacturer = ?, category = ?, units_inStock = ?, "
				+ "condition = ?, file = ?, quantity = ? WHERE product_id = ?"; // SQL 쿼리

		try {
			psmt = con.prepareStatement(sql);

			// 각 필드 값 설정
			psmt.setString(1, product.getName());
			psmt.setInt(2, product.getUnitPrice());
			psmt.setString(3, product.getDescription());
			psmt.setString(4, product.getManufacturer());
			psmt.setString(5, product.getCategory());
			psmt.setLong(6, product.getUnitsInStock());
			psmt.setString(7, product.getCondition());
			psmt.setString(8, product.getFile());
			psmt.setInt(9, product.getQuantity());
			psmt.setString(10, product.getProductId()); // WHERE 절에 사용될 productId

			// 쿼리 실행
			rowsUpdated = psmt.executeUpdate(); // 업데이트된 행의 수 반환
		} catch (Exception e) {
			System.err.println("상품 수정 시, 예외 발생!!");
			e.printStackTrace();
		}
		return rowsUpdated; // 업데이트된 행 수 반환
	}

	
	
	
	/**
	 * 상품 삭제
	 * 
	 * @param productId
	 * @return 삭제된 행의 수
	 */
	public int delete(String productId) {
		int rowsDeleted = 0; // 삭제된 행 수를 저장할 변수
		String sql = "DELETE FROM product WHERE product_id = ?"; // SQL 쿼리

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, productId); // WHERE 절에 사용될 productId 설정

			// 쿼리 실행
			rowsDeleted = psmt.executeUpdate(); // 삭제된 행의 수 반환
		} catch (Exception e) {
			System.err.println("상품 삭제 시, 예외 발생!!");
			e.printStackTrace();
		}
		return rowsDeleted; // 삭제된 행 수 반환
	}

}
