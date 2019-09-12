package com.spring.weather.citydr.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.weather.citydr.model.CityDrVO;
import com.spring.weather.citydr.repository.ICityDrDAO;

@Service
public class CityDrService implements ICityDrService {

    @Autowired
    private ICityDrDAO drDAO;

    @Override
    public CityDrVO cityArticle(String city) throws Exception {
        CityDrVO ca = drDAO.cityArticle(city);
        ca.setCityInfo(ca.getCityInfo().replace("\n", "<br>"));
        return ca;
    }

    @Override
    public String getCityInfo(String city) throws Exception {
        return drDAO.getCityInfo(city).replace("\n","<br>");
    }
}
