package com.spring.weather.wi.controller;

import com.github.dvdme.ForecastIOLib.FIOCurrently;
import com.github.dvdme.ForecastIOLib.ForecastIO;
import com.spring.weather.citydr.service.CityDrService;
import com.spring.weather.wi.model.WeatherInfoVO;
import com.spring.weather.wi.service.IWeatherInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/WI")
public class WeatherInfoController {
    private static final Logger logger = LoggerFactory.getLogger(WeatherInfoController.class);

    @Autowired
    private CityDrService drService;
    @Autowired
    private IWeatherInfoService wiService;

    @GetMapping("/result")
    public ModelAndView connectSearchResultPage(Model model, @ModelAttribute WeatherInfoVO vo) throws Exception {

        ForecastIO fio = wiService.getWeatherLibObject(vo.getCity());
        fio.setTime(wiService.DateURLFormat(vo.getDate()));
        FIOCurrently currently = new FIOCurrently(fio);

        model.addAttribute("city", vo.getCity())
                .addAttribute("date", vo.getDate())
                .addAttribute("cityInfo", drService.getCityInfo(vo.getCity()))
                .addAttribute("currently",currently);
        return new ModelAndView("result/result_weather");
    }
}
