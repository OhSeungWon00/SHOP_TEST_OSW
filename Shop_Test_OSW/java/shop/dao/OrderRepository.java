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

		String sql = "INSERT INTO order( orderNo, shipName, zipCode, country, address, date, orderPw, userId, totalPrice, phone)"
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
		String sql = "SELECT orderNo FROM order ORDER BY orderNo DESC LIMIT 1";

		try {
			psmt = con.prepareStatement(sql);
			if (rs.next()) {
				orderNo = rs.getInt("orderNo"); // 가장 최근의 orderNo 값 가져오기
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
	 * 주문 내역 조회 - 비회원
	 * 
	 * @param phone
	 * @param orderPw
	 * @return
	 */
	public List<Product> list(String phone, String orderPw) {
		
		
		
		

	}

}
