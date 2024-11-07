package com.sist.vo;

import java.util.Date;

import lombok.Data;
@Data
public class BoardVO {
	private int fbno, cno, fbhit;
	private String fbsubject, id, nick, content, fbphoto, dbday, typeDetail;
	private Date regdate;
}
