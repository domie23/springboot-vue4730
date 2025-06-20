package com.demo.movie.bean;
/**
 * 电影院服务枚举类
 * @author Administrator
 *
 */
public enum CinemaServices {

	_3D("3D眼镜","ico_tb_App_3D.png"),
	Park("停车场","ico_tb_App_Car.png"),
	Card("刷卡","ico_tb_App_Card.png"),
	Dining("餐 饮","ico_tb_App_Dining.png"),
	ChildDiscount("儿童优惠","ico_tb_App_Discount.png"),
	ProductPackage("套 餐","ico_tb_App_Package.png"),
	Rest("休息区","ico_tb_App_Rest.png"),
	;
	
	private String name;
	
	private String ImgUrl;
	
	private CinemaServices(String name,String imgUrl){
		this.name = name;
		this.ImgUrl = imgUrl;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImgUrl() {
		return ImgUrl;
	}

	public void setImgUrl(String imgUrl) {
		ImgUrl = imgUrl;
	}
	
	
}
