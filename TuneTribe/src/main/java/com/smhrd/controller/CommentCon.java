package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.CommentDAO;
import com.smhrd.model.CommentVO;

@WebServlet("/CommentCon")
public class CommentCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[CommentCon]");
		request.setCharacterEncoding("UTF-8");

		/*
		 * JSON.stringify ( ) - 객체를 JSON 문자열로 변환 (직렬화, JS 객체 -> 문자열)
		 * JSON.parse ( ) - JSON 문자열을 객체로 변환 (역직렬화, 문자열 -> JS 객체)
		 */

		// 요청 본문에서 JSON 문자열 읽기
		StringBuilder sb = new StringBuilder();
		String line = null;
		while ((line = request.getReader().readLine()) != null) {
			sb.append(line);
		}
		String requestData = sb.toString();
		System.out.println("[CommentCon] requestData: " + requestData);

		// Gson을 사용하여 JSON 문자열 파싱
		Gson gson = new Gson();
		CommentVO comment = gson.fromJson(requestData, CommentVO.class);
		System.out.println("[CommentCon] comment: " + comment);

		// 파싱된 데이터 사용
		int b_idx = comment.getB_idx();
		String user_id = comment.getUser_id();
		String cmt_content = comment.getCmt_content();

		CommentVO commentVO = new CommentVO(b_idx, cmt_content, user_id);
		System.out.println("[CommentCon] 파싱된 CommentVO: " + commentVO);

		int cnt = new CommentDAO().writeComment(commentVO);

		if (cnt > 0) {
			// 댓글 등록 성공
			System.out.println("댓글 작성 여부: " + cnt);
			response.getWriter().print("A comment has been uploaded successfully!");
		} else {
			// 댓글 등록 실패
			response.getWriter().print("Comment Failed");
		}
	}

}
