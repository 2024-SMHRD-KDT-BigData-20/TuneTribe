package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class ReviewDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int reviewWrite(ReviewVO reviewvo) {
		int cnt = 0;
		SqlSession session = sqlSessionFactory.openSession(true);
		cnt = session.insert("com.smhrd.db.ReviewMapper.write", reviewvo);
		session.close();
		return cnt;
	}
	
	public List<ReviewVO> reviewlist(int fes_idx) {
		List<ReviewVO> reviewlist = null;
		SqlSession session = sqlSessionFactory.openSession(true);
		reviewlist = session.selectList("com.smhrd.db.ReviewMapper.reviewlist", fes_idx);
		session.close();
		return reviewlist;
	}

	public List<ReviewVO> myreviewlist(String user_id) {
		List<ReviewVO> myreviewlist = null;
		SqlSession session = sqlSessionFactory.openSession(true);
		myreviewlist = session.selectList("com.smhrd.db.ReviewMapper.myreviewlist", user_id);
		session.close();
		return myreviewlist;
	}
	
	
	public int deletereview(ReviewVO vo) {
		int cnt=0;
		SqlSession session = sqlSessionFactory.openSession(true);
		cnt = session.delete("com.smhrd.db.ReviewMapper.deletereview", vo);
		session.close();
		return cnt;
	}
	
	public ReviewVO eachReview(int b_idx) {
		ReviewVO eachReview = null;
		SqlSession session = sqlSessionFactory.openSession(true);
		eachReview = session.selectOne("com.smhrd.db.ReviewMapper.eachReview", b_idx);
		session.close();
		return eachReview;
	}
	
	// 좋아요 up
	public int reviewlikeup(int b_idx) {
		int cnt =0;
		SqlSession session = sqlSessionFactory.openSession(true);
		cnt = session.update("com.smhrd.db.ReviewMapper.reviewlikeup", b_idx);
		session.close();
		return cnt;
	}
	
	
}
