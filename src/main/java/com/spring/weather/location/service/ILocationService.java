package com.spring.weather.location.service;

import java.util.List;

import com.spring.weather.commons.paging.SearchCriteria;
import com.spring.weather.location.model.LocationVO;

public interface ILocationService {

	void insertLocation(LocationVO city) throws Exception;
	void deleteLocation(int cityNo) throws Exception;
	void updateLocation(LocationVO city) throws Exception;
	List<LocationVO> MonthLocation(int month) throws Exception;
	LocationVO getDetailCity(int cityNo) throws Exception;

	//관리자 페이지용 모든 데이터 호출
	List<LocationVO> adminLoca() throws Exception;
	int countSearchArticles(SearchCriteria cri) throws Exception;
}
