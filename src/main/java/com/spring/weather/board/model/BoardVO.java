package com.spring.weather.board.model;

import java.util.Date;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class BoardVO {
    private int boardNo;
    private String title;
    private String content;
    private String memberId;
    private Date regDate;
    private int viewCnt;
    private int replyCnt;
    private int likeCnt;
    private boolean newMark;
    private MultipartFile file;
}
