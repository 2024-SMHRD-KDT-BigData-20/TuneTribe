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
import com.smhrd.model.FavDAO;

@WebServlet("/OptionlistCon")
public class OptionlistCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[OptionlistCon]");
		
		FavDAO dao = new FavDAO();
		List<String> singerlist = dao.singerlist();
		
		Gson gson = new Gson();
		String res = gson.toJson(singerlist);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		if(singerlist !=null) {
			// 돌려주기3) PrintWriter 객체에 값 전달
			System.out.println("res보냄");
			out.print(res);
			
		}else {
			System.out.println("검색 실패");
		}
		
		
		
	}

}
