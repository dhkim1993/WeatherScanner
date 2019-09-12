package com.spring.weather.board.service;

import java.util.List;

import com.spring.weather.addfile.model.AddFileVO;
import com.spring.weather.board.model.BoardVO;
import com.spring.weather.commons.paging.Criteria;
import com.spring.weather.commons.paging.SearchCriteria;

public interface IBoardService {
    void insert(BoardVO article, AddFileVO file) throws Exception;
    void insert(BoardVO article) throws Exception;
    BoardVO getArticle(int boardNo, boolean trigger) throws Exception;
    void update(BoardVO article) throws Exception;
    void update(BoardVO article, AddFileVO file) throws Exception;
    void delete(int boardNo) throws Exception;
    List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
    int countSearchArticles(SearchCriteria cri) throws Exception;
    List<BoardVO> memberWriteAllArticles(String memberId) throws Exception;
    int countMemberArticles(String memberId) throws Exception;
}
