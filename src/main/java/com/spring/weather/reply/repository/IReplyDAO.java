package com.spring.weather.reply.repository;

import java.util.List;
import java.util.Map;

import com.spring.weather.commons.paging.Criteria;
import com.spring.weather.reply.model.ReplyVO;

public interface IReplyDAO {

	List<ReplyVO> list(int boardNo) throws Exception;
	void insert(ReplyVO reply) throws Exception;
	void update(ReplyVO reply) throws Exception;
	void delete(int replyNo) throws Exception;
	void deleteAllReply(int BoardNo) throws Exception;
	int countReplies(int boardNo) throws Exception;
	   List<ReplyVO> listPaging(Map<String, Object> datas) throws Exception;
}
