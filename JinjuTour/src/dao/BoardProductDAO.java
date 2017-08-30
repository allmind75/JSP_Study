package dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.BoardProductDTO;
import dto.BoardTripDTO;
import dto.SearchCriteria;

public class BoardProductDAO {

	private SqlSessionFactory factory;

	public BoardProductDAO() throws IOException {

		factory = FactoryBuild.factoryBuild();
	}

	public boolean insert(BoardProductDTO dto) throws SQLException {

		SqlSession session = factory.openSession(true);
		try {
			int result = session.insert("boardProduct.insertProduct", dto);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}

	public BoardProductDTO selectRead(int pnum) throws SQLException {

		SqlSession session = factory.openSession();
		try {
			return session.selectOne("boardProduct.selectReadProduct", pnum);
		} finally {
			session.close();
		}
	}

	public boolean update(BoardProductDTO dto) throws SQLException {

		SqlSession session = factory.openSession(true);
		try {
			int result = session.update("boardProduct.updateProduct", dto);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}

	public List<BoardProductDTO> listSearch(SearchCriteria cri) throws SQLException {

		SqlSession session = factory.openSession();
		try {
			return session.selectList("boardProduct.listSearch", cri);
		} finally {
			session.close();
		}
	}

	public int listSearchCount(SearchCriteria cri) throws SQLException {

		SqlSession session = factory.openSession();
		try {
			return session.selectOne("boardProduct.listSearchCount", cri);
		} finally {
			session.close();
		}
	}

	public boolean delete(int pnum) {

		SqlSession session = factory.openSession(true);
		try {
			int result = session.delete("boardProduct.deleteProduct", pnum);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}
	
	public List<BoardProductDTO> selectRecommend() throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectList("boardProduct.selectRecommend");
		} finally {
			session.close();
		}
	}

}
