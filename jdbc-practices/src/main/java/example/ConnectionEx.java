package example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionEx {
	public static void main(String[] args) {
		Connection connection = null;

		try {
			// 1. JDBC Driver 로딩
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. 연결
			String url = "jdbc:mariadb://192.168.0.208:3306/webdb?charset=utf8"; // 연결 url 필수 정의 (jdbc:db://IP:PORT/SCHEMA)
			connection = DriverManager.getConnection(url, "webdb", "webdb");
			System.out.println("Success");

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
