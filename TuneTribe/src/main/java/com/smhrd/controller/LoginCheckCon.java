package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model.UsersDAO;
import com.smhrd.model.UsersVO;

@WebServlet("/LoginCheckCon")
public class LoginCheckCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[LoginCheckCon]");
		request.setCharacterEncoding("UTF-8");
		
		/*
		 * String user_id = request.getParameter("user_id"); String user_pw =
		 * request.getParameter("user_pw"); System.out.println("id"+user_id);
		 * System.out.println("pw"+user_pw);
		 */
		
		// Gson 라이브러리를 사용하여 요청 본문에서 JSON 데이터를 읽고 UsersVO 객체로 변환
		Gson gson = new Gson();
		UsersVO vo = gson.fromJson(request.getReader(), UsersVO.class);
		System.out.println(vo);
		
		// UsersVO vo = new UsersVO(user_id,user_pw);
		UsersVO login_vo = new UsersDAO().login(vo);
		

		
		PrintWriter out = response.getWriter();
		if(login_vo!=null) {
			// 로그인 성공
			System.out.println("[로그인 확인완료]");
			out.print(gson.toJson(login_vo));
		} else {
			System.out.println("[로그인 실패]");
			out.print(gson.toJson("{\"error\":\"Invalid credentials\"}"));
		}
		
	}

}
