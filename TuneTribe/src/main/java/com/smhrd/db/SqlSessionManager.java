package com.smhrd.db;

// import 전체 할 때 ctrl + shift + o
import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// Mybatis 설정파일을 읽어 DB와 연결 후 세션을 반환

public class SqlSessionManager {

	private static SqlSessionFactory sqlSessionFactory;

	static {

		try {

			String resource = "com/smhrd/db/mybatis-config.xml";

			InputStream inputStream = Resources.getResourceAsStream(resource);

			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// DAO에서 호출
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}

}
