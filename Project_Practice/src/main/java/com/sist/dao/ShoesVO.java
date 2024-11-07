/*
NO                                        NOT NULL NUMBER
 NAME_ENG                                           VARCHAR2(1000)
 NAME_KOR                                           VARCHAR2(1000)
 POSTER                                             VARCHAR2(1000)
 BRAND                                              VARCHAR2(1000)
 PRICE                                              VARCHAR2(1000)
 STYLECODE                                          VARCHAR2(100)
 PROCODE                                            VARCHAR2(100)
 */
package com.sist.dao;

import lombok.Data;

@Data

public class ShoesVO {
	private int no;
	private String name, poster, brand, price, code;
}
