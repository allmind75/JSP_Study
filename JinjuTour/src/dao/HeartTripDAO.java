package dao;

import java.io.IOException;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.HeartDTO;

public class HeartTripDAO {

	private SqlSessionFactory factory;
	
	public HeartTripDAO() throws IOException {
		
		factory = FactoryBuild.factoryBuild();
	}
	
	public int select(HeartDTO dto) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("heartTrip.select", dto);
		} finally {
			session.close();
		}
	}
	
	public int count(int num) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("heartTrip.count", num);
		} finally {
			session.close();
		}
	}
	
	public boolean insert(HeartDTO dto) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			int result = session.insert("heartTrip.insert", dto);
			if(result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}
	
	public boolean delete(String id) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			int result = session.delete("heartTrip.delete", id);
			if(result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}
}
