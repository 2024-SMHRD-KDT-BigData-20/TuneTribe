package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewVO;

@WebServlet("/DeleteCon")
public class DeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("[DeleteCon]");
		String user_id = request.getParameter("user_id");
		String b_idx = request.getParameter("b_idx");
		
		System.out.println("user_id : " + user_id);
		System.out.println("b_idx : " + b_idx);

		
		ReviewVO vo = new ReviewVO(b_idx,user_id);
		ReviewDAO dao = new ReviewDAO();
		int cnt = dao.deletereview(vo);
		System.out.println("삭제여부 cnt = "+cnt);
		if(cnt==0) {
			System.out.println("삭제 실패");
		}
		
		
		
	}

}
