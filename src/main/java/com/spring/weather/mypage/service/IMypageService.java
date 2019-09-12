package com.spring.weather.mypage.service;

import java.util.List;

import com.spring.weather.board.model.BoardVO;

public interface IMypageService {
	List<BoardVO> likeList(String memberId) throws Exception;
	int countLikeArticles(String memberId) throws Exception;
}
