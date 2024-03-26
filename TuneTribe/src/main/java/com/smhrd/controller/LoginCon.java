package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.UsersDAO;
import com.smhrd.model.UsersVO;

@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("[LoginCon]");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		UsersVO vo = new UsersVO(user_id,user_pw);
		UsersVO login_vo = new UsersDAO().login(vo);
		
		response.setCharacterEncoding("UTF-8");

		if(login_vo!=null) {
			// 로그인 성공, 세션에 값 저장하기
			HttpSession session = request.getSession();
			session.setAttribute("login_vo", login_vo);
			
			// 포워드 방식
			RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
			session.setAttribute("login_vo", login_vo); rd.forward(request, response);
			
		} else {
			response.sendRedirect("index_loginFailed.html");
		}
		
	}

}
