package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dto.MemDTOIn;

public class MemDAO {

	// MyBatis
	// SqlSessionFactory 한번 생성 뒤 애플리케이션 실행하는 동안 존재해야함
	private SqlSessionFactory factory;

	public MemDAO() throws IOException {

		String xmlPath = "dao/myBatis-config.xml";
		Reader read = Resources.getResourceAsReader(xmlPath);
		factory = new SqlSessionFactoryBuilder().build(read);
	}

	public boolean idCheck(String id) throws SQLException {

		SqlSession session = factory.openSession();
		try {
			MemDTOIn result = session.selectOne("member.selectIdCheck", id);
			if (result == null) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}

	public boolean reg(MemDTOIn dto) throws SQLException {

		//openSession(true) : auto commit
		//MyBatis는 insert, update, delete 후 commit 안함
		//auto commit을 사용하거나 session.commit() 이용해서 commit
		SqlSession session = factory.openSession(true);
		try {
			int result = session.insert("member.insertMember", dto);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}

	public MemDTOIn login(MemDTOIn dto) throws SQLException {

		SqlSession session = factory.openSession();
		try {
			MemDTOIn result = session.selectOne("member.selectLogin", dto);
			return result;
		} finally {
			session.close();
		}
	}

	public boolean delete(String id) throws SQLException {

		SqlSession session = factory.openSession(true);
		try {
			int result = session.delete("member.deleteMember", id);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}

	public MemDTOIn loadEdit(String id) throws SQLException {

		SqlSession session = factory.openSession();
		try {
			MemDTOIn result = session.selectOne("member.selectLoadEdit", id);
			return result;
		} finally {
			session.close();
		}
	}

	public boolean edit(MemDTOIn dto) throws SQLException {

		SqlSession session = factory.openSession(true);
		try {
			int result = session.update("member.updateEdit", dto);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}
	
	public boolean insertMemberImg(MemDTOIn dto) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			int result = session.insert("insertMemberImg", dto);
			if(result == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}
	
	public String selectMemberImg(String id) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			return session.selectOne("selectMemberImg", id);
		} finally {
			session.close();
		}
	}
	
	public boolean updateMemberImg(MemDTOIn dto) throws SQLException {
		
		SqlSession session = factory.openSession(true);
		try {
			int result = session.update("updateMemberImg", dto);
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
