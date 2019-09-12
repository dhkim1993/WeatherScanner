package com.spring.weather.mypage.controller;

import java.util.ArrayList;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.board.service.IBoardService;
import com.spring.weather.commons.paging.PageCreator;
import com.spring.weather.commons.paging.SearchCriteria;
import com.spring.weather.likeit.model.LikeitVO;
import com.spring.weather.likeit.service.ILikeItService;
import com.spring.weather.member.model.MemberVO;
import com.spring.weather.member.service.IMemberService;

import javax.servlet.http.HttpSession;


@RestController
@RequestMapping("/mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Autowired
	private IMemberService memberService;
	@Autowired
	private IBoardService boardService;
	@Autowired
	private ILikeItService likeService;
	
	@RequestMapping(value="/myModify", method=RequestMethod.GET)
	public ModelAndView myupdate(Model model, HttpSession session) throws Exception {
	logger.info("method: get > /mypage/mymodify 요청");
	MemberVO member = (MemberVO)session.getAttribute("login");
	model.addAttribute("member", memberService.getMemberInfo(member.getMemberId()));
	return new ModelAndView("/mypage/myupdate");
	}
	
	@RequestMapping(value="/myModify", method=RequestMethod.POST)
	public String myupdate(@RequestBody MemberVO member) throws Exception {
	logger.info("method: post > /mypage/mymodify");
	memberService.update(member);
	return "upSuccess";
	}

	@RequestMapping(value="/myLike", method=RequestMethod.GET)
   public ModelAndView myLike(SearchCriteria cri, Model model, HttpSession session) throws Exception {
      logger.info("method: get > /mypage/myLike 요청");
      MemberVO member = (MemberVO)session.getAttribute("login");
      PageCreator pc = new PageCreator();
      pc.setCriteria(cri);
      pc.setArticleTotalCount(likeService.countLikeArticles(member.getMemberId()));
      List<LikeitVO> boardNoArr = likeService.selectAllArticles(member.getMemberId());
      List<BoardVO> articles = new ArrayList<>();
      for(LikeitVO likeBoardNo : boardNoArr) {
      	articles.add(boardService.getArticle(likeBoardNo.getBoardNo(), true));
      }
      model.addAttribute("pageCreator", pc);
      model.addAttribute("articles", articles);
      return new ModelAndView("mypage/mylike");
   }
   
   @RequestMapping(value="/myWrite", method=RequestMethod.GET)
   public ModelAndView myWrite(SearchCriteria cri, Model model, HttpSession session) throws Exception {
      logger.info("method: get > /mypage/myWrite 요청");
      MemberVO member = (MemberVO)session.getAttribute("login");
      PageCreator pc = new PageCreator();
      pc.setCriteria(cri);
      pc.setArticleTotalCount(boardService.countMemberArticles(member.getMemberId()));
      List<BoardVO> articles = boardService.memberWriteAllArticles(member.getMemberId());
      model.addAttribute("pageCreator", pc);
      model.addAttribute("articles", articles);
      return new ModelAndView("mypage/mywrite");
   }
}
