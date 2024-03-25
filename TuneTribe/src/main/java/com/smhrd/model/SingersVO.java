package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Getter
@NoArgsConstructor
public class SingersVO {
	
	private int singer_idx;
	private String singer_name;
	private String singer_genre;
	public SingersVO(String singer_name) {
		super();
		this.singer_name = singer_name;
	}
	public SingersVO(int singer_idx) {
		super();
		this.singer_idx = singer_idx;
	}
	
}
