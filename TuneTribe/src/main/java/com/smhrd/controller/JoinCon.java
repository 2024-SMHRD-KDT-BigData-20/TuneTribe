package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.UsersDAO;
import com.smhrd.model.UsersVO;

@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[JoinCon]");
		
		request.setCharacterEncoding("UTF-8");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_nick = request.getParameter("user_nick");
		String user_birthdate = request.getParameter("user_birthdate");
		String user_gender = request.getParameter("user_gender");

		UsersVO vo = new UsersVO(user_id, user_pw, user_nick, user_birthdate, user_gender);
			
		int cnt = new UsersDAO().join(vo);
		
		System.out.println(cnt);
		
		if(cnt>0) {
			// 회원가입 성공
			// 쿼리스트링 방식 : url?name=value&name=value
			response.sendRedirect("index_joinSuccess.html");
		} else {
			// 회원가입 실패
			response.sendRedirect("index.jsp");
		}
	}

}
