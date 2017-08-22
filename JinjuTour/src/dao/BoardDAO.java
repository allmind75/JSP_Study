package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dto.BoardTripDTOIn;

public class BoardDAO {

	private SqlSessionFactory factory;

	public BoardDAO() throws IOException {

		factory = FactoryBuild.factoryBuild();
	}

	public boolean insertTrip(BoardTripDTOIn dto) throws SQLException {

		SqlSession session = factory.openSession(true);
		try {
			int result = session.insert("admin.insertTrip", dto);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}

	public List<BoardTripDTOIn> selectListTrip() throws SQLException {

		SqlSession session = factory.openSession();
		try {
			List<BoardTripDTOIn> list = session.selectList("admin.selectListTrip");
			return list;
		} finally {
			session.close();
		}
	}
	
	public BoardTripDTOIn selectReadTrip(String tnum) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("admin.selectReadTrip", tnum);
		} finally {
			session.close();
		}
	}
	
	public boolean updateTrip(BoardTripDTOIn dto) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			int result = session.update("admin.updateTrip", dto);
			if (result == 1) {
				return true;
			} else {
				return false;
			}			
		} finally {
			session.close();
		}
	}
}
