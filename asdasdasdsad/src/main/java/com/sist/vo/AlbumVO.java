package com.sist.vo;
/*
ALNO      NOT NULL NUMBER         
ANO                NUMBER         
ATITLE    NOT NULL VARCHAR2(1000) 
POSTER             VARCHAR2(2000) 
REGDATE            DATE           
GENRE              VARCHAR2(1000) 
STYLE              VARCHAR2(1000) 
LIKECOUNT          NUMBER 
*/

import java.util.Date;

import lombok.Data;

@Data

public class AlbumVO {
	private int alno, ano, likecount;
	private String atitle, poster, dbday, genre, style;
	private Date regdate;
	private String aname;
}
 