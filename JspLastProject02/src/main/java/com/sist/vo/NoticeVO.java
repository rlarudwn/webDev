package com.sist.vo;

import java.util.Date;

import lombok.Data;
@Data
public class NoticeVO {
	private int no, type, hit;
	private String name, subject, content, dbday, noticeType;
	private Date regdate;
}
