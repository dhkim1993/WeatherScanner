package com.spring.weather.wi.service;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by kimdonghyun on 11/09/2019.
 */
public class DateTest {
    public static void main(String[] args) {
        String[] days ={"일","월","화","수","목","금","토"};
        String[] weekOfDayArr = new String[7];
        Calendar cal = Calendar.getInstance();
        for (int i = 0; i < 7; i++) {
            weekOfDayArr[i] = days[cal.get(Calendar.DAY_OF_WEEK)-1];
            cal.add(Calendar.DATE, 1);
        }






    }
}
