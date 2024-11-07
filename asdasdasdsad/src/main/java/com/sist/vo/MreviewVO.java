package com.sist.vo;

import java.util.*;

import lombok.Data;
/*
 * MRNO	NUMBER	No
MCNO	NUMBER	Yes
MRATING	NUMBER(2,1)	No
ID	VARCHAR2(200 BYTE)	No
MRCONTENT	CLOB	No
MREDATE	DATE	No
MRRECOM	NUMBER	Yes
Nickname varchar2
 * 
 */
@Data
public class MreviewVO {
	 private int trno, tno, trating, type;
	  private String id,nickname,tcontent,regdate,dbday;
	  private Date tdate;
}
