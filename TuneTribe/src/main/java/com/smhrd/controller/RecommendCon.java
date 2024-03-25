package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.RecommendDAO;
import com.smhrd.model.RecommendVO;
import com.smhrd.model.UsersVO;

public class RecommendCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[RecommendCon]");

		HttpSession session = request.getSession();
		UsersVO login_vo = (UsersVO) session.getAttribute("login_vo");
		String user_id = login_vo.getUser_id();
		
		System.out.println("[RecoCon] user_id: " + user_id);
		
		RecommendDAO dao = new RecommendDAO();
		
		// 들어있는 정보 삭제
		dao.DeleteRecoResult(user_id);
		
		// 가지고있는거 : user_id, fav_singer, fav_genre 이거 바탕으로
		// recolist뽑고 recotable에 넣기
		
		// 리스트 가져오기
		List<RecommendVO> recoList = dao.LoadRecoResult(user_id); //이걸 못가져온다
		System.out.println(recoList);
		int cnt = 0;
		
		for(RecommendVO r : recoList) {
			System.out.println(r);
			cnt += dao.SaveRecoResult(r);
		}
		System.out.print("리스트 들어감 cnt 값: " + cnt);
		
		if(cnt>0) {
			System.out.println("reco_festivals 초기화 후 선호 업뎃 완료!");
		}else {
			System.out.println("reco_festivals 초기화 후 선호 업뎃 실패");
		}
	}

}
