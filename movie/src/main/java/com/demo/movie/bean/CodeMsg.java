package com.demo.movie.bean;
/**
 * 错误码统一处理类，所有的错误码统一定义在这里
 * @author Administrator
 *
 */
public class CodeMsg {

	private int code;//错误码
	
	private String msg;//错误信息
	
	/**
	 * 构造函数私有化即单例模式
	 * @param code
	 * @param msg
	 */
	private CodeMsg(int code,String msg){
		this.code = code;
		this.msg = msg;
	}
	
	public int getCode() {
		return code;
	}



	public void setCode(int code) {
		this.code = code;
	}



	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	//通用错误码定义
	//处理成功消息码
	public static CodeMsg SUCCESS = new CodeMsg(0, "success");
	//非法数据错误码
	public static CodeMsg DATA_ERROR = new CodeMsg(-1, "非法数据！");
	public static CodeMsg CPACHA_EMPTY = new CodeMsg(-2, "验证码不能为空！");
	public static CodeMsg VALIDATE_ENTITY_ERROR = new CodeMsg(-3, "");
	public static CodeMsg SESSION_EXPIRED = new CodeMsg(-4, "会话已失效，请刷新页面重试！");
	public static CodeMsg CPACHA_ERROR = new CodeMsg(-5, "验证码错误！");
	public static CodeMsg USER_SESSION_EXPIRED = new CodeMsg(-6, "还未登录或会话失效，请重新登录！");
	public static CodeMsg UPLOAD_PHOTO_SUFFIX_ERROR = new CodeMsg(-7, "图片格式不正确！");
	public static CodeMsg UPLOAD_PHOTO_ERROR = new CodeMsg(-8, "图片上传错误！");
	public static CodeMsg UPLOAD_VIDEO_ERROR = new CodeMsg(-9, "视频格式不正确！");
	public static CodeMsg SMS_CODE_ERROR = new CodeMsg(-10, "短信验证码错误！");
	public static CodeMsg SAVE_ERROR = new CodeMsg(-11, "保存失败，请联系管理员！");
	public static CodeMsg ORDER_SN_ERROR = new CodeMsg(-12, "订单编号错误！");
	public static CodeMsg PHONE_ERROR = new CodeMsg(-13, "手机号错误！");
	public static CodeMsg ORDER_AUTH_ERROR = new CodeMsg(-14, "\u8ba2\u5355\u9a8c\u8bc1\u5931\u8d25\uff0c\u8ba2\u5355\u7f16\u53f7\u6216\u624b\u673a\u53f7\u8f93\u5165\u6709\u8bef\u6216\u8005\u53ef\u80fd\u4f60\u8d2d\u4e70\u7684\u662f\u76d7\u7248\uff0c\u8bf7\u8054\u7cfb\u3010\u733f\u6765\u5165\u6b64\u3011\u5ba2\u670d\uff01");
	
	
	//后台管理类错误码
	//用户管理类错误
	public static CodeMsg ADMIN_USERNAME_EMPTY = new CodeMsg(-2000, "用户名不能为空！");
	public static CodeMsg ADMIN_PASSWORD_EMPTY = new CodeMsg(-2001, "密码不能为空！");
	public static CodeMsg ADMIN_NO_RIGHT = new CodeMsg(-2002, "您所属的角色没有该权限！");
	
	//登录类错误码
	public static CodeMsg ADMIN_USERNAME_NO_EXIST = new CodeMsg(-3000, "该用户名不存在！");
	public static CodeMsg ADMIN_PASSWORD_ERROR = new CodeMsg(-3001, "密码错误！");
	public static CodeMsg ADMIN_USER_UNABLE = new CodeMsg(-3002, "该用户已被冻结，请联系管理员！");
	public static CodeMsg ADMIN_USER_ROLE_UNABLE = new CodeMsg(-3003, "该用户所属角色状态不可用，请联系管理员！");
	public static CodeMsg ADMIN_USER_ROLE_AUTHORITES_EMPTY = new CodeMsg(-3004, "该用户所属角色无可用权限，请联系管理员！");
	
