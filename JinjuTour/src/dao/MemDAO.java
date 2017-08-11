package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

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
				
		SqlSession session = factory.openSession(true);
		List result = session.selectList("member.selectIdCheck", id);
		session.close();
		
		if(result.size() == 1) {
			return false;
		} else {
			return true;
		}	
		
	}
	
	public boolean reg(MemDTOIn dto) throws SQLException {
		
		int result;
		
		SqlSession session = factory.openSession(true);
		result = session.insert("member.insertMember", dto);
		session.close();
		
		if(result == 1) {
			return true;
		} else {
			return false;
		}
		
	}
	
	public List login(MemDTOIn dto) throws SQLException	{
		
		SqlSession session = factory.openSession(true);
		List result = session.selectList("member.selectLogin", dto);
		session.close();
		
		if(result.size() == 1) {
			return result;
		} else {
			return null;
		}
	}
	
	public boolean delete(String id) throws SQLException {
		
		int result;
		
		SqlSession session = factory.openSession(true);
		result = session.delete("member.deleteMember", id);
		session.close();
		
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	
}
