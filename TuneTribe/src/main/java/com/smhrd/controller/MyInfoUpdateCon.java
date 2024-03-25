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

@WebServlet("/MyInfoUpdateCon")
public class MyInfoUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[MyInfoUpdateCon]");
		request.setCharacterEncoding("UTF-8");
		String user_id = request.getParameter("user_id");
		String user_pw1 = request.getParameter("user_pw1");
		String user_pw2 = request.getParameter("user_pw2");
		String user_nick = request.getParameter("user_nick");
		String user_birthdate = request.getParameter("user_birthdate");
		String user_gender = request.getParameter("user_gender");
		
		PrintWriter out = response.getWriter();

		if(!user_pw1.equals(user_pw2)) {
			out.print("<script>alert('비밀번호가 일치하지 않습니다!');</script>");
			response.sendRedirect("myinfotap.jsp");
		}
		
		UsersVO vo = new UsersVO(user_id, user_pw1, user_nick, user_birthdate, user_gender);
		UsersDAO dao = new UsersDAO();
		int cnt = dao.infoupdate(vo);
		if(cnt!=0) {
			System.out.println("업데이트 성공");
			HttpSession session = request.getSession();
			session.setAttribute("login_vo", vo);
			response.sendRedirect("my.jsp");
		}else {
			System.out.println("업데이트 실패");
		}
	}

}
