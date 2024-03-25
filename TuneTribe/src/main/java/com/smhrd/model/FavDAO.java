package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class FavDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<String> singerlist(){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<String> singerlist = session.selectList("com.smhrd.db.SingersMapper.singerlist");
		session.close();
		return singerlist;
	}
	
	public List<String> genrelist(){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<String> genrelist = session.selectList("com.smhrd.db.SingersMapper.genrelist");
		session.close();
		return genrelist;
	}
	
	public int singerdelete(String user_id) {
		int cnt = 0;
		SqlSession session = sqlSessionFactory.openSession(true);
		cnt = session.delete("com.smhrd.db.SingersMapper.singerdelete", user_id);
		session.close();
		return cnt;
	}
	
	public int singerinsert(FavVO singervo) {
		int cnt = 0;
		SqlSession session = sqlSessionFactory.openSession(true);
		cnt = session.insert("com.smhrd.db.SingersMapper.singerinsert", singervo);
		session.close();
		return cnt;
	}
	
	public int genredelete(String user_id) {
		int cnt_2 = 0;
		SqlSession session = sqlSessionFactory.openSession(true);
		cnt_2 = session.delete("com.smhrd.db.SingersMapper.genredelete", user_id);
		session.close();
		return cnt_2;
	}
	
	public int genreinsert(FavVO genrevo) {
		int cnt = 0;
		SqlSession session = sqlSessionFactory.openSession(true);
		cnt = session.insert("com.smhrd.db.SingersMapper.genreinsert", genrevo);
		session.close();
		return cnt;
	}
	
	
	
}
