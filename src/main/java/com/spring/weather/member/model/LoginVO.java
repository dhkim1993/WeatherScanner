package com.spring.weather.member.model;

import lombok.Data;

@Data
public class LoginVO {
	private String memberId;
	private String memberPw;
	private boolean autoLogin;
}
