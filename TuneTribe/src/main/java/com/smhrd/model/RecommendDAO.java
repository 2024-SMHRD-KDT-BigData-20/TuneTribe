package com.smhrd.model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class RecommendDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 사용자가 마이페이지에서 선호를 입력하는 순간 작동(RecommendCon)
	// 먼저 이전 reco_festivals 테이블 비우기
	public int DeleteRecoResult(String user_id) {
		SqlSession session = sqlSessionFactory.openSession(true);

		int cnt = session.delete("com.smhrd.db.FestivalMapper.emptyRecoTable", user_id);
		System.out.println("[RecoDAO-DeleteRecoResult] user_id: " + user_id);

		session.close();
		return cnt;
	}

	// recoList 쿼리문 결과 가져오기
	public List<RecommendVO> LoadRecoResult(String user_id) {
		SqlSession session = sqlSessionFactory.openSession(true);

		List<RecommendVO> recoScore = session.selectList("com.smhrd.db.FestivalMapper.LoadRecoResult", user_id);
		System.out.println("[RecoDAO-LoadRecoResult] user_id: " + user_id);
		System.out.println("[RecoDAO] recoList: " + recoScore);

		session.close();
		return recoScore;
	}

	public int SaveRecoResult(RecommendVO r) {
		SqlSession session = sqlSessionFactory.openSession(true);

		int cnt = 0;
		cnt = session.insert("com.smhrd.db.FestivalMapper.saveRecoResult", r);
	
		session.close();
		return cnt;
	}

	// 메인 페이지 접속하는 순간 작동
	// 사용자 선호 테이블 결과를 내림차순 정렬하여 fes_idx만 3개 빼온 후
	// 해당 fes_idx를 가진 festivals 테이블에서 정보 빼오는 쿼리문
	public List<FestivalsVO> loadRecoResult(String user_id) {
		SqlSession session = sqlSessionFactory.openSession(true);

		List<FestivalsVO> recoResult = session.selectList("com.smhrd.db.FestivalMapper.recofesMain", user_id);

		session.close();
		return recoResult;
	}

}
