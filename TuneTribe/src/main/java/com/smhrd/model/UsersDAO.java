package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class UsersDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public UsersVO login(UsersVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		UsersVO login_vo = session.selectOne("com.smhrd.db.MemberMapper.login", vo);
		
		session.close();
		
		return login_vo;
	}
	
	public int join(UsersVO vo) {
		
		SqlSession session = sqlSessionFactory.openSession(true); // auto commit
		int cnt = session.insert("com.smhrd.db.MemberMapper.join", vo); // namespace.id값
		
		session.close();
		
		return cnt;
	}
	
	public int infoupdate(UsersVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.smhrd.db.MemberMapper.update", vo);
		session.close();
		return cnt;
	}
	
	// 아이디 중복확인
	public int checkExistUserId(String user_id){
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.selectOne("com.smhrd.db.MemberMapper.checkExistUserId", user_id);
		session.close();
		return cnt;
	}
	
}
