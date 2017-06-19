package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Dao {

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private final String URL = "jdbc:mysql://localhost:3306/java";
	private final String USER = "root";
	private final String PW = "admin1214";

	public Dao() {
		try {
			init();
		} catch (ClassNotFoundException e) {
			System.out.println("Class Load fail : " + e.getMessage());
		}	
	}
	
	private static void init() throws ClassNotFoundException {
		Class.forName(DRIVER);
	}

	public Dto memberInfoPrint(String id) {
		
		System.out.println("id: " + id);
		Dto result = new Dto();
		try {
			con = DriverManager.getConnection(URL, USER, PW);
			stmt = con.createStatement();
			
			String sql = "select id, name, phone, email from member2 where id='" + id + "';";
			System.out.println("sql : " + sql);
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				result.setId(rs.getString(1));
				result.setName(rs.getString(2));
				result.setPhone(rs.getString(3));
				result.setEmail(rs.getString(4));
				
				System.out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4));
			}
			
		} catch (SQLException e2) {
			System.out.println("SQLException : " + e2.getMessage());
		}
		
		return result;
	}

	public void close(Connection con, Statement stmt, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (Exception e) {
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
				pstmt = null;
			} catch (Exception e) {
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
				stmt = null;
			} catch (Exception e) {
			}
		}
		if (con != null) {
			try {
				con.close();
				con = null;
			} catch (Exception e) {
			}
		}
	}
}
