package com.sist.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeBoardVO {
	private int no,type,hit;
	private String name,subeject,content,nbphoto;
	private Date date;
}
