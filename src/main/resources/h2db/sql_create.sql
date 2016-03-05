CREATE SEQUENCE EMP_NUM_SEQ
  START WITH 1
  MAXVALUE 999
  MINVALUE 0
  NOCYCLE
  CACHE 20;

  CREATE SEQUENCE F_NUM_SEQ
  START WITH 1
  MAXVALUE 999
  MINVALUE 0
  NOCYCLE
  CACHE 20;
  
   CREATE SEQUENCE FJSEQ
  START WITH 1
  MAXVALUE 9999
  MINVALUE 0
  NOCYCLE
  CACHE 20;
 
   
-- 공통코드
CREATE TABLE BASE_CD (
	CD_TP   VARCHAR2(20)  NOT NULL, -- 코드구분
	CD_V    VARCHAR2(5)   NOT NULL, -- 코드
	CD_NM   VARCHAR2(100) NULL,     -- 코드명
	CD_SORT NUMBER        NULL,     -- 정렬
	CD_USE  VARCHAR2(1)   NULL      -- 사용구분
);

-- 공통코드 기본키
CREATE UNIQUE INDEX PK_BASE_CD
	ON BASE_CD ( -- 공통코드
		CD_TP ASC, -- 코드구분
		CD_V  ASC  -- 코드
	);

-- 공통코드
ALTER TABLE BASE_CD
	ADD
		CONSTRAINT PK_BASE_CD -- 공통코드 기본키
		PRIMARY KEY (
			CD_TP, -- 코드구분
			CD_V   -- 코드
		);

-- 비품분류번호관리
CREATE TABLE FIX_TP (
	F_SEQ  VARCHAR2(15)  NOT NULL, -- 분류번호
	F_NM   VARCHAR2(100) NULL,     -- 비품명
	F_KIND VARCHAR2(5)   NULL,     -- 품종
	F_UNIT VARCHAR2(5)   NULL,     -- 단위
	F_YEAR VARCHAR2(10)  NULL      -- 내용연수
);

-- 비품분류번호관리 기본키
CREATE UNIQUE INDEX PK_FIX_TP
	ON FIX_TP ( -- 비품분류번호관리
		F_SEQ ASC -- 분류번호
	);

-- 비품분류번호관리
ALTER TABLE FIX_TP
	ADD
		CONSTRAINT PK_FIX_TP -- 비품분류번호관리 기본키
		PRIMARY KEY (
			F_SEQ -- 분류번호
		);

-- 비품재고관리
CREATE TABLE FIX_ST (
	FJ_SEQ      NUMBER        NOT NULL, -- 등록번호
	F_SEQ       VARCHAR2(15)  NOT NULL, -- 분류번호
	FJ_GET_DT   VARCHAR2(10)  NULL,     -- 취득일자
	FJ_PUT_DT   VARCHAR2(10)  NULL,     -- 정리일자
	FJ_MD_NO    VARCHAR2(20)  NULL,     -- 모델번호
	FJ_MK_NO    VARCHAR2(20)  NULL,     -- 제조번호
	FJ_SIZE     VARCHAR2(20)  NULL,     -- 규격
	FJ_MK_COM   VARCHAR2(50)  NULL,     -- 제작회사
	FJ_BUY_ITEM VARCHAR2(5)   NULL,     -- 구입과목
	FJ_USE      VARCHAR2(5)   NULL,     -- 용도
	FJ_CNT      NUMBER        NULL,     -- 수량
	FJ_UNIT_AMT NUMBER        NULL,     -- 단가
	FJ_TOT_AMT  NUMBER        NULL,     -- 금액
	FJ_SEQ_ST   NUMBER        NULL,     -- 일련번호_시작
	FJ_SEQ_ED   NUMBER        NULL,     -- 일련번호_끝
	REMARK      VARCHAR2(100) NULL,     -- 비고
	INSERT_DT   VARCHAR2(20)  NULL,     -- 등록일자
	INSERT_EMP  VARCHAR2(10)  NULL,     -- 등록자
	MODIFY_DT   VARCHAR2(20)  NULL,     -- 수정일자
	MODIFY_EMP  VARCHAR2(10)  NULL      -- 수정자
);

-- 비품재고관리 기본키
CREATE UNIQUE INDEX PK_FIX_ST
	ON FIX_ST ( -- 비품재고관리
		FJ_SEQ ASC, -- 등록번호
		F_SEQ  ASC  -- 분류번호
	);

-- 비품재고관리
ALTER TABLE FIX_ST
	ADD
		CONSTRAINT PK_FIX_ST -- 비품재고관리 기본키
		PRIMARY KEY (
			FJ_SEQ, -- 등록번호
			F_SEQ   -- 분류번호
		);

