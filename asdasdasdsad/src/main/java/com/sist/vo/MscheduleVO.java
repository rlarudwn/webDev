package com.sist.vo;
import java.util.*;

import lombok.Data;

@Data
public class MscheduleVO {
 private int msno, mno, tno, tdno;
 private String mstime, tdname, msday;
 private Date msdate;
 private MovieVO mvo= new MovieVO();
 private TheaterVO tvo=new TheaterVO();
 private TheaterDetailVO tdvo = new TheaterDetailVO();
}
