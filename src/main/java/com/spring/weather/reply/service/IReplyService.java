package com.spring.weather.reply.service;

import java.util.List;
import java.util.Map;

import com.spring.weather.commons.paging.Criteria;
import com.spring.weather.reply.model.ReplyVO;

public interface IReplyService {

	List<ReplyVO> list(int boardNo) throws Exception;
	void insert(ReplyVO reply) throws Exception;
	void update(ReplyVO reply) throws Exception;
	void delete(int replyNo, int boardNo) throws Exception;
	List<ReplyVO> listPaging(int boardNo, Criteria cri) throws Exception;
	int countReplies(int boardNo) throws Exception;
}
