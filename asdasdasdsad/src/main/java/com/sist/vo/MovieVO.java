package com.sist.vo;
/*
 * MNO	NUMBER(38,0)
MTITLE	VARCHAR2(2000 BYTE)
MGENRE	VARCHAR2(2000 BYTE)
MPOSTER	VARCHAR2(2000 BYTE)
MTIME	VARCHAR2(2000 BYTE)
MDIRECTOR	VARCHAR2(2000 BYTE)
MACTOR	VARCHAR2(2000 BYTE)
MGRADE	VARCHAR2(2000 BYTE)
MRDATE	DATE
MCOUNT	NUMBER(38,0)
MSYNOP	CLOB
MRATE	NUMBER(38,1)
MTYPE	NUMBER(38,0)
MSTATE	NUMBER(38,0)
 */
import java.util.*;

import lombok.Data;

@Data
public class MovieVO {
		private int mno, mcount, mtype, mstate, num, likecount;
		private String mtitle, mgenre, mposter, mtime, mdirector, mactor, mgrade, msynop, mrday, mnation;
		private Date mrdate;
		private double mrate;
}
