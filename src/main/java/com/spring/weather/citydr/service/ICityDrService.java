package com.spring.weather.citydr.service;

import com.spring.weather.citydr.model.CityDrVO;

public interface ICityDrService {
	 CityDrVO cityArticle(String city) throws Exception;
	String getCityInfo(String city) throws Exception;
}
