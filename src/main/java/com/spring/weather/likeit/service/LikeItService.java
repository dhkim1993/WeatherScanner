package com.spring.weather.likeit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.likeit.model.LikeitVO;
import com.spring.weather.likeit.repository.ILikeitDAO;

@Service
public class LikeItService implements ILikeItService {

    @Autowired
    private ILikeitDAO dao;

    @Override
    public void insertLike(LikeitVO vo) throws Exception {
        dao.insertLike(vo);
    }
    @Override
    public void deleteLike(LikeitVO vo) throws Exception {
        dao.deleteLike(vo);
    }
    @Override
    public int isDuplicate(LikeitVO vo) throws Exception {
        return dao.isDuplicate(vo);
    }
    @Override
    public void pluslikeCnt(int boardNo) throws Exception {
        dao.pluslikeCnt(boardNo);
    }
    @Override
    public void minuslikeCnt(int boardNo) throws Exception {
        dao.minuslikeCnt(boardNo);
    }
    @Override
    public void updateLikeCnt(int boardNo) throws Exception {
        dao.updateLikeCnt(boardNo);
    }
    @Override
    public List<LikeitVO> selectAllArticles(String memberId) throws Exception {
        return dao.selectAllArticles(memberId);
    }
    @Override
    public int countLikeArticles(String memberId) throws Exception {
        return dao.countLikeArticles(memberId);
    }
}
