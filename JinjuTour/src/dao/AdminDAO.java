package dao;

import java.io.IOException;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.AdminDTOIn;

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
