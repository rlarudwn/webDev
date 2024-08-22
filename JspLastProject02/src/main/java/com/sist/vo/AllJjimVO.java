package com.sist.vo;

import java.util.Date;

import lombok.Data;
@Data
public class AllJjimVO {
	private int jno, cno, type;
	private String id, dbday;
	private Date regdate;
	private FoodVO fvo=new FoodVO();
}
