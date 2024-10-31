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
					+ "OR unitPrice LIKE CONCAT('%', ?, '%')"
					+ "OR description LIKE CONCAT('%', ?, '%')" ;

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
	 * 상품 조회
	 * 
	 * @param productId
	 * @return
	 */
	public Product getProductById(String productId) {

	}

	
	
	
	
	
	
	
	
	/**
	 * 상품 등록
	 * @param product
	 * @return
	 */
	public int insert(Product product) {
		int result = 0;
		
		String sql = "INSERT INTO product( productId, name, unitPrice, description, manufacturer, category, unitsInStock, condition, file, quantity)" + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1,  product.getProductId());
			psmt.setString(2,  product.getName());
			psmt.setInt(3,  product.getUnitPrice());
			psmt.setString(4,  product.getDescription()));
			psmt.setString(5,  product.getManufacturer());
			psmt.setString(6,  product.getCategory());
			psmt.setLong(7,  product.getUnitsInStock());
			psmt.setString(8,  product.getCondition());
			psmt.setString(9,  product.getFile());
			psmt.setInt(10,  product.getQuantity());
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
	 * @return
	 */
	public int update(Product product) {

	}

	/**
	 * 상품 삭제
	 * 
	 * @param product
	 * @return
	 */
	public int delete(String productId) {

	}

}
