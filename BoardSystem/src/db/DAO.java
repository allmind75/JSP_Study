package db;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DAO {

	private static DAO dao;
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private final String URL = "jdbc:mysql://localhost:3306/java?useUnicode=true&characterEncoding=UTF-8";

	private final String USER = "root";
	private final String PW = "admin1214";
	
	public DAO() {
		try {
			Class.forName(DRIVER);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static DAO getInstance()	{
		if(dao == null) {
			dao = new DAO();
		}
		return dao;
	}
	
	public ArrayList<DTO> printList() {
		ArrayList<DTO> list = new ArrayList<DTO>();
		
		try {
			con = DriverManager.getConnection(URL, USER, PW);
			String sql = "select num, title, write_date, count from trip_board order by write_date desc";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.isBeforeFirst()) {
				while(rs.next()) {
					DTO dto = new DTO();
					dto.setNum(rs.getInt("num"));
					dto.setTitle(rs.getString("title"));
					dto.setWrite_Date(rs.getString("write_date"));
					dto.setCount(rs.getInt("count"));
					list.add(dto);
				}
				return list;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, null, stmt, rs);
		}
		return null;
	}
	
	public void insert(DTO dto) {
		try {
			con = DriverManager.getConnection(URL, USER, PW);
			String sql = "insert into trip_board(title, content, address, write_date, count) values(?, ?, ?, now(), ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, new String(dto.getTitle().getBytes("ISO_8859_1"), "utf-8"));
			pstmt.setString(2, new String(dto.getContent().getBytes("ISO_8859_1"), "utf-8"));
			pstmt.setString(3, new String(dto.getAddress().getBytes("ISO_8859_1"), "utf-8"));
			pstmt.setInt(4, 0);
			
			pstmt.executeUpdate();
			

		} catch(SQLException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, null, null);
		}
	}
	
	public void close(Connection con, PreparedStatement pstmt, Statement stmt, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
		if(stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {}
		}
		if(con != null) {
			try {
				con.close();
			} catch (Exception e) {}
		}
	}
}
