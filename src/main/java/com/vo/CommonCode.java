package com.vo;

public class CommonCode {

    private String cdTp;    /* 코드구분 */
    private String cdV;     /* 코드 */
    private String cdNm;    /* 코드명 */
    private long cdSort;    /* 정렬 */
    private String cdUse;   /* 사용구분 */

    public String getCdTp() {
        return cdTp;
    }

    public void setCdTp(String cdTp) {
        this.cdTp = cdTp;
    }

    public String getCdV() {
        return cdV;
    }

    public void setCdV(String cdV) {
        this.cdV = cdV;
    }

    public String getCdNm() {
        return cdNm;
    }

    public void setCdNm(String cdNm) {
        this.cdNm = cdNm;
    }

    public long getCdSort() {
        return cdSort;
    }

    public void setCdSort(long cdSort) {
        this.cdSort = cdSort;
    }

    public String getCdUse() {
        return cdUse;
    }

    public void setCdUse(String cdUse) {
        this.cdUse = cdUse;
    }
}
