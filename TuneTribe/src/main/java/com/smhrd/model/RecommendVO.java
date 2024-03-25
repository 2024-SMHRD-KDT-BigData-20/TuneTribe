package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecommendVO {

	private String user_id;
	private int fes_idx;
	private int reco_score;
	public RecommendVO(int fes_idx, int reco_score) {
		super();
		this.fes_idx = fes_idx;
		this.reco_score = reco_score;
	}
	
}
