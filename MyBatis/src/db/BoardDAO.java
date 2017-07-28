package db;

import java.io.IOException;
import java.io.Reader;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

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

	public boolean write(BoardDTOIn dto) {

		int ret;

		// 1. sqlSession 생성(factory 이용)
		SqlSession session = factory.openSession(true);

		// 2. sql 질의문 실행/결과 반환
		ret = session.insert("board.insertBoard", dto); // (namespace.id, dto)

		// 3. sql session close
		session.close();

		// ret
		if (ret == 1) {
			return true;
		} else {
			return false;
		}
	}

	// 전체 목록 가져오기
	public List list() {

		SqlSession session = factory.openSession(true);

		// select 결과 list로 반환
		List resultList = session.selectList("board.printBoard");

		System.out.println("list size : " + resultList.size());

		session.close();
		return resultList;

	}

	// pageNum : 가져올 페이지번호 0 부터 시작
	// pageSize : 페이지에 표시할 글 목록 개수
	public List list(int pageNum, int pageSize) {

		int start = pageNum * pageSize;

		PageIn pageIn = new PageIn(start, pageSize);

		SqlSession session = factory.openSession(true);

		List resultList = session.selectList("board.selectPage", pageIn);

		session.close();

		return resultList;
	}

	// 게시판 전체 글 개수 가져오기
	public int count() {

		SqlSession session = factory.openSession(true);

		List resultList = session.selectList("board.selectCount");

		session.close();

		HashMap rs = (HashMap) resultList.get(0);
		long cnt = (long) rs.get("cnt");

		// Long to int
		return (int) cnt;
	}

	public ContentDTOOut read(int num) {

		SqlSession session = factory.openSession(true);

		// 결과가 하나인 경우 selectOne
		ContentDTOOut dto = session.selectOne("board.selectContent", num);

		session.close();
		/*
		 * String title = (String) map.get("title"); String content = (String)
		 * map.get("content"); int count = (Integer) map.get("count"); Timestamp
		 * reg_date = (Timestamp) map.get("reg_date");
		 * 
		 * ContentDTOOut dto = new ContentDTOOut(num, title, content, count,
		 * reg_date);
		 */
		return dto;
	}

	public int del(int num) {
		
		int delCnt = 0;
		SqlSession session = factory.openSession(true);
		try {
			delCnt = session.delete("board.deleteContent", num);
			session.commit();
		} catch (Exception e) {
			
		} finally {

			session.close();
		}
		
		return delCnt;
	}

}
