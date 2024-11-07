package com.sist.vo;

import java.util.Date;

import lombok.Data;

/*
ANO	NUMBER
APHOTO	VARCHAR2(2000 BYTE)
ANAME	VARCHAR2(2000 BYTE)
AARTIST	VARCHAR2(2000 BYTE)
ARDATE	DATE
ARATING	NUMBER
APRICE	VARCHAR2(2000 BYTE)
ADIS	VARCHAR2(2000 BYTE)
ADISPRICE	VARCHAR2(2000 BYTE)
AIMG	VARCHAR2(4000 BYTE)
AINTRO	CLOB
ADETAIL	CLOB
 */
@Data
public class AlStoreVO {
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getArating() {
		return arating;
	}
	public void setArating(int arating) {
		this.arating = arating;
	}
	public String getAphoto() {
		return aphoto;
	}
	public void setAphoto(String aphoto) {
		this.aphoto = aphoto;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAartist() {
		return aartist;
	}
	public void setAartist(String aartist) {
		this.aartist = aartist;
	}
	public String getAprice() {
		return aprice;
	}
	public void setAprice(String aprice) {
		this.aprice = aprice;
	}
	public String getAdis() {
		return adis;
	}
	public void setAdis(String adis) {
		this.adis = adis;
	}
	public String getAdisprice() {
		return adisprice;
	}
	public void setAdisprice(String adisprice) {
		this.adisprice = adisprice;
	}
	public String getAimg() {
		return aimg;
	}
	public void setAimg(String aimg) {
		this.aimg = aimg;
	}
	public String getAintro() {
		return aintro;
	}
	public void setAintro(String aintro) {
		this.aintro = aintro;
	}
	public String getAdetail() {
		return adetail;
	}
	public void setAdetail(String adetail) {
		this.adetail = adetail;
	}
	public String getAldate() {
		return aldate;
	}
	public void setAldate(String aldate) {
		this.aldate = aldate;
	}
	public Date getArdate() {
		return ardate;
	}
	public void setArdate(Date ardate) {
		this.ardate = ardate;
	}
	private int ano,arating;
	private String aphoto,aname,aartist,aprice,adis,adisprice,aimg,aintro,adetail,aldate;
	private Date ardate;
}
