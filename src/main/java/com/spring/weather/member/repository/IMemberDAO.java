package com.spring.weather.member.repository;

import java.util.List;
import java.util.Map;

import com.spring.weather.member.model.LoginVO;
import com.spring.weather.member.model.MemberVO;

public interface IMemberDAO {
	void register(MemberVO member) throws Exception;
	MemberVO getMemberInfo(String memberId) throws Exception;
	void update(MemberVO member) throws Exception;
	void delete(String memberId) throws Exception;
	List<MemberVO> getMemberList() throws Exception;
	int isDuplicateId(String memberId) throws Exception;
	MemberVO login(LoginVO login) throws Exception;
	void keepLogin(Map<String, Object> datas) throws Exception;
	MemberVO getUserWithSessionId(String sessionId) throws Exception;
}
