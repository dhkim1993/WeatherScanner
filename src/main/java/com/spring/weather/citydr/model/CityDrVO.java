package com.spring.weather.citydr.model;

import lombok.Data;

@Data
public class CityDrVO {

	private String cityName;
	private String cityInfo;
	private String cityDryStart;
	private String cityDryEnd;
	private String cityRainStart;
	private String cityRainEnd;
	private String rcmdMonStart;
	private String rcmdMonEnd;

	@Override
	public String toString() {
		return "CityDrVO [cityName=" + cityName + ", cityInfo=" + cityInfo + ", getCityName()=" + getCityName()
				+ ", getCityInfo()=" + getCityInfo() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}
