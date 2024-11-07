package com.sist.dao;

import java.util.Date;

import lombok.Data;

@Data

public class DataBoardVO {
	private int no, filesize, hit;
	private String name, subject, content, pwd, filename;
	private Date regdate;
	private String dbday;
}
