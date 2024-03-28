package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class LikesDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int likes (LikesVO vo) {
		int cnt=0;
		SqlSession session = sqlSessionFactory.openSession(true);
		cnt = session.insert("com.smhrd.db.ReviewMapper.reviewlike", vo);
		session.close();
		return cnt;
	}
	
	public int likescan (LikesVO vo) {
		int cnt =0;
		SqlSession session = sqlSessionFactory.openSession(true);
		cnt = session.delete("com.smhrd.db.ReviewMapper.reviewlikecan", vo);
		session.close();
		return cnt;
	}
	
	public LikesVO likecheck (LikesVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		LikesVO check = session.selectOne("com.smhrd.db.ReviewMapper.reviewlikecheck", vo);
		session.close();
		return check;
	}
}
