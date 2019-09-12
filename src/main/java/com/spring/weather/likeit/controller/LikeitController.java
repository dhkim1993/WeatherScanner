package com.spring.weather.likeit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.weather.likeit.model.LikeitVO;
import com.spring.weather.likeit.service.ILikeItService;
import com.spring.weather.member.model.MemberVO;

@RestController
@RequestMapping("/likeit")
public class LikeitController {

	@Autowired
	private ILikeItService service;
	
	@PostMapping("/insertLike")
	public String likeitIn(int boardNo,HttpSession session) throws Exception {
		
		LikeitVO vo = new LikeitVO();
		MemberVO member = (MemberVO) session.getAttribute("login");
		vo.setBoardNo(boardNo);
		vo.setMemberId(member.getMemberId());
		
		if(service.isDuplicate(vo) == 0) {
			service.insertLike(vo);
			service.pluslikeCnt(vo.getBoardNo());
			return "insSuccess";
		} else {
			service.deleteLike(vo);
			service.minuslikeCnt(vo.getBoardNo());
			return "delSuccess";
		}
	}
	
	@PostMapping("/updateLikeCnt")
	public void updateLikeCnt(int boardNo) throws Exception{
		 service.updateLikeCnt(boardNo);
	}
}
