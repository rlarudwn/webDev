package com.sist.dao;

import lombok.Data;

@Data

public class CartVO {
	private int no, sno, account;
	private String id, dbDay;
	private ShoesVO svo=new ShoesVO();
}
