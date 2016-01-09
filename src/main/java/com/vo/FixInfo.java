package com.vo;

/**
 * @author 정병건
 *
 */
public class FixInfo {
	
	private String F_SEQ;  //VARCHAR2(15)  NOT NULL, -- 분류번호
	private String F_NM;   //VARCHAR2(100) NULL,     -- 비품명
	private String F_KIND; //VARCHAR2(5)   NULL,     -- 품종
	private String F_UNIT; //VARCHAR2(5)   NULL,     -- 단위
	private String F_YEAR; //VARCHAR2(10)  NULL      -- 내용연수
	
	public String getF_SEQ() {
		return F_SEQ;
	}
	public void setF_SEQ(String f_SEQ) {
		F_SEQ = f_SEQ;
	}
	public String getF_NM() {
		return F_NM;
	}
	public void setF_NM(String f_NM) {
		F_NM = f_NM;
	}
	public String getF_KIND() {
		return F_KIND;
	}
	public void setF_KIND(String f_KIND) {
		F_KIND = f_KIND;
	}
	public String getF_UNIT() {
		return F_UNIT;
	}
	public void setF_UNIT(String f_UNIT) {
		F_UNIT = f_UNIT;
	}
	public String getF_YEAR() {
		return F_YEAR;
	}
	public void setF_YEAR(String f_YEAR) {
		F_YEAR = f_YEAR;
	}
	@Override
	public String toString() {
		return "FixInfo [F_SEQ=" + F_SEQ + ", F_NM=" + F_NM + ", F_KIND=" + F_KIND + ", F_UNIT=" + F_UNIT + ", F_YEAR="
				+ F_YEAR + "]";
	}
	
	
	
	
}
