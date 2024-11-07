package com.sist.vo;
/*
FRNO
FBNO
ID
CONTENT
REGDATE
ROOT
DEPTH
NICK
 */

import java.util.Date;

import lombok.Data;
@Data
public class ReplyVO {
	private int frno, fbno, root, depth;
	private String id, content, dbday, nick;
	private Date regdate;
}
