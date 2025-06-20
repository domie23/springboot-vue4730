package com.demo.movie.bean;
/**
 * 电影场次类型枚举
 * @author Administrator
 *
 */
public enum CinemaSessionType {

	_2D("2D"),
	_3D("3D"),
	_4D("4D"),
	_5D("5D"),
	_All("全息影像"),
	;
	
	private String name;
	
	private CinemaSessionType(String name){
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
