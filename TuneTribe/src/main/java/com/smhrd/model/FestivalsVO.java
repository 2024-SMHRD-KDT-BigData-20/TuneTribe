package com.smhrd.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
public class FestivalsVO {

	@NonNull
	private int fes_idx;
	@NonNull
	private String fes_name;
	private String fes_location;
	private String fes_st_dt;
	private String fes_ed_dt;
	private String fes_poster;

}
