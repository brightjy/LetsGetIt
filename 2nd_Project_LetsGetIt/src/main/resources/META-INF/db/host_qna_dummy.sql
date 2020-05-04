---------- MEMBER ----------------------
SELECT*FROM MEMBER;
INSERT INTO MEMBER VALUES('test1', 'test', 'test', 'test', 'test', 'test', 'test', SYSDATE, SYSDATE, null);
---------- HOST ----------------------
-- 회원가입 id : hostJoin
select * from host;
INSERT INTO HOST (hID, hPW, hNAME, hPHONE, hEMAIL, hBANK, hIMG, hPOST, hADDRESS)
    VALUES ('test'||HOST_JOIN_SQ.NEXTVAL, 'test', 'test', '010-1111-1111', 'test@test.com', '2001-346-644316 우리', 'sehoon.jpg', '02215', '서울시');
INSERT INTO HOST (hID, hPW, hNAME, hPHONE, hEMAIL, hBANK, hIMG, hPOST, hADDRESS)
    VALUES ('test'||HOST_JOIN_SQ.NEXTVAL, 'test', 'test', '010-1111-1111', 'test@test.com', '2001-346-644316 우리', 'sehoon.jpg', '02215', '서울시');
INSERT INTO HOST (hID, hPW, hNAME, hPHONE, hEMAIL, hBANK, hIMG, hPOST, hADDRESS)
    VALUES ('test'||HOST_JOIN_SQ.NEXTVAL, 'test', 'test', '010-1111-1111', 'test@test.com', '2001-346-644316 우리', 'sehoon.jpg', '02215', '서울시');
INSERT INTO HOST (hID, hPW, hNAME, hPHONE, hEMAIL, hBANK, hIMG, hPOST, hADDRESS)
    VALUES ('test'||HOST_JOIN_SQ.NEXTVAL, 'test', 'test', '010-1111-1111', 'test@test.com', '2001-346-644316 우리', 'sehoon.jpg', '02215', '서울시');
INSERT INTO HOST (hID, hPW, hNAME, hPHONE, hEMAIL, hBANK, hIMG, hPOST, hADDRESS)
    VALUES ('test'||HOST_JOIN_SQ.NEXTVAL, 'test', 'test', '010-1111-1111', 'test@test.com', '2001-346-644316 우리', 'sehoon.jpg', '02215', '서울시');
INSERT INTO HOST (hID, hPW, hNAME, hPHONE, hEMAIL, hBANK, hIMG, hPOST, hADDRESS)
    VALUES ('test'||HOST_JOIN_SQ.NEXTVAL, 'test', 'test', '010-1111-1111', 'test@test.com', '2001-346-644316 우리', 'sehoon.jpg', '02215', '서울시');
COMMIT;

---              Q&A 관련(관리자)      ---
-- Q&A 작성 id : adminQnaWrite
INSERT INTO ADMIN_QNA (qID, qTITLE, qWRITER, qPW, qCONTENT, qFILE, qGROUP, qSTEP, qINDENT, qIP)
    VALUES (ADMIN_QNA_SEQ.NEXTVAL, '제목', '작성자', '비밀번호', '내용', '첨부파일.JPG', ADMIN_QNA_SEQ.CURRVAL, 0, 0, '111.111.11.11');
INSERT INTO ADMIN_QNA (qID, qTITLE, qWRITER, qPW, qCONTENT, qFILE, qGROUP, qSTEP, qINDENT, qIP)
    VALUES (ADMIN_QNA_SEQ.NEXTVAL, '제목', '작성자', '비밀번호', '내용', '첨부파일.JPG', ADMIN_QNA_SEQ.CURRVAL, 0, 0, '111.111.11.11');
INSERT INTO ADMIN_QNA (qID, qTITLE, qWRITER, qPW, qCONTENT, qFILE, qGROUP, qSTEP, qINDENT, qIP)
    VALUES (ADMIN_QNA_SEQ.NEXTVAL, '제목', '작성자', '비밀번호', '내용', '첨부파일.JPG', ADMIN_QNA_SEQ.CURRVAL, 0, 0, '111.111.11.11');
INSERT INTO ADMIN_QNA (qID, qTITLE, qWRITER, qPW, qCONTENT, qFILE, qGROUP, qSTEP, qINDENT, qIP)
    VALUES (ADMIN_QNA_SEQ.NEXTVAL, '제목', '작성자', '비밀번호', '내용', '첨부파일.JPG', ADMIN_QNA_SEQ.CURRVAL, 0, 0, '111.111.11.11');
INSERT INTO ADMIN_QNA (qID, qTITLE, qWRITER, qPW, qCONTENT, qFILE, qGROUP, qSTEP, qINDENT, qIP)
    VALUES (ADMIN_QNA_SEQ.NEXTVAL, '제목', '작성자', '비밀번호', '내용', '첨부파일.JPG', ADMIN_QNA_SEQ.CURRVAL, 0, 0, '111.111.11.11');
INSERT INTO ADMIN_QNA (qID, qTITLE, qWRITER, qPW, qCONTENT, qFILE, qGROUP, qSTEP, qINDENT, qIP)
    VALUES (ADMIN_QNA_SEQ.NEXTVAL, '제목', '작성자', '비밀번호', '내용', '첨부파일.JPG', ADMIN_QNA_SEQ.CURRVAL, 0, 0, '111.111.11.11');
INSERT INTO ADMIN_QNA (qID, qTITLE, qWRITER, qPW, qCONTENT, qFILE, qGROUP, qSTEP, qINDENT, qIP)
    VALUES (ADMIN_QNA_SEQ.NEXTVAL, '제목', '작성자', '비밀번호', '내용', '첨부파일.JPG', ADMIN_QNA_SEQ.CURRVAL, 0, 0, '111.111.11.11');
COMMIT;
