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


public class ReplyProductDAO {

	private SqlSessionFactory factory;

	public ReplyProductDAO() throws IOException {

		factory = FactoryBuild.factoryBuild();
	}
	
	public List<ReplyDTO> listReply(int num, Criteria cri) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("num", num);
			paramMap.put("cri", cri);
			return session.selectList("replyProduct.selectList", paramMap);
		} finally {
			session.close();
		}
	}
	
	public int count(int num) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("replyProduct.selectCount", num);
		} finally {
			session.close();
		}
	}
	
	public void addReply(ReplyDTO dto) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			session.insert("replyProduct.insert", dto);
		} finally {
			session.close();
		}
	}
	
	public void modifyReply(ReplyDTO dto) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			session.update("replyProduct.update", dto);
		} finally {
			session.close();
		}
	}
	
	public void removeReply(int rno) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			session.delete("replyProduct.delete", rno);
		} finally {
			session.close();
		}
	}
}
