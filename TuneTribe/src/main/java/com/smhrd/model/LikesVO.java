package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Data
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class LikesVO {
	private String user_id;
	private int b_idx;
	private int like_check;
	
	
	
	
	// 좋아요 체크 여부
	public LikesVO(String user_id, int b_idx) {
		super();
		this.user_id = user_id;
		this.b_idx = b_idx;
	}



	
	
	
	
	
}
