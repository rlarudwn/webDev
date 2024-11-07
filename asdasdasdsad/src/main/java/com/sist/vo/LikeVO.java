package com.sist.vo;
/*
LNO	NUMBER
ID	VARCHAR2(1000 BYTE)
TNO	NUMBER
TYPE	NUMBER
 */
public class LikeVO {
	private int lno,tno,type;
	private String id;
	private MusicVO mulikevo = new MusicVO();
	private ArtistVO artlikevo = new ArtistVO();
	private MovieVO molikevo = new MovieVO();
	private BookVO bolikevo = new BookVO();
	private MemberVO memvo = new MemberVO();
	
	public MemberVO getMemvo() {
		return memvo;
	}
	public void setMemvo(MemberVO memvo) {
		this.memvo = memvo;
	}
	public MovieVO getMolikevo() {
		return molikevo;
	}
	public void setMolikevo(MovieVO molikevo) {
		this.molikevo = molikevo;
	}
	public BookVO getBolikevo() {
		return bolikevo;
	}
	public void setBolikevo(BookVO bolikevo) {
		this.bolikevo = bolikevo;
	}
	public ArtistVO getArtlikevo() {
		return artlikevo;
	}
	public void setArtlikevo(ArtistVO artlikevo) {
		this.artlikevo = artlikevo;
	}
	public MusicVO getMulikevo() {
		return mulikevo;
	}
	public void setMulikevo(MusicVO mulikevo) {
		this.mulikevo = mulikevo;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}