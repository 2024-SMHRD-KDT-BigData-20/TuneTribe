package com.smhrd.model;

import java.util.List;


public class FavVO {
	private String user_id;
	private String fav_genre;
	private int fav_singer;
	

	
	public FavVO(String user_id, String fav_genre) {
		super();
		this.user_id = user_id;
		this.fav_genre = fav_genre;
	}
	public FavVO(String user_id, int fav_singer) {
		super();
		this.user_id = user_id;
		this.fav_singer = fav_singer;
	}
	public FavVO(String user_id) {
		super();
		this.user_id = user_id;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getFav_genre() {
		return fav_genre;
	}
	public void setFav_genre(String fav_genre) {
		this.fav_genre = fav_genre;
	}
	public int getFav_singer() {
		return fav_singer;
	}
	public void setFav_singer(int fav_singer) {
		this.fav_singer = fav_singer;
	}

	
	
}
