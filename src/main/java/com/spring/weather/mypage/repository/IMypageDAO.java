package com.spring.weather.mypage.repository;

import java.util.List;

import com.spring.weather.board.model.BoardVO;

public interface IMypageDAO {
	List<BoardVO> likeList(String memberId) throws Exception;
	int countLikeArticles(String memberId) throws Exception;
}
