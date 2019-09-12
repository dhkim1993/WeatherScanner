package com.spring.weather.wi.model;

import lombok.Data;

//lat,lon 은 위도,경도 입니다.
@Data
public class WeatherInfoVO {
	private String city;
	private String date;
	private String lat;
	private String lon;
}
