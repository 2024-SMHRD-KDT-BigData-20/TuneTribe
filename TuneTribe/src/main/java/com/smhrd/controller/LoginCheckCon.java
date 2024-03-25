package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.UsersDAO;
import com.smhrd.model.UsersVO;

@WebServlet("/LoginCheckCon")
public class LoginCheckCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[LoginCheckCon]");
		request.setCharacterEncoding("UTF-8");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		System.out.println("id"+user_id);
		System.out.println("pw"+user_pw);
		UsersVO vo = new UsersVO(user_id,user_pw);
		UsersVO login_vo = new UsersDAO().login(vo);
		
		PrintWriter out = response.getWriter();
		if(login_vo!=null) {
			// 로그인 성공
			System.out.println("[로그인 확인완료]");
		}
		
	}

}
