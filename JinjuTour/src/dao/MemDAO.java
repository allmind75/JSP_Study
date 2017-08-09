package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dto.MemDTOIn;

public class MemDAO {

	private Connection con;
	private String sql;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//MyBatis
	private SqlSessionFactory factory;
	
	public MemDAO() throws IOException {
		
		String xmlPath = "dao/myBatis-config.xml";
		Reader read = Resources.getResourceAsReader(xmlPath);
		factory = new SqlSessionFactoryBuilder().build(read);
	}
	
	public boolean idCheck(String id) throws SQLException {
		
		con = DBCP.getConnection();
		stmt = con.createStatement();
		String sql = "SELECT id FROM member WHERE id='" + id + "'";
		
		rs = stmt.executeQuery(sql);
		
		if(rs.isBeforeFirst()) {
			return false;
		} else {
			return true;
		}
	}
	
	public int reg(MemDTOIn dto) throws SQLException {
		
//		con = DBCP.getConnection();
//		sql = "INSERT INTO MEMBER(id, pw, name, phone, email) VALUES(?, SHA1(?), ?, ?, ?)";
//		
//		pstmt = con.prepareStatement(sql);
//		pstmt.setString(1, dto.getId());
//		pstmt.setString(2, dto.getPw());
//		pstmt.setString(3, dto.getName());
//		pstmt.setString(4, dto.getPhone());
//		pstmt.setString(5, dto.getEmail());
//		
//		return pstmt.executeUpdate();
		
		int result;
		
		SqlSession session = factory.openSession(true);
		result = session.insert("member.insertMember", dto);
		session.close();
		
		return result;
		
	}
	
	
}
