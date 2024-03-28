package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ResultToFestivalCon")
public class ResultToFestivalCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
		// AJAX로 전송한 정보를 세션에 저장하는 서블릿
		
		System.out.println("[ResultToFestivalCon]");

		String fesName = request.getParameter("fesName");
		System.out.println(fesName);
		String fesIdx = request.getParameter("fesIdx");
		System.out.println(fesIdx);
		String fesLocation = request.getParameter("fesLocation");
		System.out.println(fesLocation);
		String fesStDt = request.getParameter("fesStDt");
		System.out.println(fesStDt);
		String fesEdDt = request.getParameter("fesEdDt");
		System.out.println(fesEdDt);

		
		// 받은 데이터를 처리 (예: 세션에 저장)
		HttpSession session = request.getSession();
		session.setAttribute("fesName", fesName);
		session.setAttribute("fesIdx", fesIdx);
		session.setAttribute("fesLocation", fesLocation);
		session.setAttribute("fesStDt", fesStDt);
		session.setAttribute("fesEdDt", fesEdDt);
		session.setMaxInactiveInterval(120*60);
	}

	
	/* <나의 참고용 메모>
	 * 
	 * URL 파라미터에서 직접 받는 방법
	 * 
	 * // 검색된 페스티벌의 ID나 이름을 URL 파라미터에서 직접 받음 String fesName =
	 * request.getParameter("fesName");
	 * 
	 * if (fesName != null) { // 세션에 페스티벌 정보를 저장 HttpSession session =
	 * request.getSession(); session.setAttribute("fes_name", fesName);
	 * 
	 * // 정보가 성공적으로 세션에 저장된 후, 페이지 포워딩 RequestDispatcher rd =
	 * request.getRequestDispatcher("festival.jsp"); rd.forward(request, response);
	 * } else { // 적절한 오류 처리 또는 리다이렉트 } }
	 */

}
