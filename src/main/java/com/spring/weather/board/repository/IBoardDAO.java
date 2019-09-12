package com.spring.weather.board.repository;

import java.util.List;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.commons.paging.Criteria;
import com.spring.weather.commons.paging.SearchCriteria;

public interface IBoardDAO {
    void insert(BoardVO article) throws Exception;
    BoardVO getArticle(int boardNo) throws Exception;
    void update(BoardVO article) throws Exception;
    void delete(int boardNo) throws Exception;
    List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
    int countSearchArticles(SearchCriteria cri) throws Exception;
    void updateViewCnt(int boardNo) throws Exception;
    void updateReplyCnt(int boardNo, int count) throws Exception;
    void deleteAll(String memberId) throws Exception;
    List<BoardVO> memberWriteAllArticles(String memberId) throws Exception;
    int countMemberArticles(String memberId) throws Exception;
}


