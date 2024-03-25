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

@WebServlet("/ReviewListCon")
public class ReviewListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[ReviewListCon]");
		
		
		
		String fesIdx = request.getParameter("fes_idx");
		int fes_idx = Integer.parseInt(fesIdx);
		System.out.println("페스티벌 인덱스: " + fes_idx);
		
		ReviewDAO dao = new ReviewDAO();
		List<ReviewVO> reviewlist = dao.reviewlist(fes_idx);
		
		Gson gson = new Gson();
		String res = gson.toJson(reviewlist);
		System.out.println(res);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		if(reviewlist !=null) {
			// 돌려주기3) PrintWriter 객체에 값 전달
			out.print(res);
		}else {
			System.out.println("게시글 불러오기 실패");
		}
	}

}
