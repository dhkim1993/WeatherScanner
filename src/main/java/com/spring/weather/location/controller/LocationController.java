package com.spring.weather.location.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.weather.board.service.IBoardService;
import com.spring.weather.commons.paging.PageCreator;
import com.spring.weather.commons.paging.SearchCriteria;
import com.spring.weather.location.model.LocationVO;
import com.spring.weather.location.service.ILocationService;

@RestController
@RequestMapping("/reLoca")
public class LocationController {

    @Autowired
    private ILocationService service;
    @Autowired
    IBoardService boardservice;

    @GetMapping("/recity")
    public ModelAndView listLocation(Model model, @RequestParam("month") int month) throws Exception {
        model.addAttribute("locations", service.MonthLocation(month))
             .addAttribute("month", month);
        return new ModelAndView("result/result_city");
    }

    @GetMapping("/admincity")
    public ModelAndView adminLocation(SearchCriteria cri, Model model) throws Exception {
        PageCreator pc = new PageCreator();
        pc.setCriteria(cri);
        pc.setArticleTotalCount(boardservice.countSearchArticles(cri));
        model.addAttribute("pageCreator", pc)
             .addAttribute("locations", service.adminLoca());
        return new ModelAndView("admin/reloca_admin");
    }

    @DeleteMapping("/delcity")
    public String deleteLocation(int cityNo) throws Exception {
        service.deleteLocation(cityNo);
        return "delSuccess";
    }

    @GetMapping("/content/{cityNo}")
    public ModelAndView cityInfomation(@PathVariable int cityNo, Model model) throws Exception {
        model.addAttribute("location", service.getDetailCity(cityNo));
        return new ModelAndView("result/cityInfo");
    }

    @GetMapping("/modify/{cityNo}")
    public ModelAndView cityInfoModify(@PathVariable int cityNo, SearchCriteria cri, Model model) throws Exception {
        model.addAttribute("article", service.getDetailCity(cityNo))
             .addAttribute("cri", cri);
        return new ModelAndView("admin/modify");
    }

    @PostMapping("/modifycity")
    public ModelAndView cityModify(LocationVO article) throws Exception {
        service.updateLocation(article);
        return new ModelAndView("redirect:/reLoca/admincity");
    }

    @GetMapping("/writeCity")
    public ModelAndView cityInsertInfo() throws Exception {
        return new ModelAndView("admin/writeInfo");
    }

    @PostMapping("/insert")
    public ModelAndView cityInsert(LocationVO city) throws Exception {
        service.insertLocation(city);
        return new ModelAndView("redirect:/reLoca/admincity");
    }
}
