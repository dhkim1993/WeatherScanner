package com.spring.weather.wi.service;


import com.github.dvdme.ForecastIOLib.ForecastIO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.weather.wi.model.WeatherInfoVO;
import com.spring.weather.wi.repository.IWeatherInfoDAO;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Service
public class WeatherInfoService implements IWeatherInfoService {

	private final IWeatherInfoDAO wiDAO;
	@Autowired
	public WeatherInfoService(IWeatherInfoDAO wiDAO) {
		this.wiDAO = wiDAO;
	}

	String appKey = "9db690b67adc938cb967104b6bb2b664";

	@Override
	public ForecastIO getWeatherLibObject(String city)  {
		WeatherInfoVO vo = getLatLon(city);
		ForecastIO fio = new ForecastIO(appKey);
		fio.setUnits(ForecastIO.UNITS_SI);
		fio.setLang(ForecastIO.LANG_ENGLISH);
		fio.getForecast(vo.getLat(), vo.getLon());
		return fio;
	}

	@Override
	public WeatherInfoVO getLatLon(String city){
		return wiDAO.getLatLon(city);
	}

	//선택한 날짜에 해당하는 데이터를 받아오는 객체 생성을 위한 날짜 setting
	@Override
	public String DateURLFormat(String date) {
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
		Date d = new Date();
		String hms = timeFormat.format(d);
		String time = date + "T" + hms;
		return time;
	}

	//daily 구글차트에 넘길 날짜 데이터 포멧
	@Override
	public Date[] YMDformat() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date time[] =  new java.sql.Date[7];
		Calendar cal = Calendar.getInstance();
		Date d = new Date();
		String date = format.format(d);

		for (int i = 0; i < 7; i++) {
			time[i] = java.sql.Date.valueOf(date);
			cal.add(Calendar.DATE, 1);
			date = format.format(cal.getTime());
		}
		return time;
	}

	@Override
	public String[] WeekOfDay(){
		String[] days ={"Sun","Mon","Tue","Wed","Thu","Fri","Sat"};
		String[] weekOfDayArr = new String[7];
		Calendar cal = Calendar.getInstance();
		for (int i = 0; i < 7; i++) {
			weekOfDayArr[i] = days[cal.get(Calendar.DAY_OF_WEEK)-1];
			cal.add(Calendar.DATE, 1);
		}
		return weekOfDayArr;
	}
}
