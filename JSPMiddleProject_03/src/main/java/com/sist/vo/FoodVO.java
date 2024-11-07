package com.sist.vo;

import lombok.Data;

@Data

public class FoodVO {
	private int fno, hit, likecount;
	private String name, poster, type, phone, addr, theme, content;
	private double score;
}
