package dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.BoardFoodDTO;
import dto.SearchCriteria;

public class BoardFoodDAO {

	private SqlSessionFactory factory;

	public BoardFoodDAO() throws IOException {

		factory = FactoryBuild.factoryBuild();
	}

	public boolean insert(BoardFoodDTO dto) throws SQLException {

		SqlSession session = factory.openSession(true);
		try {
			int result = session.insert("boardFood.insertFood", dto);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}

	public BoardFoodDTO selectRead(int tnum) throws SQLException {

		SqlSession session = factory.openSession();
		try {
			return session.selectOne("boardFood.selectReadFood", tnum);
		} finally {
			session.close();
		}
	}

	public boolean update(BoardFoodDTO dto) throws SQLException {

		SqlSession session = factory.openSession(true);
		try {
			int result = session.update("boardFood.updateFood", dto);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}

	public List<BoardFoodDTO> listSearch(SearchCriteria cri) throws SQLException {

		SqlSession session = factory.openSession();
		try {
			return session.selectList("boardFood.listSearch", cri);
		} finally {
			session.close();
		}
	}

	public int listSearchCount(SearchCriteria cri) throws SQLException {

		SqlSession session = factory.openSession();
		try {
			return session.selectOne("boardFood.listSearchCount", cri);
		} finally {
			session.close();
		}
	}

	public boolean delete(int tnum) {

		SqlSession session = factory.openSession(true);
		try {
			int result = session.delete("boardFood.deleteFood", tnum);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}
	
	public List<BoardFoodDTO> selectRecommend() throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectList("boardFood.selectRecommend");
		} finally {
			session.close();
		}
	}
	
	public List<BoardFoodDTO> selectListSearch(SearchCriteria cri) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectList("boardFood.selectListSearch", cri);
		} finally {
			session.close();
		}
	}
	
	public void updateHeart(int fnum, int amount) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("fnum", fnum);
		paramMap.put("amount", amount);
		
		try {
			session.update("boardFood.updateHeart", paramMap);
		} finally {
			session.close();
		}
	}
	
	public void updateHeartSync() throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			session.update("boardFood.updateHeartSync");
		} finally {
			session.close();
		}
	}
	
	public int heartCnt(int fnum) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("boardFood.selectHeartCnt", fnum);
		} finally {
			session.close();
		}
	}
	
	public void updateCnt(int fnum) throws SQLException	{
		
		SqlSession session = factory.openSession(true);
		try {
			session.update("boardFood.updateCnt", fnum);
		} finally {
			session.close();
		}
	}

}
