package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
public class UsersVO {

	// 회원 아이디
	@NonNull
	private String user_id;

	// 회원 비밀번호
	@NonNull
	private String user_pw;

	// 회원 닉네임
	private String user_nick;

	// 회원 생년월일
	private String user_birthdate;

	// 회원 성별
	private String user_gender;
}
