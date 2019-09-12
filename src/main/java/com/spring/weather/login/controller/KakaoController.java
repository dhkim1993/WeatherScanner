package com.spring.weather.login.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.weather.login.service.KakaoService;


@Controller
public class KakaoController {

	@Autowired
	private KakaoService kakaoService;

	@GetMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam String code,HttpSession session) throws Exception{
		String accessToken = kakaoService.getAccessToken(code);
		Map<String, Object> userData = kakaoService.getKakaoUserData(accessToken);
		session.setAttribute("access_token", accessToken);
		session.setAttribute("login", userData);
		return "redirect:/";
	}
	
	@GetMapping("/kakaoLogout")
	public String logout(HttpSession session) {
		kakaoService.kakaoLogout((String)session.getAttribute("access_token"));
		session.invalidate();
		return "redirect:/";
	}
}
