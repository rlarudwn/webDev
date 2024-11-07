package com.sist.vo;

import lombok.Data;

@Data
public class MovieBookVO {
		private int mbno, mno, bno;
		private String btitle, cover, sale_price;
		private MovieVO mvo= new MovieVO();
		private BookVO bvo= new BookVO();
}
