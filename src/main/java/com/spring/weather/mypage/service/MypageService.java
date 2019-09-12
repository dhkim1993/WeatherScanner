package com.spring.weather.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.mypage.repository.IMypageDAO;

@Service
public class MypageService implements IMypageService{

	@Autowired
	private IMypageDAO mypageDAO;

	@Override
	public List<BoardVO> likeList(String memberId) throws Exception {
		return mypageDAO.likeList(memberId);
	}
	
	@Override
	public int countLikeArticles(String memberId) throws Exception {
		return mypageDAO.countLikeArticles(memberId);
	}
}
