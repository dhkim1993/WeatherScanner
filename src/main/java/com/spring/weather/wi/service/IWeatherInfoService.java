package com.spring.weather.wi.service;


import com.github.dvdme.ForecastIOLib.ForecastIO;
import com.spring.weather.wi.model.WeatherInfoVO;

import java.util.Date;

public interface IWeatherInfoService {
	//해당도시의 좌표를 얻는 메소드
	WeatherInfoVO getLatLon(String city) throws Exception;
	String DateURLFormat(String date) throws Exception;
	//daily 구글차트에 넘길 날짜 데이터 포멧
	Date[] YMDformat() throws Exception;
	String[] WeekOfDay() throws Exception;
	//라이브러리 데이터를 받기위해 선택한 도시의 좌표를 setting하는 메소드
	ForecastIO getWeatherLibObject(String city) throws Exception;
}
