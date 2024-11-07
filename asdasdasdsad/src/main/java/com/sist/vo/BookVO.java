package com.sist.vo;

import java.util.Date;

import lombok.Data;

/*
 *  BNO        NOT NULL NUMBER         
	BTAG                VARCHAR2(1000) 
	BGENRE     NOT NULL VARCHAR2(1000) 
	COVER      NOT NULL VARCHAR2(1000) 
	BTITLE     NOT NULL VARCHAR2(1000) 
	WRITER              VARCHAR2(1000) 
	PRICE      NOT NULL VARCHAR2(1000) 
	SALE_PRICE          VARCHAR2(1000) 
	DIS_RATE            VARCHAR2(1000) 
	BDATE               DATE           
	PUBLISHER  NOT NULL VARCHAR2(1000) 
	INTRO               CLOB           
	INTRO_IMG           VARCHAR2(1000) 
	PAGES               VARCHAR2(1000) 
	ISBN13              VARCHAR2(30)   
	ISBN10              VARCHAR2(30)   
 */
@Data
public class BookVO {
  private int bno;
  private String btag,bgenre,cover,btitle,writer,price,sale_price,dis_rate,publisher,intro,intro_img,pages,isbn13,isbn10,dbday;
  private Date bdate;
}
