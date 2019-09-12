package com.spring.weather.wi.controller;

import com.github.dvdme.ForecastIOLib.FIODaily;
import com.github.dvdme.ForecastIOLib.FIOHourly;
import com.github.dvdme.ForecastIOLib.ForecastIO;
import com.spring.weather.citydr.model.CityDrVO;
import com.spring.weather.citydr.service.ICityDrService;
import com.spring.weather.wi.model.WeatherInfoVO;
import com.spring.weather.wi.service.IWeatherInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


/**
 * Created by kimdonghyun on 28/08/2019.
 */
@RestController
@RequestMapping("/WI")
public class ChartIconController {

    @Autowired
    private ICityDrService drService;
    @Autowired
    private IWeatherInfoService wiService;

    public ChartIconController(ICityDrService drService, IWeatherInfoService wiService) {
        this.drService = drService;
        this.wiService = wiService;
    }

    @GetMapping("/charticon")
    public ModelAndView temperatureChart(Model model, WeatherInfoVO vo) throws Exception {
        ForecastIO fio = wiService.getWeatherLibObject(vo.getCity());
        FIODaily daily = new FIODaily(fio);
        fio.setTime(wiService.DateURLFormat(vo.getDate()));
        FIOHourly hourly = new FIOHourly(fio);

        model.addAttribute("daily",daily)
                .addAttribute("hourly", hourly)
                .addAttribute("time", wiService.YMDformat())
                .addAttribute("weekOfDay", wiService.WeekOfDay());
        return new ModelAndView("include/wi/chart_icon");
    }

    @GetMapping("/dr")
    public ModelAndView chart_dr(Model model, WeatherInfoVO vo) throws Exception {
        //해당 도시의 건기우기 정보들을 가져옵니다.
        CityDrVO dr = drService.cityArticle(vo.getCity());
        model.addAttribute("dr", dr);
        return new ModelAndView("/include/wi/chart_dr");
    }
}
