package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BoardDAO {

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private final String DRIVER = "com.mysql.jdbc.Driver";
	private final String URL = "jdbc:mysql://localhost:3306/java";
	private final String USER = "root";
	private final String PW = "admin1214";

	public BoardDAO() {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<BoardDTO> select() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = "select title, content, count, reg_date from board";
		try {
			con = DriverManager.getConnection(URL, USER, PW);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.isBeforeFirst()) {
				while (rs.next()) {
					BoardDTO dto = new BoardDTO();

					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setCount(rs.getInt("count"));
					dto.setReg_date(rs.getString("reg_date"));
					list.add(dto);
				}
			} else {
				System.out.println("rs null");
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, stmt, rs);
		}
		return null;
	}

	public void close(Connection con, Statement stmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {

			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {

			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {

			}
		}
	}

}
