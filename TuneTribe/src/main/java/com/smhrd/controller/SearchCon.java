package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.FestivalsDAO;
import com.smhrd.model.FestivalsVO;

@WebServlet("/SearchCon")
public class SearchCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// main.jsp에서 검색어(searchText) 받아오기
		String searchText = request.getParameter("searchText");
		System.out.println(searchText);

		// 검색 메소드 호출
		FestivalsDAO dao = new FestivalsDAO();
		FestivalsVO vo = new FestivalsVO();

		try {
			// 검색 메소드에 검색어를 인자로 전달, 결과를 리스트로 받아옴
			List<FestivalsVO> fesList = dao.festivalSearch(searchText);

			for (FestivalsVO f : fesList) {
				System.out.println(f);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 검색 결과값 request에 저장
		// 결과 페이지에 해당 검색어를 보내야 하기 때문

		// 포워드 방식으로 결과 페이지 이동
		RequestDispatcher rd = request.getRequestDispatcher("searchResult.jsp");
		request.setAttribute("fesList", vo);
		rd.forward(request, response);
	}

}
