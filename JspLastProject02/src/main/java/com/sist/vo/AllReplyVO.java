package com.sist.vo;

import java.util.Date;

import lombok.Data;
@Data
public class AllReplyVO {
	private int rno, cno, type;
	private String id, name, msg, dbday;
	private Date regdate;
}
