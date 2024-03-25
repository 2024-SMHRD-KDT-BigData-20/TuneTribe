package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentVO {
	
	private int cmt_idx;
	private int b_idx;
	private String cmt_content;
	private String user_id;
	private String created_at;
	
	// 댓글 저장 때 사용
	public CommentVO(int b_idx, String cmt_content, String user_id) {
		super();
		this.b_idx = b_idx;
		this.cmt_content = cmt_content;
		this.user_id = user_id;
	}
	
}
