package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.FavDAO;
import com.smhrd.model.FavVO;
import com.smhrd.model.SingersDAO;
import com.smhrd.model.SingersVO;
import com.smhrd.model.UsersVO;

@WebServlet("/FavchooseCon")
public class FavchooseCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("FavchooseCon");
		HttpSession session = request.getSession();
		UsersVO login_vo = (UsersVO) session.getAttribute("login_vo");
		String user_id = login_vo.getUser_id();
		System.out.println("[FavChooseCon] user_id: " + user_id);
		
		String[] selectedSingers = request.getParameterValues("fav_singer");
		String[] selectedGenre = request.getParameterValues("fav_genre");
		
		
		SingersDAO sdao = new SingersDAO();
		List<Integer> singerIdxList = new ArrayList<>();
		if (selectedSingers != null) {
			for (String singer : selectedSingers) {
				System.out.println(singer);
				singerIdxList.add(sdao.favsingeridx(singer));
            }
        }else {
        	System.out.println("selectedSingers가 null!");
        	response.sendRedirect("my.jsp"); 
        }
		System.out.println(singerIdxList); // 리스트에 잘 들어감
		
		FavDAO fdao = new FavDAO();
		int cnt = fdao.singerdelete(user_id);
		if(cnt==0) {
			System.out.println("singer 초기화 실패 or 없음");
		}
		
		for(int fav_singer : singerIdxList) {
			FavVO singervo = new FavVO(user_id,fav_singer);
			int cnt2 = fdao.singerinsert(singervo);
			if(cnt2!=0) {
				System.out.println("fav_singer insert 성공");
			}else {
				System.out.println("fav_singer insert 안됨");
			}
		}
		
		
		
		if (selectedGenre != null) {
			int cnt_1 = fdao.genredelete(user_id);
			if(cnt_1==0) {
				System.out.println("genre 초기화 실패 or 없음");
			}
			for (String genre : selectedGenre) {
				System.out.println(genre);
				FavVO genrevo = new FavVO(user_id,genre);
				int cnt_2 = fdao.genreinsert(genrevo);
				if(cnt_2!=0) {
					System.out.println("fav_genre insert 성공");
				}
			}
		}else {
			System.out.println("selectedGenre가 null");
		}
		
		
		
			
		
	}

}
