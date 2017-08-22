package dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryBuild {

	public static SqlSessionFactory factoryBuild() throws IOException {
		String xmlPath = "dao/myBatis-config.xml";
		Reader read = Resources.getResourceAsReader(xmlPath);
		return new SqlSessionFactoryBuilder().build(read);
	}
}
