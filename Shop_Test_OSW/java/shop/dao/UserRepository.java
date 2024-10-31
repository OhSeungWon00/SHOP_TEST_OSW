package shop.dao;

import java.sql.SQLException;
import java.util.UUID;

import shop.dto.PersistentLogin;
import shop.dto.Product;
import shop.dto.User;

public class UserRepository extends JDBConnection {

	/**
	 * 회원 등록
	 * 
	 * @param user
	 * @return
	 */
	public int insert(User user) {
		int result = 0;

		String sql = " INSERT INTO user(id, password, name, gender, birth, mail, phone, address, regist_day)"
				+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user.getId());
			psmt.setString(2, user.getPassword());
			psmt.setString(3, user.getName());
			psmt.setString(4, user.getGender());
			psmt.setString(5, user.getBirth());
			psmt.setString(6, user.getMail());
			psmt.setString(7, user.getPhone());
			psmt.setString(8, user.getAddress());
			psmt.setString(9, user.getRegistDay());

			result = psmt.executeUpdate(); // SQL 쿼리 실행 및 반영된 행 수 반환
			System.out.println();
		} catch (Exception e) {
			System.err.println("회원등록 시, 예외 발생!!");
			e.printStackTrace();
		}
		return result; // 반영된 행 수 반환
	}

	/**
	 * 로그인을 위한 사용자 조회
	 * 
	 * @param id
	 * @param pw
	 * @return 로그인한 사용자 정보
	 */
	public User login(String id, String pw) {
		User user = null; // 사용자 정보를 담을 변수
		String sql = "SELECT * FROM user WHERE id = ? AND password = ?"; // SQL 쿼리

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id); // 사용자 ID 설정
			psmt.setString(2, pw); // 비밀번호 설정

			rs = psmt.executeQuery(); // 쿼리 실행

			if (rs.next()) { // 결과가 있을 경우
				user = new User(); // User 객체 생성
				user.setId(rs.getString("id")); // ID 설정
				user.setPassword(rs.getString("password")); // 비밀번호 설정
				user.setName(rs.getString("name")); // 이름 설정
				user.setGender(rs.getString("gender")); // 성별 설정
				user.setBirth(rs.getString("birth")); // 생년월일 설정
				user.setMail(rs.getString("mail")); // 이메일 설정
				user.setPhone(rs.getString("phone")); // 전화번호 설정
				user.setAddress(rs.getString("address")); // 주소 설정
				user.setRegistDay(rs.getString("regist_day")); // 등록일 설정
			}
		} catch (SQLException e) {
			System.err.println("로그인 중 예외 발생!!");
			e.printStackTrace();
		}
		return user; // 로그인한 사용자 정보 반환 (없으면 null)
	}

	/**
	 * 사용자 ID를 기반으로 사용자 정보 조회
	 * 
	 * @param id 사용자 ID
	 * @return 사용자 정보
	 */
	public User getUserById(String id) {
		User user = null; // 사용자 정보를 담을 변수
		String sql = "SELECT * FROM user WHERE id = ?"; // SQL 쿼리

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id); // 사용자 ID 설정

			rs = psmt.executeQuery(); // 쿼리 실행

			if (rs.next()) { // 결과가 있을 경우
				user = new User(); // User 객체 생성
				user.setId(rs.getString("id")); // ID 설정
				user.setPassword(rs.getString("password")); // 비밀번호 설정 (필요 시)
				user.setName(rs.getString("name")); // 이름 설정
				user.setGender(rs.getString("gender")); // 성별 설정
				user.setBirth(rs.getString("birth")); // 생년월일 설정
				user.setMail(rs.getString("mail")); // 이메일 설정
				user.setPhone(rs.getString("phone")); // 전화번호 설정
				user.setAddress(rs.getString("address")); // 주소 설정
				user.setRegistDay(rs.getString("regist_day")); // 등록일 설정
			}
		} catch (SQLException e) {
			System.err.println("사용자 조회 중 예외 발생!!");
			e.printStackTrace();
		} finally {
			try {
				// 자원 해제
				if (rs != null)
					rs.close();
				if (psmt != null)
					psmt.close();
			} catch (SQLException e) {
				System.err.println("자원 해제 중 예외 발생!!");
				e.printStackTrace();
			}
		}
		return user; // 사용자 정보 반환 (없으면 null)
	}

	/**
	 * 회원 수정
	 * 
	 * @param user 사용자 정보
	 * @return 수정된 행의 수
	 */
	public int update(User user) {
		int result = 0; // 수정된 행 수
		String sql = "UPDATE user SET password = ?, name = ?, gender = ?, birth = ?, mail = ?, phone = ?, address = ? WHERE id = ?"; // SQL
																																		// 쿼리

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user.getPassword()); // 비밀번호 설정
			psmt.setString(2, user.getName()); // 이름 설정
			psmt.setString(3, user.getGender()); // 성별 설정
			psmt.setString(4, user.getBirth()); // 생년월일 설정
			psmt.setString(5, user.getMail()); // 이메일 설정
			psmt.setString(6, user.getPhone()); // 전화번호 설정
			psmt.setString(7, user.getAddress()); // 주소 설정
			psmt.setString(8, user.getId()); // 사용자 ID 설정

			result = psmt.executeUpdate(); // 쿼리 실행 (업데이트)

		} catch (SQLException e) {
			System.err.println("회원 수정 중 예외 발생!!");
			e.printStackTrace();
		} finally {
			try {
				// 자원 해제
				if (psmt != null)
					psmt.close();
			} catch (SQLException e) {
				System.err.println("자원 해제 중 예외 발생!!");
				e.printStackTrace();
			}
		}
		return result; // 수정된 행의 수 반환
	}

	/**
	 * 회원 삭제
	 * 
	 * @param id 사용자 ID
	 * @return 삭제된 행의 수
	 */
	public int delete(String id) {
		int result = 0; // 삭제된 행 수
		String sql = "DELETE FROM user WHERE id = ?"; // SQL 쿼리

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id); // 사용자 ID 설정

			result = psmt.executeUpdate(); // 쿼리 실행 (삭제)

		} catch (SQLException e) {
			System.err.println("회원 삭제 중 예외 발생!!");
			e.printStackTrace();
		} finally {
			try {
				// 자원 해제
				if (psmt != null)
					psmt.close();
			} catch (SQLException e) {
				System.err.println("자원 해제 중 예외 발생!!");
				e.printStackTrace();
			}
		}
		return result; // 삭제된 행의 수 반환
	}

	/**
	 * 토큰 리프레쉬
	 * 
	 * @param userId
	 */
	public String refreshToken(String userId) {
		PersistentLogin persistentLogin = selectToken(userId);
		String token = null;
		if (persistentLogin == null) {
			// 토큰이 없는 경우, 삽입
			token = insertToken(userId);
		} else {
			// 토큰이 있는 경우, 갱신
			token = updateToken(userId);
		}
		return token;
	}

	/**
	 * 토큰 정보 조회
	 * 
	 * @param userId
	 * @return
	 */
	public PersistentLogin selectToken(String userId) {
		String sql = "SELECT * FROM persistent_logins WHERE user_id = ?";

		PersistentLogin persistentLogin = null;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);

			rs = psmt.executeQuery();
			if (rs.next()) {
				persistentLogin = new PersistentLogin();
				persistentLogin.setpNo(rs.getInt("p_no"));
				persistentLogin.setUserId(rs.getString("user_id"));
				persistentLogin.setToken(rs.getString("token"));
				persistentLogin.setDate(rs.getTimestamp("token"));
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return persistentLogin;
	}

	/**
	 * 토큰 정보 조회 - 토큰으로
	 * 
	 * @param token
	 * @return
	 */
	public PersistentLogin selectTokenByToken(String token) {
		String sql = "SELECT * FROM persistent_logins WHERE token = ?";

		PersistentLogin persistentLogin = null;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, token);

			rs = psmt.executeQuery();
			if (rs.next()) {
				persistentLogin = new PersistentLogin();
				persistentLogin.setpNo(rs.getInt("p_no"));
				persistentLogin.setUserId(rs.getString("user_id"));
				persistentLogin.setToken(rs.getString("token"));
				persistentLogin.setDate(rs.getTimestamp("date")); // date 필드로 변경
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return persistentLogin;
	}

	/**
	 * 자동 로그인 토큰 생성
	 * 
	 * @param userId
	 * @return
	 */
	public String insertToken(String userId) {
		int result = 0;
		String sql = "INSERT INTO persistent_logins (user_id, token) VALUES (?, ?)";
		String token = UUID.randomUUID().toString();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			psmt.setString(2, token);

			result = psmt.executeUpdate(); // 퍼시스턴트 로그인 정보 등록 요청
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + "개가 등록되었습니다.");
		return token;
	}

	/**
	 * 자동 로그인 토큰 갱신
	 * 
	 * @param userId
	 * @return
	 */
	public String updateToken(String userId) {
		int result = 0;
		String sql = "UPDATE persistent_logins SET token = ?, date = now() WHERE user_id = ?";
		String token = UUID.randomUUID().toString();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, token);
			psmt.setString(2, userId);

			result = psmt.executeUpdate(); // 퍼시스턴트 로그인 정보 수정 요청
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + "개의 데이터가 수정되었습니다.");
		return token;
	}

	/**
	 * 토큰 삭제 - 로그아웃 시, 자동 로그인 풀림
	 * 
	 * @param userId
	 * @return
	 */
	public int deleteToken(String userId) {
		int result = 0;
		String sql = "DELETE FROM persistent_logins WHERE user_id = ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);

			result = psmt.executeUpdate(); // 특정 사용자의 자동 로그인 정보 삭제 요청
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 삭제 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + "개의 데이터가 삭제되었습니다.");
		return result;
	}

	public void savePersistentLogin(String userId, String token) {
		int result = 0;
		String sql = "INSERT INTO persistent_logins (user_id, token) VALUES (?, ?) ON DUPLICATE KEY UPDATE token = ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			psmt.setString(2, token);
			psmt.setString(3, token); // 중복될 경우 기존 토큰을 업데이트

			result = psmt.executeUpdate(); // SQL 쿼리 실행
			System.out.println("자동 로그인 정보 " + result + "개가 저장되었습니다.");
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 저장 중, 에러 발생!");
			e.printStackTrace();
		}
	}
}
