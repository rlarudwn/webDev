package com.sist.vo;
/*
MNO        NOT NULL NUMBER         
TITLE      NOT NULL VARCHAR2(1000) 
ALNO       NOT NULL NUMBER         
ANO        NOT NULL NUMBER         
LYLICS              CLOB           
POSTER              VARCHAR2(3000) 
GENRE               VARCHAR2(100)  
STYLE               VARCHAR2(100)  
PLAYTIME            VARCHAR2(300)  
LYLICIST            VARCHAR2(1000) 
COMPOSER            VARCHAR2(1000) 
ARRANGER            VARCHAR2(1000) 
URLMP4              VARCHAR2(3000) 
PRICE      NOT NULL VARCHAR2(1000) 
URLMP3              VARCHAR2(3000) 
LIKECOUNT           NUMBER         
PLAYCOUNT           NUMBER         
TITLECHECK          NUMBER    
 */

import lombok.Data;

@Data

public class MusicVO {
	private int mno, alno, ano, likecount, playcount, titlecheck;
	private String title, lylics, poster, genre, style, playtime, lylicist, composer, arranger, urlmp4, price, urlmp3;
	private int[] lylicistAll, composerAll, arrangerAll;
	private String altitle, aname;
}
