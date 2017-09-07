package dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.BoardTripDTO;
import dto.SearchCriteria;

public class BoardTripDAO {

	private SqlSessionFactory factory;

	public BoardTripDAO() throws IOException {

		factory = FactoryBuild.factoryBuild();
	}

	public boolean insertTrip(BoardTripDTO dto) throws SQLException {

		SqlSession session = factory.openSession(true);
		try {
			int result = session.insert("boardTrip.insertTrip", dto);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}

	public BoardTripDTO selectReadTrip(int tnum) throws SQLException {

		SqlSession session = factory.openSession();
		try {
			return session.selectOne("boardTrip.selectReadTrip", tnum);
		} finally {
			session.close();
		}
	}

	public boolean updateTrip(BoardTripDTO dto) throws SQLException {

		SqlSession session = factory.openSession(true);
		try {
			int result = session.update("boardTrip.updateTrip", dto);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}

	public List<BoardTripDTO> listSearch(SearchCriteria cri) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectList("boardTrip.listSearch", cri);
		} finally {
			session.close();
		}
	}
	
	public int listSearchCount(SearchCriteria cri) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("boardTrip.listSearchCount", cri);
		} finally {
			session.close();
		}
	}
	
	public boolean deleteTrip(int tnum) {
		
		SqlSession session = factory.openSession(true);
		try {
			int result = session.delete("boardTrip.deleteTrip", tnum);
			if(result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}
	
	public List<BoardTripDTO> selectRecommend() throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectList("boardTrip.selectRecommend");
		} finally {
			session.close();
		}
	}
	
	public List<BoardTripDTO> selectListSearch(SearchCriteria cri) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectList("boardTrip.selectListSearch", cri);
		} finally {
			session.close();
		}
	}
	
	public void updateHeart(int tnum, int amount) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("tnum", tnum);
		paramMap.put("amount", amount);
		
		try {
			session.update("boardTrip.updateHeart", paramMap);
		} finally {
			session.close();
		}
	}
	
	public void updateHeartSync() throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			session.update("boardTrip.updateHeartSync");
		} finally {
			session.close();
		}
	}
	
	public int heartCnt(int tnum) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("boardTrip.selectHeartCnt", tnum);
		} finally {
			session.close();
		}
	}
	
	
}
