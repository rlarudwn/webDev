package com.sist.dao;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	 private int no;
   private int bno;
   private int depth;
   private int root;
   private String id;
   private String name;
   private String content;
   private String dbday;
   private Date regdate;
}
