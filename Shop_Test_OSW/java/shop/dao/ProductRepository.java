package shop.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import shop.dto.Product;

public class ProductRepository extends JDBConnection {

	/**
     * 상품 목록
     */
    public List<Product> list() {
        List<Product> list = new ArrayList<Product>();
        String sql = "SELECT * FROM product";

        try {
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getString("product_id"));
                product.setName(rs.getString("name"));
                product.setUnitPrice(rs.getInt("unit_price"));
                product.setDescription(rs.getString("description"));
                product.setManufacturer(rs.getString("manufacturer"));
                product.setCategory(rs.getString("category"));
                product.setUnitsInStock(rs.getLong("units_inStock"));
                product.setCondition(rs.getString("condition"));
                product.setFile(rs.getString("file"));
                product.setQuantity(rs.getInt("quantity"));

                list.add(product);
            }
        } catch (Exception e) {
            System.err.println("상품 목록 출력 시, 예외 발생!!");
            e.printStackTrace();
        }
        return list;
    }

	/**
	 * 상품 등록
	 */
	public int insert(Product product) {
		int result = 0;
		String sql = "INSERT INTO product (product_id, name, unit_price, description, manufacturer, category, units_inStock, `condition`, file, quantity) "
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

			result = psmt.executeUpdate(); // 쿼리 실행 및 결과 저장
		} catch (SQLException e) {
			System.err.println("상품 등록 시, SQL 예외 발생!!");
			e.printStackTrace();
		} catch (Exception e) {
			System.err.println("상품 등록 시, 예외 발생!!");
			e.printStackTrace();
		}
		return result;
	}

	public Product getProductById(String id) {
		return null;
	}

}
