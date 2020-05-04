-- 후기 더미데이터
SELECT * FROM REVIEW ORDER BY rGROUP DESC, rSTEP, rINDENT;
------------------------------------------------
-------             test                 -------
------------------------------------------------
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST01.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 1, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test'), '111', '체험후기 답변 내용', 1, 1, 1, 1, 'test');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=1 AND rSTEP > 0 AND actID=1;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 1, 1, 1, 1, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 1, 2, 2, 1, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST02.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 2, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test'), '111', '체험후기 답변 내용', 5, 1, 1, 2, 'test');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=5 AND rSTEP > 0 AND actID=2;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 5, 1, 1, 2, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 5, 2, 2, 2, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST03.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 3, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test'), '111', '체험후기 답변 내용', 9, 1, 1, 3, 'test');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=9 AND rSTEP > 0 AND actID=3;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 9, 1, 1, 3, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 9, 2, 2, 3, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST04.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 4, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test'), '111', '체험후기 답변 내용', 13, 1, 1, 4, 'test');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=13 AND rSTEP > 0 AND actID=4;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 13, 1, 1, 4, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 13, 2, 2, 4, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST05.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 5, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test'), '111', '체험후기 답변 내용', 17, 1, 1, 5, 'test');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=17 AND rSTEP > 0 AND actID=5;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 17, 1, 1, 5, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 17, 2, 2, 5, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST06.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 6, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test'), '111', '체험후기 답변 내용', 21, 1, 1, 6, 'test');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=21 AND rSTEP > 0 AND actID=6;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 21, 1, 1, 6, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 21, 2, 2, 6, 'test');
------------------------------------------------
-------             test2                -------
------------------------------------------------
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST07.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 7, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test2'), '111', '체험후기 답변 내용', 25, 1, 1, 7, 'test2');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=25 AND rSTEP > 0 AND actID=7;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 25, 1, 1, 7, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 25, 2, 2, 7, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST08.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 8, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test2'), '111', '체험후기 답변 내용', 29, 1, 1, 8, 'test2');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=29 AND rSTEP > 0 AND actID=8;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 29, 1, 1, 8, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 29, 2, 2, 8, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST09.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 9, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test2'), '111', '체험후기 답변 내용', 33, 1, 1, 9, 'test2');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=33 AND rSTEP > 0 AND actID=9;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 33, 1, 1, 9, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 33, 2, 2, 9, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST10.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 10, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test2'), '111', '체험후기 답변 내용', 37, 1, 1, 10, 'test2');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=37 AND rSTEP > 0 AND actID=10;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 37, 1, 1, 10, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 37, 2, 2, 10, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST11.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 11, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test2'), '111', '체험후기 답변 내용', 41, 1, 1, 11, 'test2');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=41 AND rSTEP > 0 AND actID=11;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 41, 1, 1, 11, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 41, 2, 2, 11, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST12.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 12, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test2'), '111', '체험후기 답변 내용', 45, 1, 1, 12, 'test2');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=45 AND rSTEP > 0 AND actID=12;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 45, 1, 1, 12, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 45, 2, 2, 12, 'test');
------------------------------------------------
-------             test3                -------
------------------------------------------------
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST13.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 13, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test3'), '111', '체험후기 답변 내용', 49, 1, 1, 13, 'test3');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=49 AND rSTEP > 0 AND actID=13;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 49, 1, 1, 13, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 49, 2, 2, 13, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST14.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 14, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test3'), '111', '체험후기 답변 내용', 53, 1, 1, 14, 'test3');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=53 AND rSTEP > 0 AND actID=14;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 53, 1, 1, 14, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 53, 2, 2, 14, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST16.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 15, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test3'), '111', '체험후기 답변 내용', 57, 1, 1, 15, 'test3');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=57 AND rSTEP > 0 AND actID=15;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 57, 1, 1, 15, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 57, 2, 2, 15, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST17.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 16, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test3'), '111', '체험후기 답변 내용', 61, 1, 1, 16, 'test3');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=61 AND rSTEP > 0 AND actID=16;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 61, 1, 1, 16, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 61, 2, 2, 16, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST18.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 17, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test3'), '111', '체험후기 답변 내용', 65, 1, 1, 17, 'test3');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=65 AND rSTEP > 0 AND actID=17;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 65, 1, 1, 17, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 65, 2, 2, 17, 'test');
-- 작성(멤버), 답변(호스트), 원글의 답변(다른멤버), 호스트답변의 답변(멤버)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID, rCHECK)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 내용', 'TEST19.jpg', REVIEW_SQ.CURRVAL, 0, 0, 4, 18, 'test', 1);
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT hNAME FROM HOST WHERE hID='test3'), '111', '체험후기 답변 내용', 69, 1, 1, 18, 'test3');
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=69 AND rSTEP > 0 AND actID=18;
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기의답변', (SELECT mNAME FROM MEMBER WHERE mID='test2'), '111', '체험후기 답변 내용', 69, 1, 1, 18, 'test');
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '체험후기답변의답변', (SELECT mNAME FROM MEMBER WHERE mID='test'), '111', '체험후기 답변의 답변 내용', 69, 2, 2, 18, 'test');
------------------------------------------------
-------             test4                -------
------------------------------------------------
SELECT * FROM
    		(SELECT ROWNUM RN, A.* FROM
    		(SELECT * FROM ACTIVITY ORDER BY actID DESC) A)
    		WHERE hID='test' AND RN BETWEEN 1 AND 6;
SELECT * FROM
    		(SELECT ROWNUM RN, A.* FROM
    		(SELECT * FROM ACTIVITY where hId='test' ORDER BY actID DESC) A)
    		WHERE rn between 1 and 6;
select * from orders;
delete orders;
delete a
commit;
select * from activity_reserve;
select * from activity where hid='test';
select*from host;
commit;