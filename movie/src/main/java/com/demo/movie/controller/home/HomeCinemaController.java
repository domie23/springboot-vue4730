package com.demo.movie.controller.home;

import java.util.ArrayList;
import java.util.List;

import com.demo.movie.bean.Result;
import com.demo.movie.constant.SessionConstant;
import com.demo.movie.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.movie.entity.common.Area;
import com.demo.movie.entity.common.Cinema;
import com.demo.movie.service.common.CinemaCommentService;
import com.demo.movie.service.common.CinemaHallSessionService;
import com.demo.movie.service.common.CinemaService;
import com.demo.movie.service.common.MovieService;
import com.demo.movie.service.common.NewsService;

/**
 * 前台电影院控制器
 * @author Administrator
 *
 */
@RequestMapping("/home/cinema")
@Controller
public class HomeCinemaController {

	@Autowired
	private MovieService movieService;
	@Autowired
	private NewsService newsService;
	@Autowired
	private CinemaHallSessionService cinemaHallSessionService;
	@Autowired
	private CinemaService cinemaService;
	@Autowired
	private CinemaCommentService cinemaCommentService;
	/**
	 * 电影院列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(Model model){
		Area area = (Area) SessionUtil.get(SessionConstant.SESSION_HOME_AREA);
		model.addAttribute("cinemaList", area == null ? cinemaService.findAll() : cinemaService.findAll(area.getId()));
		model.addAttribute("topNewsList", newsService.findTop());
		model.addAttribute("topMoneyMovieList", movieService.findTopMoneyList());
		return "home/cinema/list";
	}
	
	/**
	 * 影院详情页面
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/detail")
	public String detail(Model model,@RequestParam(name="id",required=true) Long id){
		Cinema findById = cinemaService.findById(id);
		model.addAttribute("cinema", findById);
		model.addAttribute("cinemaHallSessionList", cinemaHallSessionService.findDistinctShowDateByCinemaList(id));
		model.addAttribute("nearCinemaList", cinemaService.findAll(findById.getArea().getCityId()));
		model.addAttribute("commentList", cinemaCommentService.findByCinema(id));
		return "home/cinema/detail";
	}
	
	/**
	 * 获取指定影院、指定日期下的上映影片
	 * @param model
	 * @param cid
	 * @param showDate
	 * @return
	 */
	@RequestMapping("/get_show_movie")
	public String getShowMovie(Model model,
			@RequestParam(name="cid",required=true) Long cid,
			@RequestParam(name="showDate",required=true) String showDate){
		model.addAttribute("cinemaHallSessionList", cinemaHallSessionService.findDistinctMovieByCinemaList(cid, showDate));
		return "home/cinema/get_show_movie";
	}
	
	/**
	 * 统计影院上映场次
	 * @param cinemaId
	 * @return
	 */
	@RequestMapping("/get_show_stats")
	@ResponseBody
	public Result<List<Integer>> getShowStats(@RequestParam(name="cid",required=true) Long cinemaId) {
		List<Integer> ret = new ArrayList<Integer>();
		List<Integer> showTotal = cinemaHallSessionService.getCinemaShowTotal(cinemaId);
		if(showTotal == null || showTotal.size() <= 0){
			ret.add(0);
			ret.add(0);
			return Result.success(ret);
		}
		ret.add(showTotal.size());//上映的电影数
		//计算场次数
		int totalSession = 0;
		for(int i=0; i< showTotal.size();i++){
			totalSession += Integer.parseInt(showTotal.get(i)+"");
		}
		ret.add(totalSession);
		return Result.success(ret);
	}
}