	//后台菜单管理类错误码
	public static CodeMsg ADMIN_MENU_ADD_ERROR = new CodeMsg(-4000, "菜单添加失败，请联系管理员！");
	public static CodeMsg ADMIN_MENU_EDIT_ERROR = new CodeMsg(-4001, "菜单编辑失败，请联系管理员！");
	public static CodeMsg ADMIN_MENU_ID_EMPTY = new CodeMsg(-4002, "菜单ID不能为空！");
	public static CodeMsg ADMIN_MENU_ID_ERROR = new CodeMsg(-4003, "菜单ID错误！");
	public static CodeMsg ADMIN_MENU_DELETE_ERROR = new CodeMsg(-4004, "改菜单下有子菜单，不允许删除！");
	//后台角色管理类错误码
	public static CodeMsg ADMIN_ROLE_ADD_ERROR = new CodeMsg(-5000, "角色添加失败，请联系管理员！");
	public static CodeMsg ADMIN_ROLE_NO_EXIST = new CodeMsg(-5001, "该角色不存在！");
	public static CodeMsg ADMIN_ROLE_EDIT_ERROR = new CodeMsg(-5002, "角色编辑失败，请联系管理员！");
	public static CodeMsg ADMIN_ROLE_DELETE_ERROR = new CodeMsg(-5003, "该角色下存在用户信息，不可删除！");
	//后台用户管理类错误码
	public static CodeMsg ADMIN_USER_ROLE_EMPTY = new CodeMsg(-6000, "请选择用户所属角色！");
	public static CodeMsg ADMIN_USERNAME_EXIST = new CodeMsg(-6001, "该用户名已存在，请换一个试试！");
	public static CodeMsg ADMIN_USE_ADD_ERROR = new CodeMsg(-6002, "用户添加失败，请联系管理员！");
	public static CodeMsg ADMIN_USE_NO_EXIST = new CodeMsg(-6003, "用户不存在！");
	public static CodeMsg ADMIN_USE_EDIT_ERROR = new CodeMsg(-6004, "用户编辑失败，请联系管理员！");
	public static CodeMsg ADMIN_USE_DELETE_ERROR = new CodeMsg(-6005, "该用户存在关联数据，不允许删除！");
	
	//后台用户修改密码类错误码
	public static CodeMsg ADMIN_USER_UPDATE_PWD_ERROR = new CodeMsg(-7000, "旧密码错误！");
	public static CodeMsg ADMIN_USER_UPDATE_PWD_EMPTY = new CodeMsg(-7001, "新密码不能为空！");
	
	//后台用户修改密码类错误码
	public static CodeMsg ADMIN_DATABASE_BACKUP_NO_EXIST = new CodeMsg(-8000, "备份记录不存在！");
	
	//后台地域管理类错误码
	public static CodeMsg ADMIN_AREA_NAME_EMPTY = new CodeMsg(-9000, "地域名称不能为空！");
	public static CodeMsg ADMIN_AREA_SAVE_ERROR = new CodeMsg(-9001, "地域保存出错，请联系管理员！");
	public static CodeMsg ADMIN_AREA_DELETE_ERROR = new CodeMsg(-9002, "该地域下存在影院等关联信息，不可删除！");
	public static CodeMsg HOME_AREA_NO_EXIST = new CodeMsg(-9003, "地域不存在！");

