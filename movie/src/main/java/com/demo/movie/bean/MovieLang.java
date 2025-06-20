package com.demo.movie.bean;
/**
 * 电影语言
 * @author Administrator
 *
 */
public enum MovieLang {

	Chinese("普通话"),
	English("英语"),
	Yueyu("粤语"),
	Japanese("日语"),
	Korean("韩语"),
	German("德语"),
	French("法语"),
	ChineseEnglish("中英双字"),
	;
	
	private String name;
	
	private MovieLang(String name){
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
