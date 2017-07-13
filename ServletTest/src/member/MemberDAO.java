package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MemberDAO {

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private final String URL = "jdbc:mysql://localhost:3306/java";
	private final String USER = "root";
	private final String PW = "admin1214";

	static {
		try {
			init();
		} catch (ClassNotFoundException e) {
			System.out.println("Class Load fail : " + e.getMessage());
		}
	}

	private static void init() throws ClassNotFoundException {
		Class.forName(DRIVER);
	}

	public boolean reg(MemberDTO dto) throws SQLException {

		con = DriverManager.getConnection(URL, USER, PW);
		pstmt = con.prepareStatement("INSERT INTO member3(id, pw, name, address, reg_date) VALUES(?, MD5(?), ?, ?, now())");

		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPw());
		pstmt.setString(3, dto.getName());
		pstmt.setString(4,  dto.getAddress());
		
		int r = pstmt.executeUpdate();
		if (r == 1) {
			close(con, null, pstmt, null);
			return true;
		} else {
			close(con, null, pstmt, null);
			return false;
		}

		
	}
	
	public boolean login(MemberDTO dto) throws SQLException {
		
		con = DriverManager.getConnection(URL, USER, PW);
		stmt = con.createStatement();

		String id = "'" +dto.getId() + "'";
		String pw = "MD5('" + dto.getPw() + "')";
		String sql = "select id, pw from member3 where id=" + id + " and pw=" + pw;
		
		rs = stmt.executeQuery(sql);
		
		if(rs.isBeforeFirst()) {
			close(con, stmt, null, rs);
			return true;
		} else {
			close(con, stmt, null, rs);
			return false;
		}
	}
	

	public MemberDTO getInfo(String id) throws SQLException {
		//기존정보가져와서 표시
		MemberDTO dto = new MemberDTO();
		String sql = "select pw, name from member3 where id='" + id + "'";
		con = DriverManager.getConnection(URL, USER, PW);
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			dto.setPw(rs.getString("pw"));
			dto.setName(rs.getString("name"));
			return dto;
		}
		
		close(con, stmt, null, rs);
		return null;
	}
	
	public boolean updateMemberInfo(MemberDTO dto) throws SQLException {
		
		//기존정보 수정
		String sql = "update member3 set name=?, pw=md5(?) where id=?";
		
		con = DriverManager.getConnection(URL, USER, PW);
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getPw());
		pstmt.setString(3, dto.getId());
		
		int r = pstmt.executeUpdate();
		if( r == 1) {
			close(con, stmt, null, rs);
			return true;
		} else {
			close(con, stmt, null, rs);
			return false;
		}
		
	}
	
	public boolean delete(MemberDTO dto) throws SQLException {
		
		con = DriverManager.getConnection(URL, USER, PW);
		stmt = con.createStatement();
		
		String sql = "delete from member3 where id='" + dto.getId() + "'";
		
		int r = stmt.executeUpdate(sql);
		if(r == 1) {
			close(con, stmt, null, rs);
			return true;
		} else {
			close(con, stmt, null, rs);
			return false;
		}
	}
	
	public void updateLoginCnt(String id) throws SQLException {
	
		con = DriverManager.getConnection(URL, USER, PW);
		stmt = con.createStatement();
		
		String sqlR = "select count from member3 where id='" + id + "'";
		int cnt = 0;
		
		rs = stmt.executeQuery(sqlR);
		while(rs.next()) {
			cnt = rs.getInt(1);
		}
		
		String sql = "update member3 set count=" + (++cnt) + " where id='" + id + "'";
		int r = stmt.executeUpdate(sql);
		if(r == 1) {
			close(con, stmt, null, rs);
		} else {
			close(con, stmt, null, rs);
		}
	}
	
	public boolean selectPW(MemberDTO dto) throws SQLException {
		
		con = DriverManager.getConnection(URL, USER, PW);
		stmt = con.createStatement();
		String sql = "select id, pw from member3 where id='" + dto.getId() + "' and pw=md5('" + dto.getPw() + "')";
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			close(con, stmt, null, rs);
			return true;
		}
		
		close(con, stmt, null, rs);
		return false;
	}

	public boolean updateChgPW(MemberDTO dto) throws SQLException {
		
		con = DriverManager.getConnection(URL, USER, PW);
		stmt = con.createStatement();
		String sql = "update member3 set pw=md5('" + dto.getPw() + "') where id='" + dto.getId() + "'";
		int rs = stmt.executeUpdate(sql);
		
		if(rs == 1) {
			close(con, stmt, null, null);
			return true;
		}
		close(con, stmt, null, null);
		return false;
	}
	
	public void print() throws SQLException {
		
		con = DriverManager.getConnection(URL, USER, PW);
		stmt = con.createStatement();
		
		String sql = "select * from member3";
		
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			System.out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4) + " " + rs.getString(5));
		}
		
		close(con, stmt, null, rs);
		
	}
	
	public boolean idCheck(String id) throws SQLException {
		
		con = DriverManager.getConnection(URL, USER, PW);
		stmt = con.createStatement();
		String sql = "select id from member3 where id='" + id + "'";
		
		rs = stmt.executeQuery(sql);
		
		if(rs.isBeforeFirst()) {
			close(con, stmt, null, rs);
			return false;
		} else {
			close(con, stmt, null, rs);
			return true;
		}
	}
	
	public void close(Connection con, Statement stmt, PreparedStatement pstmt, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
				rs = null;
			} catch(Exception e) {
				
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
				pstmt = null;
			} catch(Exception e) {
				
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

