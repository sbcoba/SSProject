package com.vo;

public class FixMvInfo {

	private String fbDept;
	private String fjSeq;
	private String fSeq;
	private String eNo;
	private String eNm;
	private String fbPutDt;
	private String fbLoc1;
	private String fbLoc2;
	private String fbLoc3;
	private String fbLoc4;
	private int    fbCnt;
	private int    fbRpCnt;
	private int    fbRtCnt;
	private int    fbMvCnt;
	private int    fbSeqSt;
	private int    fbSeqEd;
	private String remark;
	private String insertDt;
	private String insertEmp;
	private String modifyDt;
	private String modifyEmp;
	
	public String getFbDept() {
		return fbDept;
	}
	public void setFbDept(String fbDept) {
		this.fbDept = fbDept;
	}
	public String getFjSeq() {
		return fjSeq;
	}
	public void setFjSeq(String fjSeq) {
		this.fjSeq = fjSeq;
	}
	public String getfSeq() {
		return fSeq;
	}
	public void setfSeq(String fSeq) {
		this.fSeq = fSeq;
	}
	public String geteNo() {
		return eNo;
	}
	public void seteNo(String eNo) {
		this.eNo = eNo;
	}
	public String geteNm() {
		return eNm;
	}
	public void seteNm(String eNm) {
		this.eNm = eNm;
	}
	public String getFbPutDt() {
		return fbPutDt;
	}
	public void setFbPutDt(String fbPutDt) {
		this.fbPutDt = fbPutDt;
	}
	public String getFbLoc1() {
		return fbLoc1;
	}
	public void setFbLoc1(String fbLoc1) {
		this.fbLoc1 = fbLoc1;
	}
	public String getFbLoc2() {
		return fbLoc2;
	}
	public void setFbLoc2(String fbLoc2) {
		this.fbLoc2 = fbLoc2;
	}
	public String getFbLoc3() {
		return fbLoc3;
	}
	public void setFbLoc3(String fbLoc3) {
		this.fbLoc3 = fbLoc3;
	}
	public String getFbLoc4() {
		return fbLoc4;
	}
	public void setFbLoc4(String fbLoc4) {
		this.fbLoc4 = fbLoc4;
	}
	public int getFbCnt() {
		return fbCnt;
	}
	public void setFbCnt(int fbCnt) {
		this.fbCnt = fbCnt;
	}
	public int getFbRpCnt() {
		return fbRpCnt;
	}
	public void setFbRpCnt(int fbRpCnt) {
		this.fbRpCnt = fbRpCnt;
	}
	public int getFbRtCnt() {
		return fbRtCnt;
	}
	public void setFbRtCnt(int fbRtCnt) {
		this.fbRtCnt = fbRtCnt;
	}
	public int getFbMvCnt() {
		return fbMvCnt;
	}
	public void setFbMvCnt(int fbMvCnt) {
		this.fbMvCnt = fbMvCnt;
	}
	public int getFbSeqSt() {
		return fbSeqSt;
	}
	public void setFbSeqSt(int fbSeqSt) {
		this.fbSeqSt = fbSeqSt;
	}
	public int getFbSeqEd() {
		return fbSeqEd;
	}
	public void setFbSeqEd(int fbSeqEd) {
		this.fbSeqEd = fbSeqEd;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getInsertDt() {
		return insertDt;
	}
	public void setInsertDt(String insertDt) {
		this.insertDt = insertDt;
	}
	public String getInsertEmp() {
		return insertEmp;
	}
	public void setInsertEmp(String insertEmp) {
		this.insertEmp = insertEmp;
	}
	public String getModifyDt() {
		return modifyDt;
	}
	public void setModifyDt(String modifyDt) {
		this.modifyDt = modifyDt;
	}
	public String getModifyEmp() {
		return modifyEmp;
	}
	public void setModifyEmp(String modifyEmp) {
		this.modifyEmp = modifyEmp;
	}
	
	public String toString(){
		return fbRpCnt + "/" + fbRtCnt + "/" + fbMvCnt;
		
	}
	
	
}
