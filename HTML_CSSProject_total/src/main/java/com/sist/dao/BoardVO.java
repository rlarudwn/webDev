/*
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 NO                                        NOT NULL NUMBER
 NAME                                      NOT NULL VARCHAR2(51)
 SUBJECT                                   NOT NULL VARCHAR2(4000)
 CONTENT                                   NOT NULL CLOB
 PWD                                       NOT NULL VARCHAR2(15)
 REGDATE                                            DATE
 HIT                                                NUMBER

 */
package com.sist.dao;

import java.util.Date;

import lombok.Data;

@Data

public class BoardVO {
	private int no, hit;
	private String name, subject, content, pwd;
	private Date regdate;
	private String db_day;
}
