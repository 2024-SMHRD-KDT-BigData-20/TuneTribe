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
import com.smhrd.model.CommentDAO;
import com.smhrd.model.CommentVO;

@WebServlet("/CommentListCon")
public class CommentListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.print("[CommentListCon]");

		String bIdx = request.getParameter("b_idx");
		System.out.println("String 상태의 bIdx: " + bIdx);
		int b_idx = Integer.parseInt(bIdx);

		System.out.println("게시물 고유 인덱스:" + b_idx);
		CommentDAO dao = new CommentDAO();
		
		List<CommentVO> cmtlist = dao.commentList(b_idx);
		
		Gson gson = new Gson();
		String res_cmt = gson.toJson(cmtlist);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		if(cmtlist !=null) {
			// 돌려주기3) PrintWriter 객체에 값 전달
			out.print(res_cmt);
		}else {
			System.out.println("댓글 불러오기 실패");
		}
	}

}
