package com.sist.vo;

import lombok.Data;

@Data
public class TheaterVO {
	private int tno;
	private String tname, tloc;
	private MscheduleVO msvo=new MscheduleVO();
}
