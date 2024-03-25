package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.FestivalsDAO;
import com.smhrd.model.FestivalsVO;

@WebServlet("/FesinfoCon")
public class FesinfoCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[FesinfoCon]");
		String fesIdx = request.getParameter("fes_idx");
		int fes_idx=Integer.parseInt(fesIdx);
		System.out.println("fes_idx 인트값 = "+fes_idx);
		FestivalsDAO dao = new FestivalsDAO();
		FestivalsVO fesinfo = dao.fesinfo(fes_idx);
		
		Gson gson = new Gson();
		String res = gson.toJson(fesinfo);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		if(fesinfo !=null) {
			out.print(res);
			System.out.println("res보냄");
		}else {
			System.out.println("fesinfo 실패");
		}
		
	}

}
