package dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Criteria;
import dto.ReplyDTO;


public class ReplyTripDAO {

	private SqlSessionFactory factory;

	public ReplyTripDAO() throws IOException {

		factory = FactoryBuild.factoryBuild();
	}
	
	public List<ReplyDTO> listReply(int num, Criteria cri) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("num", num);
			paramMap.put("cri", cri);
			return session.selectList("replyTrip.selectList", paramMap);
		} finally {
			session.close();
		}
	}
	
	public List<ReplyDTO>listImg(int num) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectList("replyTrip.selectImg", num);
		} finally {
			session.close();
		}
	}
	
	public int count(int num) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("replyTrip.selectCount", num);
		} finally {
			session.close();
		}
	}
	
	public void addReply(ReplyDTO dto) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			session.insert("replyTrip.insert", dto);
		} finally {
			session.close();
		}
	}
	
	public void modifyReply(ReplyDTO dto) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			session.update("replyTrip.update", dto);
		} finally {
			session.close();
		}
	}
	
	public void removeReply(int rno) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			session.delete("replyTrip.delete", rno);
		} finally {
			session.close();
		}
	}
}
