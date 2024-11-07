package com.sist.dao;

import lombok.Data;

@Data

public class ReplyVO {
	private String id, name, msg, regdate;
	private int rno, no, type;
}
