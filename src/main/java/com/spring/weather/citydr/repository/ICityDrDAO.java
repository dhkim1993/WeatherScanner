package com.spring.weather.citydr.repository;

import com.spring.weather.citydr.model.CityDrVO;

public interface ICityDrDAO {
	 CityDrVO cityArticle(String cityName) throws Exception;
	 String getCityInfo(String cityName) throws Exception;
}
