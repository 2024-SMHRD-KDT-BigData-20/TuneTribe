package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.UsersDAO;

@WebServlet("/IdConfirmCheck")
public class IdConfirmCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("[IdConfirmCheckCon]");
		
		String user_id_val = request.getParameter("user_id");
		System.out.println(user_id_val);
		
		UsersDAO dao = new UsersDAO();
		int cnt = dao.checkExistUserId(user_id_val);
		System.out.println("아이디 중복이면 cnt 1: "+cnt);
		
		Gson gson = new Gson();
		String res = gson.toJson(cnt);
		// cnt를 회원가입 페이지로 보냄
		System.out.println("gson 버전의 cnt: "+cnt);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(res);
		
		
	}

}