	//电影管理类错误码
	public static CodeMsg ADMIN_MOVIE_DELETE_ERROR = new CodeMsg(-10001, "该电影下存在订单等关联信息，不可删除！");
	public static CodeMsg ADMIN_CINEMA_DELETE_ERROR = new CodeMsg(-10002, "该电影院下存在影厅等关联信息，不可删除！");
	public static CodeMsg ADMIN_CINEMA_SAVE_ERROR = new CodeMsg(-10003, "电影院保存失败，请联系管理员！");
	public static CodeMsg ADMIN_CINEMA_HALL_SAVE_ERROR = new CodeMsg(-10004, "影厅保存失败，请联系管理员！");
	public static CodeMsg ADMIN_CINEMA_HALL_DELETE_ERROR = new CodeMsg(-10005, "该影厅下存在座位等关联信息，不可删除！");
	public static CodeMsg ADMIN_CINEMA_HALL_SESSION_DELETE_ERROR = new CodeMsg(-10006, "该场次下存在订单等关联信息，不可删除！");
	public static CodeMsg ADMIN_CINEMA_HALL_SESSION_SAVE_ERROR = new CodeMsg(-10007, "场次保存失败，请联系管理员！");
	public static CodeMsg ADMIN_CINEMA_HALL_SESSION_SAVE_EXIST = new CodeMsg(-10008, "该影厅在当前时间段已经排片，请重新选择放映时间！");
	//新闻资讯管理类错误
	public static CodeMsg ADMIN_NEWS_CATEGORY_NAME_EMPTY = new CodeMsg(-11000, "新闻分类名称不能为空！");
	public static CodeMsg ADMIN_NEWS_CATEGORY_SAVE_ERROR = new CodeMsg(-11001, "新闻分类保存错误，请联系管理员！");
	public static CodeMsg ADMIN_NEWS_CATEGORY_DELETE_ERROR = new CodeMsg(-11002, "该分类下存在新闻，不可删除！");
	public static CodeMsg ADMIN_NEWS_SAVE_ERROR = new CodeMsg(-11003, "新闻保存错误，请联系管理员！");
	public static CodeMsg ADMIN_NEWS_DELETE_ERROR = new CodeMsg(-11004, "新闻删除失败！");
	//前台用户注册登录
	public static CodeMsg HOME_ACCOUNT_REGISTER_MOBILE_EXIST = new CodeMsg(-12000, "该手机号已经注册，请登录！");
	public static CodeMsg HOME_ACCOUNT_REGISTER_MOBILE_NO_EXIST = new CodeMsg(-12001, "该手机号还未注册，请先注册！");
	public static CodeMsg HOME_ACCOUNT_REGISTER_ERROR = new CodeMsg(-12002, "注册失败，请联系管理员！");
	public static CodeMsg HOME_ACCOUNT_LOGIN_PWD_ERROR = new CodeMsg(-12003, "密码错误，请重新输入！");
	public static CodeMsg HOME_ACCOUNT_STATUS_ERROR = new CodeMsg(-12004, "该用户已被冻结，不能登录，请联系管理员！");
	//前台下单类错误
	public static CodeMsg HOME_ADD_ORDER_SEAT_UNABLE = new CodeMsg(-13000, "座位状态不可售，请重新刷新后选座！");
	public static CodeMsg HOME_ADD_ORDER_ERROR = new CodeMsg(-13001, "订单生成失败，请联系管理员！");
	public static CodeMsg HOME_ORDER_NO_EXIST = new CodeMsg(-13002, "订单不存在！");
	public static CodeMsg HOME_ORDER_STATUS_UNABLE = new CodeMsg(-13003, "订单状态不可支付！");
	public static CodeMsg HOME_ORDER_STATUS_TIMEOUT = new CodeMsg(-13004, "订单已超时，不可支付！");
	public static CodeMsg HOME_ORDER_BALANCE_OUT = new CodeMsg(-13005, "余额不足，请先到会员中心充值！");
	public static CodeMsg HOME_ORDER_PAY_ERROR = new CodeMsg(-13006, "订单支付失败，请联系管理员！");
	public static CodeMsg HOME_ORDER_UNABLE_DELETE = new CodeMsg(-13007, "订单已支付成功，不允许删除！");
}
