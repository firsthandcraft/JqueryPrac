package conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static DBConnect db = new DBConnect();
	private Connection conn = null;
	
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";

	private DBConnect() {
		// TODO Auto-generated constructor stub
	}

	public static DBConnect getInstance() {
		return db;
	}

	public Connection getConnection() {
		try {
			Class.forName(jdbc_driver);
			// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
			conn = DriverManager.getConnection(jdbc_url, "hr", "hr");
		} catch (Exception e) {//모든 예외의 최고 조상
			e.printStackTrace();//예외 발생 당시 호출스택에 있는 메서드의 정보와 예외 메세지를 화면에 출력
		}
		
		return conn;
	}

}
