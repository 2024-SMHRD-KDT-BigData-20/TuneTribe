package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class CommentDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 댓글 작성
	public int writeComment(CommentVO commentvo) {
		int cnt = 0;
		SqlSession session = sqlSessionFactory.openSession(true);
		cnt = session.insert("com.smhrd.db.ReviewMapper.writeComment", commentvo);
		session.close();
		return cnt;
	}

	// 댓글 조회
	public List<CommentVO> commentList(int b_idx) {
		List<CommentVO> commentList = null;
		SqlSession session = sqlSessionFactory.openSession(true);
		commentList = session.selectList("com.smhrd.db.ReviewMapper.commentList", b_idx);
		session.close();
		return commentList;
	}
}
