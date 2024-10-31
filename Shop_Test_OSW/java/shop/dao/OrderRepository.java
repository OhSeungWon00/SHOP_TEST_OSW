package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Order;
import shop.dto.Product;

public class OrderRepository extends JDBConnection {

	/**
	 * 주문 등록
	 * 
	 * @param user
	 * @return
	 */
	public int insert(Order order) {
		int result = 0;

		String sql = "INSERT INTO order( order_no, ship_name, zip_code, country, address, date, order_pw, user_id, total_price, phone)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, order.getOrderNo());
			psmt.setString(2, order.getShipName());
			psmt.setString(3, order.getZipCode());
			psmt.setString(4, order.getCountry());
			psmt.setString(5, order.getAddress());
			psmt.setString(6, order.getDate());
			psmt.setString(7, order.getOrderPw());
			psmt.setString(8, order.getUserId());
			psmt.setInt(9, order.getTotalPrice());
			psmt.setString(10, order.getPhone());
		} catch (Exception e) {
			System.err.println("주문 등록 시, 예외 발생!!");
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 최근 등록한 orderNo
	 * 
	 * @return 최근 등록된 orderNo 값
	 */
	public int lastOrderNo() {
		int orderNo = 0;
		String sql = "SELECT order_no FROM order ORDER BY order_no DESC LIMIT 1";

		try {
			psmt = con.prepareStatement(sql);
			if (rs.next()) {
				orderNo = rs.getInt("order_no"); // 가장 최근의 orderNo 값 가져오기
			}
		} catch (Exception e) {
			System.err.println("최근 orderNo 조회 시, 예외 발생!!");
			e.printStackTrace();
		}
		return orderNo;
	}

	/**
	 * 주문 내역 조회 - 회원
	 * 
	 * @param userId
	 * @return
	 */
	public List<Product> list(String userId) {
		List<Product> products = new ArrayList<>();
		String sql = "SELECT o.order_no, p.name, p.unit_price, io.amount " + "FROM `order` o "
				+ "JOIN product_io io ON o.order_no = io.order_no " + "JOIN product p ON io.product_id = p.product_id "
				+ "WHERE o.user_id = ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId); // userId 파라미터 설정

			while (rs.next()) {
				Product product = new Product();
				product.setOrderNo(rs.getInt("order_no")); // 주문 번호
				product.setName(rs.getString("name")); // 제품 이름
				product.setUnitPrice(rs.getInt("unit_price")); // 제품 단가
				product.setAmount(rs.getInt("amount")); // 수량

				products.add(product); // 리스트에 제품 추가
			}
		} catch (SQLException e) {
			System.err.println("주문 내역 조회 중 예외 발생!");
			e.printStackTrace();
		}

		return products;
	}

	/**
	 * 비회원 주문 내역 조회
	 * 
	 * @param orderNo
	 * @return
	 */
	public List<Product> listByOrderNo(int orderNo) {
		List<Product> products = new ArrayList<>();
		String sql = "SELECT p.name, p.unit_price, io.amount " + "FROM `order` o "
				+ "JOIN product_io io ON o.order_no = io.order_no " + "JOIN product p ON io.product_id = p.product_id "
				+ "WHERE o.order_no = ?"; // 주문 번호로 조회

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, orderNo); // 주문 번호 파라미터 설정

			rs = psmt.executeQuery(); // 쿼리 실행

			while (rs.next()) {
				Product product = new Product();
				product.setName(rs.getString("name")); // 제품 이름
				product.setUnitPrice(rs.getInt("unit_price")); // 제품 단가
				product.setAmount(rs.getInt("amount")); // 수량

				products.add(product); // 리스트에 제품 추가
			}
		} catch (SQLException e) {
			System.err.println("비회원 주문 내역 조회 중 예외 발생!");
			e.printStackTrace();
		}

		return products;
	}

}
