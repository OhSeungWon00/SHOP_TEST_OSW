package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductIORepository extends JDBConnection {

	/**
	 * 상품 입출고 등록
	 * 
	 * @param product
	 * @param type
	 * @return
	 */
	public int insert(Product product) {
		int result = 0;
		
		String sql = "INSERT INTO product( product_id, name, unit_price, description, manufacturer, category, units_inStock, condition, file, quantity)" + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1,  product.getProductId());
			psmt.setString(2,  product.getName());
			psmt.setInt(3,  product.getUnitPrice());
			psmt.setString(4,  product.getDescription());
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

}
