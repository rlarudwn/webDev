package com.sist.vo;
import java.util.*;

import lombok.Data;
/*
 *  CNO     NOT NULL NUMBER         
	TNO     NOT NULL NUMBER         
	PRICE   NOT NULL VARCHAR2(50)   
	ID      NOT NULL VARCHAR2(1000) 
	COUNT   NOT NULL NUMBER         
	BUYDATE          DATE           
	TYPE             NUMBER         
 */
@Data
public class CartVO {
  private int cno,tno,count,type;
  private String price,id,regdate;
  private Date buydate;
}
