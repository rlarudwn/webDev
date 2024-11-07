package com.sist.vo;
/*
ANO                NUMBER         
ANAME     NOT NULL VARCHAR2(1000) 
POSTER             VARCHAR2(2000) 
TYPE               VARCHAR2(300)  
DEBUTYEAR          VARCHAR2(300)  
DEBUTSONG          VARCHAR2(300)  
ACTIVE             VARCHAR2(1000) 
NATION             VARCHAR2(1000) 
CONTENT            CLOB           
LIKECOUNT          NUMBER   
*/

import lombok.Data;

@Data

public class ArtistVO {
	private int ano, likecount;
	private String aname, poster, type, debutyear, debutsong, active, nation, content;
}
 