package com.sist.vo;
/*
 * TRNO     NOT NULL NUMBER         
TNO               NUMBER         
TRATING           NUMBER(2,1)    
ID                VARCHAR2(4000) 
NICKNAME          VARCHAR2(4000) 
TCONTENT          CLOB           
TDATE             DATE           
TYPE              NUMBER         
 */
import java.util.*;

import lombok.Data;
@Data
public class ReviewVO {
  private int trno, tno, trating, type;
  private String id,nickname,tcontent,regdate,dbday;
  private Date tdate;
}
