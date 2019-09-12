package com.spring.weather.board.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.commons.paging.SearchCriteria;

@Repository
public class BoardDAO implements IBoardDAO {

    private final SqlSession sqlSession;
    private static final String NAMESPACE = "BoardMapper";

    @Autowired
    public BoardDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void insert(BoardVO article)  {
        sqlSession.insert(NAMESPACE + ".insert", article);
    }
    @Override
    public BoardVO getArticle(int boardNo)  {
        System.out.println("게시글 번호: " + boardNo);
        return sqlSession.selectOne(NAMESPACE + ".getArticle", boardNo);
    }
    @Override
    public void update(BoardVO article)  {
        sqlSession.update(NAMESPACE + ".update", article);
    }
    @Override
    public void delete(int boardNo) {
        sqlSession.delete(NAMESPACE + ".delete", boardNo);
    }
    @Override
    public List<BoardVO> listSearch(SearchCriteria cri)  {
        return sqlSession.selectList(NAMESPACE + ".listSearch", cri);
    }
    @Override
    public int countSearchArticles(SearchCriteria cri)  {
        return sqlSession.selectOne(NAMESPACE + ".countSearchArticles", cri);
    }
    @Override
    public void updateViewCnt(int boardNo)  {
        sqlSession.update(NAMESPACE + ".updateViewCnt", boardNo);
    }
    @Override
    public void updateReplyCnt(int boardNo, int count)  {
        Map<String, Object> datas = new HashMap<>();
        System.out.println("원본 글 번호: " + boardNo);
        datas.put("boardNo", boardNo);
        datas.put("count", count);
        sqlSession.update(NAMESPACE + ".updateReplyCnt", datas);
    }
    @Override
    public void deleteAll(String memberId)  {
        sqlSession.delete(NAMESPACE + ".deleteAll", memberId);
    }
    @Override
    public List<BoardVO> memberWriteAllArticles(String memberId)  {
        return sqlSession.selectList(NAMESPACE + ".memberWriteAllArticles", memberId);
    }
    @Override
    public int countMemberArticles(String memberId)  {
        return sqlSession.selectOne(NAMESPACE + ".countMemberArticles", memberId);
    }
}