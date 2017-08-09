package dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCP {

	public static Connection getConnection() {
		
		
		Context context = null;			//1. context.xml의 내용을 사용하기 위한 객체
		DataSource dataSource = null;	//2. DataSource(pool)을 가져옴
		Connection con = null;			//3. DataSource에서 Connection 객체를 가져옴
		
		try {
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/MyConn");
			con = dataSource.getConnection();
		} catch (NamingException e) {
			System.out.println("Naming Error : " + e.getMessage() );
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
		}
		
		return con;
	}
}
