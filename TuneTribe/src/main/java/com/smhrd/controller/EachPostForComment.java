package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewVO;

@WebServlet("/EachPostForComment")
public class EachPostForComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("[CommentListCon]");

		String bIdx = request.getParameter("b_idx");
		System.out.println("String 상태의 bIdx: " + bIdx);
		int b_idx = Integer.parseInt(bIdx);
		
		ReviewDAO dao = new ReviewDAO();
		ReviewVO eachReview = dao.eachReview(b_idx);
		
		Gson gson = new Gson();
		String res_each_post = gson.toJson(eachReview);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		System.out.println(res_each_post);
		
		if(res_each_post !=null) {
			out.print(res_each_post);
		}else {
			System.out.println("댓글 불러오기 실패");
		}
		
		
		
	}

}
