package com.vo;

/**
 * @author 정병건
 *
 */
public class Fixst_Info {
	
	private String f_SEQ;  //VARCHAR2(15)  NOT NULL, -- 분류번호
	private String f_NM;   //VARCHAR2(100) NULL,     -- 비품명
	private String f_KIND; //VARCHAR2(5)   NULL,     -- 품종
	private String f_UNIT; //VARCHAR2(5)   NULL,     -- 단위
	private String f_YEAR; //VARCHAR2(10)  NULL      -- 내용연수
	public String getF_SEQ() {
		return f_SEQ;
	}
	public void setF_SEQ(String f_SEQ) {
		this.f_SEQ = f_SEQ;
	}
	public String getF_NM() {
		return f_NM;
	}
	public void setF_NM(String f_NM) {
		this.f_NM = f_NM;
	}
	public String getF_KIND() {
		return f_KIND;
	}
	public void setF_KIND(String f_KIND) {
		this.f_KIND = f_KIND;
	}
	public String getF_UNIT() {
		return f_UNIT;
	}
	public void setF_UNIT(String f_UNIT) {
		this.f_UNIT = f_UNIT;
	}
	public String getF_YEAR() {
		return f_YEAR;
	}
	public void setF_YEAR(String f_YEAR) {
		this.f_YEAR = f_YEAR;
	}
	@Override
	public String toString() {
		return "Fixst_Info [f_SEQ=" + f_SEQ + ", f_NM=" + f_NM + ", f_KIND=" + f_KIND + ", f_UNIT=" + f_UNIT + ", f_YEAR="
				+ f_YEAR + "]";
	}
		
	
}
