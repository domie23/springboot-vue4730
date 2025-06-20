package com.demo.movie.controller.home;


import com.demo.movie.service.common.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @Autowired
    private AreaService areaService;
    @Autowired
    private MovieService movieService;
    @Autowired
    private CinemaService cinemaService;
    @Autowired
    private NewsService newsService;

    /**
     * 前台首页
     * @param model
     * @return
     */
    @RequestMapping("/")
    public String index(Model model){
        model.addAttribute("topMovieList", movieService.findTopList(12));
        model.addAttribute("topCinemaList", cinemaService.findTopList());
        model.addAttribute("topVideoMovieList", movieService.findTopVideoList(4));
        model.addAttribute("topMoneyMovieList", movieService.findTopMoneyList());
        model.addAttribute("topNewsList", newsService.findTop());
        return "home/index/index";
    }
}
