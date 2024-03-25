package com.smhrd.model;

import javax.servlet.http.Part;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class ReviewVO {
	private String b_idx;
	private String b_content;
	private String b_file;
	private String created_at;
	private String b_views;
	private String b_likes;	
	private String user_id;
	private int fes_idx;
	
	// 파일저장용
	public ReviewVO(String b_content, String b_file, String user_id, int fes_idx) {
		super();
		this.b_content = b_content;
		this.b_file = b_file;
		this.user_id = user_id;
		this.fes_idx = fes_idx;
	}
	
	
	
}
