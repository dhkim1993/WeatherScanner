package com.spring.weather.addfile.service;

import com.spring.weather.addfile.model.AddFileVO;

public interface IAddFileService {

	void deleteFile(int fileNo) throws Exception;
	AddFileVO selectFile(int boardNo) throws Exception;
	int countFile(int boardNo) throws Exception;
}
