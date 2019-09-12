package com.spring.weather.likeit.repository;

import java.util.List;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.likeit.model.LikeitVO;

public interface ILikeitDAO {
    void insertLike(LikeitVO vo) throws Exception;
    void deleteLike(LikeitVO vo) throws Exception;
    int isDuplicate(LikeitVO vo) throws Exception;
    int countLike(int boardNo) throws Exception;
    void pluslikeCnt(int boardNo) throws Exception;
    void minuslikeCnt(int boardNo) throws Exception;
    void deleteAll(String memberId) throws Exception;
    void deleteBoard(int boardNo) throws Exception;
    void updateLikeCnt(int boardNo) throws Exception;
    void insertArticle(BoardVO article) throws Exception;
    List<LikeitVO> selectAllArticles(String memberId) throws Exception;
    int countLikeArticles(String memberId) throws Exception;
}
