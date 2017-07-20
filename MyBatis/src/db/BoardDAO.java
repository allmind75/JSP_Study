package db;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardDAO {

	// MyBatis
	private SqlSessionFactory factory;

	public BoardDAO() throws IOException {

		String xmlPath = "db/myBatis-config.xml";
		
		// 1. myBatis 구성파일(configuration xml)을 읽어옴
		Reader read = Resources.getResourceAsReader(xmlPath);

		// 2. factory 객체 생성
		factory = new SqlSessionFactoryBuilder().build(read);

	}

	public void write(BoardDTOIn dto) {

		// 1. sqlSession 생성(factory 이용)
		SqlSession session = factory.openSession(true);

		// 2. sql 질의문 실행/결과 반환
		session.insert("board.insertBoard", dto); // (namespace.id, dto)

		// 3. sql session close
		session.close();

	}
}
