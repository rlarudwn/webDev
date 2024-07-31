package com.sist.dao;

import java.util.Date;

import lombok.Data;
@Data

public class BoardVO {
	private int no, hit, rownum;
	private String name, subject, content, pwd, dbday;
	private Date regDate;
}
