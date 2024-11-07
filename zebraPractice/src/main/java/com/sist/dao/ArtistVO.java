package com.sist.dao;

import lombok.Data;

/*
ANO       NOT NULL NUMBER         
NAME      NOT NULL VARCHAR2(1000) 
POSTER             VARCHAR2(2000) 
TYPE               VARCHAR2(300)  
DEBUTYEAR          VARCHAR2(300)  
DEBUTSONG          VARCHAR2(300)  
ACTIVE             VARCHAR2(1000) 
NATION             VARCHAR2(1000)
CONTETN 					 CLOB 
LIKECOUNT          NUMBER  
 */
@Data

public class ArtistVO {
	private int ano, likecount;
	private String name, poster, type, deutyear, debutsong, active, nation, content;
}
