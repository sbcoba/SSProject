/**
 * 부서코드
 */
--부서
INSERT INTO BASE_CD (CD_TP, CD_V, CD_NM, CD_SORT, CD_USE)VALUES('DEPT_CD', '01', '총장실', 1, 'Y');
INSERT INTO BASE_CD (CD_TP, CD_V, CD_NM, CD_SORT, CD_USE)VALUES('DEPT_CD', '02', '비서실', 2, 'Y');
INSERT INTO BASE_CD (CD_TP, CD_V, CD_NM, CD_SORT, CD_USE)VALUES('DEPT_CD', '03', '교무과', 3, 'Y');

--직책
INSERT INTO BASE_CD (CD_TP, CD_V, CD_NM, CD_SORT, CD_USE)VALUES('POSI_CD', '01', '사원', 1, 'Y');
INSERT INTO BASE_CD (CD_TP, CD_V, CD_NM, CD_SORT, CD_USE)VALUES('POSI_CD', '02', '연구원', 2, 'Y');
INSERT INTO BASE_CD (CD_TP, CD_V, CD_NM, CD_SORT, CD_USE)VALUES('POSI_CD', '03', '비서', 3, 'Y');


/**
 * 인사정보
 */
INSERT INTO EMP (E_NO, E_NM, E_ID, E_PW, E_DEPT, E_POSI, E_IN_DT, E_OUT_DT )
VALUES('2015001', '홍길동', '2015001', '1234', '02', '03', '20151226', '');

INSERT INTO EMP (E_NO, E_NM, E_ID, E_PW, E_DEPT, E_POSI, E_IN_DT, E_OUT_DT )
VALUES('2015002', '홍길순', '2015002', '1234', '03', '03', '20151226', '');

INSERT INTO EMP (E_NO, E_NM, E_ID, E_PW, E_DEPT, E_POSI, E_IN_DT, E_OUT_DT )
VALUES('2015003', '홍길자', '2015003', '1234', '01', '01', '20151226', '');

