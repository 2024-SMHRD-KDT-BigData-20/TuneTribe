package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.LikesDAO;
import com.smhrd.model.LikesVO;
import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewVO;

@WebServlet("/LikesCon")
public class LikesCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("[LikesCon]");
		String user_id = request.getParameter("user_id");
		String bIdx = request.getParameter("b_idx");
		System.out.println(user_id+bIdx);
		int b_idx = Integer.parseInt(bIdx);
		
		System.out.println("user_id : " + user_id);
		System.out.println("b_idx : " + b_idx);

		LikesVO vo = new LikesVO(user_id,b_idx);
		LikesDAO dao = new LikesDAO();
		// 좋아요 했는지 확인
		LikesVO check = dao.likecheck(vo);
		System.out.println("check"+check);
		ReviewDAO rdao = new ReviewDAO();
		
		if(check==null) { // 좋아요 안했으면
			int cnt = dao.likes(vo); // 좋아요 누르기
			if(cnt>0) { // 좋아요 테이블에 추가 완료
				System.out.println("좋아요 성공");
			}
		}else { // 좋아요 이미 누름
			int cancel = dao.likescan(vo);
			if(cancel!=0) {
				System.out.println("좋아요 취소완료");
			}
		}
		int likeup = rdao.reviewlikeup(b_idx); // 보드테이블에 좋아요 수 업데이트!
		if(likeup!=0) {
			System.out.println("보드테이블 좋아요 수 업데이트 완료");
		}
		
		
		
	}

}
