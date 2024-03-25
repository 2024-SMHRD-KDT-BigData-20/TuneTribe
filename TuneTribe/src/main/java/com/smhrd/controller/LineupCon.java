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
import com.smhrd.model.SingersDAO;
import com.smhrd.model.SingersVO;

@WebServlet("/LineupCon")
public class LineupCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[LineupCon]");
		String fesIdx = request.getParameter("fes_idx");
		int fes_idx=Integer.parseInt(fesIdx);
		
		SingersDAO dao = new SingersDAO();
		List<SingersVO> singerlist = dao.lineuplist(fes_idx);
		System.out.println("라인업 : "+singerlist);
		Gson gson = new Gson();
		String res = gson.toJson(singerlist);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		if(singerlist !=null) {
			out.print(res);
		}else {
			System.out.println("lineupCon 실패");
		}
		
		
	}

}
