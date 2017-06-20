package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Dao {

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private final String URL = "jdbc:mysql://localhost:3306/java";
	private final String USER = "root";
	private final String PW = "admin1214";

	private static Dao dao = new Dao();

	public static Dao getInstance() {
		return dao;
	}

	private Dao() {
		try {
			init();
		} catch (ClassNotFoundException e) {
			System.out.println("Class Load fail : " + e.getMessage());
		}
	}

	private static void init() throws ClassNotFoundException {
		Class.forName(DRIVER);
	}

	public ArrayList<Dto> selectAllMember() {
		ArrayList<Dto> list = new ArrayList<Dto>();
		try {
			con = DriverManager.getConnection(URL, USER, PW);
			pstmt = con.prepareStatement("select id, name, phone, email from member2");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Dto dto = new Dto();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("SQLExcpetion : " + e.getMessage());
		} finally {
			close(con, null, pstmt, rs);
		}

		return list;

	}

	public boolean login(Dto dto) {
		try {
			String sql = "select * from member2 where id='" + dto.getId() + "' and pass='" + dto.getPass() + "'";
			con = DriverManager.getConnection(URL, USER, PW);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.isBeforeFirst()) {
				return true;
			}
		} catch (SQLException e) {

		} finally {
			close(con, stmt, null, null);
		}
		return false;
	}

	public void insert(Dto dto) {

		try {
			String sql = "insert into member2 values(?, ?, ?, ?, ?, " + "now());";
			con = DriverManager.getConnection(URL, USER, PW);
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQLException : " + e.getMessage());
		} finally {
			close(con, null, pstmt, null);
		}
	}

	public Dto selectMemberInfo(String id) {

		Dto dto = new Dto();
		try {
			con = DriverManager.getConnection(URL, USER, PW);
			stmt = con.createStatement();

			String sql = "select id, name, phone, email from member2 where id='" + id + "';";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setPhone(rs.getString(3));
				dto.setEmail(rs.getString(4));
			}

		} catch (SQLException e) {
			System.out.println("SQLException : " + e.getMessage());
		} finally {
			close(con, stmt, null, rs);
		}

		return dto;
	}

	public boolean changeMemberInfo(Dto dto) {
		try {
			String sql = "update member2 set name=?, phone=?, email=? where id=?";

			con = DriverManager.getConnection(URL, USER, PW);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getId());

			
			System.out.println(dto.getName() + " " + dto.getPhone() + " ");
			System.out.println(sql);
			
			int r = pstmt.executeUpdate();
			if(r == 1) {
				return true;
			}
		} catch(SQLException e) {
			System.out.println("SQLException : " + e.getMessage());
		} finally {
			close(con, null, pstmt, null);
		}
		
		return false;
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
