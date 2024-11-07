package com.sist.dao;

import java.util.Date;

import lombok.Data;

@Data

public class BoardVO {
	private int no;
  private int hit;
  private int likecount;
  private int rownum;
  private String id;
  private String name;
  private String subject;
  private String content;
  private String dbday;
  private String tag;
  private Date regdate;
}
