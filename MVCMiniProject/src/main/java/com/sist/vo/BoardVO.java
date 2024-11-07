package com.sist.vo;

import java.util.Date;

import lombok.Data;

@Data

public class BoardVO {
	private int no, hit, rownum;
	private String name, subject, content, pwd, dbDay;
	private Date regDate;
}
