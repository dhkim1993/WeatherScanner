package com.spring.weather.member.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.spring.weather.member.model.LoginVO;
import com.spring.weather.member.model.MemberVO;
import com.spring.weather.member.service.IMemberService;

@RestController
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private IMemberService service;

	//회원가입 처리요청
	@PostMapping("")
	public String register(@RequestBody MemberVO member) throws Exception{
		logger.info("/member/요청 발생: POST");
		logger.info("Param:"+member);
		service.register(member);
		return "joinSuccess";
	}
 
	//회원 가입 페이지 열기 요청
	@GetMapping("/join")
	public ModelAndView register() throws Exception{
		logger.info("/member/join 요청 발생: GET");
		return new ModelAndView("member/join");
	}

	//회원관리 페이지 요청 
	@GetMapping("/adminMem")
	public ModelAndView MemberInfo( Model model) throws Exception{
		model.addAttribute("members", service.getMemberList());
		for(MemberVO vo:service.getMemberList()) {
			System.out.println(vo);
		}
		return new ModelAndView("admin/member_admin");
	}

	@RequestMapping(value="/index", method=RequestMethod.GET)
	public ModelAndView	MemberInfo2( HttpSession session, Model model)throws Exception{
		
		MemberVO object = (MemberVO) session.getAttribute("login");
		model.addAttribute("member", service.getMemberInfo(object.getMemberId()));
		logger.info(service.getMemberInfo(object.getMemberId()).toString());
		return new ModelAndView("/index");
		}

	@PostMapping("/c")
	public String MemberModify(MemberVO member) throws Exception{
		service.update(member);
		return "redirect:#";
	}

	//회원탈퇴처리
	@DeleteMapping("/admindel")
	public String MemberDelete(String memberId) throws Exception {
		service.delete(memberId);
		return "delSuccess"; 
	}

	//ID 중복확인 체크 요청
	@PostMapping("/idCheck")
	public Map<String, Object> confirmId(@RequestBody String memberId) throws Exception{
		System.out.println("중복확인 요청 ID:"+ memberId);
		Map<String, Object> data = new HashMap<>();

		int result = service.isDuplicateId(memberId);
		if(result == 0) {
			System.out.println("아이디 사용가능");
			data.put("confirm","OK");

		}else {
			System.out.println("아이디가 중복됨");
			data.put("confirm", "NO");
		}
		return data;
	}


	//로그인 페이지 요청
	@GetMapping("/login")
	public ModelAndView login() throws Exception {
		logger.info("/member/login 요청! : GET");
		return new ModelAndView("member/login");
	}

	//로그인 검증 요청
	@PostMapping("/loginCheck")
	public String login(@RequestBody LoginVO login, 
			HttpSession session, HttpServletResponse res) throws Exception {

		logger.info("/member/loginCheck 요청! : POST");
		logger.info("parameters : " + login);

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		MemberVO member = service.login(login);
		logger.info("로그인 시도 회원정보: " + member);

		String result = null;

		if(member != null) {
			//아이디 존재
			if(encoder.matches(login.getMemberPw(), member.getMemberPw())) {
				//비밀번호 일치 -> 로그인 성공
				session.setAttribute("login", member);
				result = "loginSuccess";

				//자동 로그인 쿠키 생성
				if(login.isAutoLogin()) {
					logger.info("자동로그인 체크함!");
					long limitTime = 60 * 60 * 24 * 90;
					Date sessionLimit = new Date(System.currentTimeMillis() + (limitTime * 1000));

					//쿠키 생성
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					//쿠키 속성 설정
					loginCookie.setMaxAge((int)limitTime);
					loginCookie.setPath("/");
					//생성된 쿠키를  response객체에 실어서 전송.
					res.addCookie(loginCookie);
					service.keepLogin(member.getMemberId(), session.getId(), sessionLimit);
				}
			} else {
				//비밀번호 틀림
				result = "pwFail";
			}
		} else {
			//아이디 없음
			result = "idFail";
		}		
		return result;
	}

	//로그아웃 요청
	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws Exception {

		Object object = session.getAttribute("login");
		if (object != null) {
			MemberVO memberVO = (MemberVO) object;
			session.removeAttribute("login");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(memberVO.getMemberId(), "none", new Date());
			}
		}
		return new ModelAndView("redirect:/");
	}
}
