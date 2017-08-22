package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dto.AdminDTOIn;
import dto.BoardTripDTOIn;

public class AdminDAO {

	private SqlSessionFactory factory;
	
	public AdminDAO() throws IOException {

		factory = FactoryBuild.factoryBuild();
	}
	
	public boolean login(AdminDTOIn dto) throws SQLException {
		
		SqlSession session = factory.openSession();
		try {
			AdminDTOIn result = session.selectOne("admin.selectLogin", dto);

			if(result != null) {
				return true;
			} else {
				return false;
			}
		} finally {
			session.close();
		}
	}
	
}
