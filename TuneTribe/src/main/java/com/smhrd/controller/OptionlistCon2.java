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

@WebServlet("/OptionlistCon2")
public class OptionlistCon2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[OptionlistCon2]");
		
		FavDAO dao = new FavDAO();
		List<String> genrelist = dao.genrelist();
		
		Gson gson = new Gson();
		String res_2 = gson.toJson(genrelist);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		if(genrelist !=null) {
			// 돌려주기3) PrintWriter 객체에 값 전달
			out.print(res_2);
			System.out.println("res_2 보냄");
			
		}else {
			System.out.println("검색 실패");
		}
	}

}
