package com.demo.movie.bean;
/**
 * 电影地区枚举类
 * @author Administrator
 *
 */
public enum MovieArea {

	China("中国大陆"),
	HongKong("中国香港"),
	Taiwan("中国台湾"),
	Americ("美国"),
	England("英国"),
	Korea("韩国"),
	JAPAN("日本"),
	Thailand("泰国"),
	Other("其他")
	;
	
	private String name;
	
	private MovieArea(String name){
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
