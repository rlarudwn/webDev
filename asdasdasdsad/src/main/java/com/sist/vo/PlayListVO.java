package com.sist.vo;

import java.util.Date;

import lombok.Data;
@Data
public class PlayListVO {
	private int plno;
	private String id, plname, dbday;
	private Date regdate;
	private String poster;
	private int count;
}
