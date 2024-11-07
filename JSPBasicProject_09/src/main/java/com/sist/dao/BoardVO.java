package com.sist.dao;

import java.util.*;

import lombok.Data;
/*
	NO                                        NOT NULL NUMBER
 NAME                                      NOT NULL VARCHAR2(50)
 SUBJECT                                   NOT NULL VARCHAR2(2000)
 CONTENT                                   NOT NULL CLOB
 PWD                                       NOT NULL VARCHAR2(10)
 REGDATE                                            DATE
 HIT                                                NUMBER
 GROUP_ID                                           NUMBER
 GROUP_STEP                                         NUMBER
 GROUP_TAB                                          NUMBER
 ROOT                                               NUMBER
 DEPT                                               NUMBER
 */
@Data

public class BoardVO {
	private int no, hit, group_id, group_step, group_tab, root, dept;
	private String name, subject, content, pwd;
	private Date regdate;

}
