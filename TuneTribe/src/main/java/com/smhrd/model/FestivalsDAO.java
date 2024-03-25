package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class FestivalsDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 페스티벌(게시판) 검색 기능
	// 페스티벌 정보도 같이 보여줌
	public List<FestivalsVO> festivalSearch(String searchText) {
		// SqlSession 자원을 자동으로 해제하기 위해 try-with-resources 사용
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			List<FestivalsVO> fesList = sqlSession.selectList("com.smhrd.db.FestivalMapper.festivalSearch", searchText);
			// null 체크를 제거하고, 빈 리스트를 반환하도록 수정
			sqlSession.close();
			return fesList != null ? fesList : new ArrayList<FestivalsVO>();
		} catch (Exception e) {
			e.printStackTrace();
			// 예외 발생 시 빈 리스트 반환
			return new ArrayList<FestivalsVO>();
		}
	} // festivalSearch 끝
	
	public FestivalsVO fesinfo(int fes_idx) {
		FestivalsVO fesinfo = null;
		SqlSession session = sqlSessionFactory.openSession(true);
		fesinfo = session.selectOne("com.smhrd.db.FestivalMapper.fesinfo", fes_idx);
		session.close();
		return fesinfo;
	} // fesinfo 끝
	
	// 페스티벌 일정 임박순으로 정렬
	// - main.jsp의 more 눌러 보여줄 때 이용
	public List<FestivalsVO> fesOrderAsc() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<FestivalsVO> fesOrderAscList = session.selectList("com.smhrd.db.FestivalMapper.fesOrderAsc");
		session.close();
		return fesOrderAscList;
	} // fesOrderAsc 끝
	
	// 페스티벌 랜덤 3개 뽑아오기
	public List<FestivalsVO> fesRandom() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<FestivalsVO> fesRandom = session.selectList("com.smhrd.db.FestivalMapper.fesRandom");
		session.close();
		return fesRandom;
	} // fesRandom 끝
}