-- 비품변동관리
CREATE TABLE FIX_MV (
	FB_DEPT    VARCHAR2(5)   NOT NULL, -- 부서정보
	FJ_SEQ     NUMBER        NOT NULL, -- 등록번호
	F_SEQ      VARCHAR2(15)  NOT NULL, -- 분류번호
	E_NO       VARCHAR2(7)   NULL,     -- 사원번호
	FB_PUT_DT  VARCHAR2(10)  NULL,     -- 정리일자
	FB_LOC_1   VARCHAR2(5)   NULL,     -- 비치건물
	FB_LOC_2   VARCHAR2(20)  NULL,     -- 비치실명
	FB_LOC_3   VARCHAR2(20)  NULL,     -- 비치호실
	FB_LOC_4   VARCHAR2(50)  NULL,     -- 부속기타
	FB_CNT     NUMBER        NULL,     -- 총수량
	FB_RP_CNT  NUMBER        NULL,     -- 처분수량
	FB_RT_CNT  NUMBER        NULL,     -- 반납수량
	FB_MV_CNT  NUMBER        NULL,     -- 이동수량
	FB_SEQ_ST  NUMBER        NULL,     -- 일련번호_시작
	FB_SEQ_ED  NUMBER        NULL,     -- 일련번호_끝 
	REMARK     VARCHAR2(100) NULL,     -- 비고
	INSERT_DT  VARCHAR2(20)  NULL,     -- 등록일자
	INSERT_EMP VARCHAR2(10)  NULL,     -- 등록자
	MODIFY_DT  VARCHAR2(20)  NULL,     -- 수정일자
	MODIFY_EMP VARCHAR2(10)  NULL      -- 수정자
);

-- 비품변동관리 기본키
CREATE UNIQUE INDEX PK_FIX_MV
	ON FIX_MV ( -- 비품변동관리
		FB_DEPT ASC, -- 부서정보
		FJ_SEQ ASC, -- 등록번호
		F_SEQ  ASC  -- 분류번호
	);

-- 비품변동관리
ALTER TABLE FIX_MV
	ADD
		CONSTRAINT PK_FIX_MV -- 비품변동관리 기본키
		PRIMARY KEY (
			FB_DEPT, -- 부서정보
			FJ_SEQ, -- 등록번호
			F_SEQ   -- 분류번호
		);

-- 사원정보
CREATE TABLE EMP (
	E_NO     VARCHAR2(7)  NOT NULL, -- 사원번호
	E_NM     VARCHAR2(20) NULL,     -- 사원명
	E_ID     VARCHAR2(10) NULL,     -- 아이디
	E_PW     VARCHAR2(20) NOT NULL, -- 비밀번호
	E_DEPT   VARCHAR2(5)  NULL,     -- 부서
	E_POSI   VARCHAR2(5)  NULL,     -- 직책
	E_IN_DT  VARCHAR2(8)  NULL,     -- 입사일
	E_OUT_DT VARCHAR2(8)  NULL      -- 퇴사일
);

-- 사원정보 기본키
CREATE UNIQUE INDEX PK_EMP
	ON EMP ( -- 사원정보
		E_NO ASC -- 사원번호
	);

-- 사원정보
ALTER TABLE EMP
	ADD
		CONSTRAINT PK_EMP -- 사원정보 기본키
		PRIMARY KEY (
			E_NO -- 사원번호
		);

-- 비품재고관리
ALTER TABLE FIX_ST
	ADD
		CONSTRAINT FK_FIX_TP_TO_FIX_ST -- 비품분류번호관리 -> 비품재고관리
		FOREIGN KEY (
			F_SEQ -- 분류번호
		)
		REFERENCES FIX_TP ( -- 비품분류번호관리
			F_SEQ -- 분류번호
		);

-- 비품변동관리
ALTER TABLE FIX_MV
	ADD
		CONSTRAINT FK_FIX_ST_TO_FIX_MV -- 비품재고관리 -> 비품변동관리
		FOREIGN KEY (
			FJ_SEQ, -- 등록번호
			F_SEQ   -- 분류번호
		)
		REFERENCES FIX_ST ( -- 비품재고관리
			FJ_SEQ, -- 등록번호
			F_SEQ   -- 분류번호
		);

-- 비품변동관리
ALTER TABLE FIX_MV
	ADD
		CONSTRAINT FK_EMP_TO_FIX_MV -- 사원정보 -> 비품변동관리
		FOREIGN KEY (
			E_NO -- 사원번호
		)
		REFERENCES EMP ( -- 사원정보
			E_NO -- 사원번호
		);