package com.spring.weather.wi.repository;

import com.spring.weather.wi.model.WeatherInfoVO;
import org.springframework.stereotype.Repository;

//해당도시에 입력된 위도,경도를 DB에서 가져오는 메서드입니다.
@Repository
public interface IWeatherInfoDAO {
	WeatherInfoVO getLatLon(String city);
}
