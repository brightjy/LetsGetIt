----------------------------------------
---              멤버 �??��             ---
INSERT INTO MEMBER VALUES ('test', 'test', '회원', '010-9999-9999', 'the@joeun.com', '03140', '서울특별시 종로구 수표로 105', '1990-01-01', SYSDATE, null);
INSERT INTO MEMBER VALUES ('test2', 'test', '회원2', '010-9999-9999', 'the@joeun.com', '03140', '서울특별시 종로구 수표로 105', '1990-01-01', SYSDATE, null);
----------------------------------------
DROP TABLE MEMBER;
SELECT COUNT(*) FROM MEMBER;
SELECT * FROM MEMBER;
DELETE FROM MEMBER;
UPDATE MEMBER SET mPw = 111 WHERE mId = aaa;
-- ?��?���??�� id : memberJoin
INSERT INTO MEMBER(mID ,mPW,mNAME,mPHONE,mEMAIL,mPOST,mADDRESS,mBIRTH,mRDATE) VALUES ('aaa','111','KIM','010-0000-0000','yyyy@naver.com','POST','ADDRESS','1991-08-30',SYSDATE);
COMMIT;
-- 로그?�� id : memberLogin
SELECT * FROM MEMBER WHERE mID='aaa' AND mPW='111';
-- 비�?번호 찾기 id : memberSearchPw

-- 비�?번호 ?��?���?�? id : memberRandomPw

-- ?���? ?��?�� id : memberModify
UPDATE MEMBER SET mPW='222',mNAME = 'LEE',mPHONE= '010-0000-0000',mEMAIL='hong@naver.com',mPOST = 'POST1', mADDRESS='ADDRESS1', mBIRTH = '1990-03-01',mImg='img'
    WHERE mID='aaa';
-- ?��?�� 리스?�� id : memberList
SELECT * FROM MEMBER ORDER BY MRDATE DESC , MNAME DESC;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM
        (SELECT * FROM MEMBER ORDER BY mRDATE DESC )A)
        WHERE RN BETWEEN 1 AND 10;
-- mid�? dto�??��?���? id = memberGet
SELECT * FROM MEMBER WHERE mID='aaa';
--ID 중복체크 id = idConfirm
SELECT * FROM MEMBER;
SELECT COUNT(*) FROM MEMBER WHERE MID='aaa';
commit;
------------------------------------------------------
---------------  멤버 관심 카테고리 --------------------
select*from activity_category where actcno=8;
select*from like_category lc, activity_category ac where  lc.actcno=ac.actcno and mId='test';
DELETE activity_category WHERE ACTCNO BETWEEN 265 AND 529;
 COMMIT;
------------------------------------------------------

-- 카테고리 전체 가져오기 id:allCateList
SELECT actCNO||',' actCno, actCategory2, actCategory3, actCategory4 FROM ACTIVITY_CATEGORY;

-- 멤버가 좋아한 카테고리를 actCno만 , 넣어 가져오기 id:memberLikeCateWithCommaList
SELECT actCNO||',' actCno FROM LIKE_CATEGORY WHERE mID='test';

-- 멤버가 이미 좋아한 관심 카테고리인지 확인(액티비티 이름으로 확인) id: memberLikeCateCheck
SELECT COUNT(*) FROM LIKE_CATEGORY LC, ACTIVITY_CATEGORY AC WHERE LC.ACTCNO=AC.ACTCNO  AND MID='test' AND ACTCATEGORY4='도자기';

-- 멤버가 관심 카테고리 저ㅋ장ㅋ id : memberLikeActCate
SELECT ACTCNO FROM (SELECT ROWNUM, ACTCNO FROM ACTIVITY_CATEGORY WHERE ACTCATEGORY4='괌' AND ROWNUM=1);
INSERT INTO LIKE_CATEGORY (lcId, mID, actCno) VALUES (LIKE_CATEGORY_SQ.NEXTVAL, 'test', (SELECT ACTCNO FROM (SELECT ROWNUM, ACTCNO FROM ACTIVITY_CATEGORY WHERE ACTCATEGORY4='괌' AND ROWNUM=1))); -- 공예 DIY : 43~50
INSERT INTO LIKE_CATEGORY (lcId, mID, actCno) VALUES (LIKE_CATEGORY_SQ.NEXTVAL, 'test', 43);
INSERT INTO LIKE_CATEGORY (lcId, mID, actCno) VALUES (LIKE_CATEGORY_SQ.NEXTVAL, 'test2', 43);

-- 멤버가 관심 카테고리 삭ㅋ제ㅋ id: memberDeleteLikeActCate
DELETE LIKE_CATEGORY WHERE MID='test' AND ACTCNO=(SELECT ACTCNO FROM (SELECT ROWNUM, ACTCNO FROM ACTIVITY_CATEGORY WHERE ACTCATEGORY4='괌' AND ROWNUM=1));


-- 멤버가 저장한 관심 카테고리 뿌리기(딱히 리스트로 뿌릴 것은 아니지만... 페이징은 필요X) id: memberLikeActCateList 
SELECT actCNO FROM LIKE_CATEGORY WHERE MID='test';

-- 멤버의 관심 카테고리에 맞는 액티비티 리스트(메인에 뿌릴 용) id : memberCustomizedActList
SELECT ACTCNO FROM LIKE_CATEGORY WHERE MID='test';
SELECT*FROM ACTIVITY WHERE ACTCNO IN (SELECT ACTCNO FROM LIKE_CATEGORY WHERE MID='test');

-- 페이징 ver id : memberCustomizedActListAll

SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT*FROM ACTIVITY WHERE ACTCNO IN 
        (SELECT ACTCNO FROM LIKE_CATEGORY WHERE MID='test'))A) WHERE RN BETWEEN 2 AND 3;

-- 멤버의 관심 카테고리에 맞는 액티비티 개수  id : memberCustomizedActListAllCnt


commit;
----------------------------------------
-- 회원가입 id : memberJoin

-- 로그인 id : memberLogin

-- 비밀번호 찾기 id : memberSearchPw

-- 비밀번호 랜덤변경 id : memberRandomPw

-- 정보 수정 id : memberModify

-- 회원 리스트 id : memberList

----------------------------------------
---              호스트 관련           ---
SELECT*FROM HOST;
SELECT*FROM LIKE_HOST;
----------------------------------------
select * from host;
-- 호스트 좋아하기 id : memberLikeHost
INSERT INTO LIKE_HOST (lhID, mID, hID) VALUES (LIKE_HOST_SEQ.NEXTVAL, 'test', 'test');
UPDATE HOST SET 
    hCNTLIKE=3 -- 원래개수+1 
    WHERE hID='bbarkji';

-- 이 호스트를 몇명의 멤버가 좋아했나? id : hostLikeMemberCnt
SELECT COUNT(*) FROM LIKE_HOST WHERE hID='test';

-- 멤버가 이 호스트를 이미 좋아했는가??? 체크용 id: memberLikeHostCheck
SELECT COUNT(*) FROM LIKE_HOST WHERE hId='test' AND mID='test';

-- 멤버가 호스트 좋아요를 취소하기 id: memberLikeHostDelete
DELETE LIKE_HOST WHERE hId='test' AND mID='test';


commit;

-- (멤버별) 호스트 좋아요 리스트 id : memberLikeHostList
SELECT H.* FROM LIKE_HOST LH, HOST H WHERE LH.hID=H.hID AND mID='test'; -- 기준
SELECT*FROM(SELECT ROWNUM RN, A.* FROM
    (SELECT LH.*, hPhoto, hName, hPhone, hEmail FROM LIKE_HOST LH, HOST H WHERE LH.hID=H.hID AND mID='test')A) 
        WHERE RN BETWEEN 1 AND 3;

-- 나를 좋아한 멤버 id : hostLikedMemberList
SELECT M.* FROM LIKE_HOST LH, MEMBER M WHERE LH.mID=M.mID AND hID='test'; -- 기준
SELECT*FROM(SELECT ROWNUM RN, A.* FROM
    (SELECT mName, mPhone, mEmail FROM LIKE_HOST LH, MEMBER M WHERE LH.mID=M.mID AND hID='test')A) 
        WHERE RN BETWEEN 1 AND 3;

-- 아이디 중복체크 id = idConfirm
SELECT COUNT(*) FROM HOST WHERE hID='test';

-- 이메일 중복체크 id = emailConfirm
SELECT COUNT(*) FROM HOST WHERE hEmail='barkji0@naver.com';

-- 회원가입 id : hostJoin
INSERT INTO HOST (hID, hPW, hNAME, hPHONE, hEMAIL, hBANK, hPOST, hADDRESS)
    VALUES ('test1', 'test', 'test', '010-1111-1111', 'test@test.com', '2001-346-644316 우리', '02215', '서울시');
 
-- 로그인 id : getHost
SELECT*FROM HOST WHERE hID='test';

-- 정보수정 id : hostModify
UPDATE HOST SET
    hPW='modify',
    hNAME='modify',
    hPHONE='010-3333-3333',
    hEMAIL='modify@modify.com',
    hPhoto='modify.jpg',
    hPOST='hPhotoDefault120x120,jpg',
    hADDRESS='수정수정'
    WHERE hID='test';

UPDATE HOST SET hPhoto='modify.jpg' WHERE hID='bbarkji';

commit;

-- 비밀번호 재설정 id : hostSearchPw
UPDATE HOST SET
    hPW='newPW'
    WHERE hID='test' AND hEMAIL='modify@modify.com';


-- (관리자가 보려구 함+검색도 하게 할 것임) 호스트 리스트 id : hostList
SELECT*FROM HOST WHERE hNAME LIKE '%'||'t'||'%' OR hID LIKE '%'||'t'||'%' ORDER BY hRDATE DESC; -- 기준
SELECT*FROM(SELECT ROWNUM RN, A.* FROM
    (SELECT*FROM HOST WHERE hNAME LIKE '%'||'t'||'%' OR hID LIKE '%'||'t'||'%' ORDER BY hRDATE DESC)A) 
        WHERE RN BETWEEN 1 AND 3; -- 페이징

-- 좋아요가 높은 순으로 정렬한 호스트 리스트 id : hostBestList
SELECT*FROM HOST ORDER BY hCNTLIKE DESC; -- 기준
SELECT*FROM(SELECT ROWNUM RN, A.* FROM
    (SELECT*FROM HOST ORDER BY hCNTLIKE DESC)A) 
        WHERE RN BETWEEN 1 AND 3;

-- 호스트 마이페이지 id : hostMain

commit;

----------------------------------------
---              액티비티 관련         ---
SELECT*FROM ACTIVITY;
SELECT*FROM ACTIVITY_CATEGORY; -- 일상 ~68, 여행 69~
SELECT*FROM ACTEVENTDATE;
update activity set actname='달리고 마시는 사람들' where actid=21;
commit;
----------------------------------------

-- 카테고리 넘버가 같은 액티비티 다 가져오기
SELECT*FROM ACTIVITY WHERE ACTCNO='46';

-- 액티비티 개수 (페이징용) id : activityCnt 
-- 왠지 if 문으로 다 처리할 수 있을 것 같긴 하지만 일단 다 구분 해 봄.
-- 검색 시 개수 id : activitySearchCnt
SELECT COUNT(*) FROM ACTIVITY A, ACTIVITY_CATEGORY AC, HOST H
    WHERE A.ACTCNO=AC.ACTCNO AND A.HID=H.HID
    AND  ACTNAME LIKE '%'||''||'%' OR ACTINFO LIKE '%'||''||'%' 
    AND AC.ACTCATEGORY='' AND AC.ACTCATEGORY2='' AND AC.ACTCATEGORY3='' AND AC.ACTCATEGORY4='' AND ACTCATEGORY5=''; 

-- 검색하면 나오는 액티비티 전체 리스트(기본적으로는 라이크 수 많은 순, 페이징까지)  id : activityAllList
SELECT*FROM ACTIVITY A, ACTIVITY_CATEGORY AC 
    WHERE A.ACTCNO=AC.ACTCNO AND ACTNAME LIKE '%'||'얍'||'%' OR ACTINFO LIKE '%'||'얍'||'%' 
    AND AC.ACTCATEGORY='일상' AND AC.ACTCATEGORY2='배움' AND AC.ACTCATEGORY3='스포츠' AND AC.ACTCATEGORY4='댄스' AND ACTCATEGORY5='없겠지'
    ORDER BY ACTLIKE DESC; -- 기준

-- 페이징 
SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT A.*, ACTCATEGORY FROM ACTIVITY A, ACTIVITY_CATEGORY AC 
        WHERE A.ACTCNO=AC.ACTCNO AND ACTNAME LIKE '%'||'얍'||'%' OR ACTINFO LIKE '%'||'얍'||'%' 
        AND AC.ACTCATEGORY='일상' AND AC.ACTCATEGORY2='배움' AND AC.ACTCATEGORY3='스포츠' AND AC.ACTCATEGORY4='댄스' AND ACTCATEGORY5='없겠지'
        ORDER BY ACTLIKE DESC)A) 
        WHERE RN BETWEEN 1 AND 2; 


SELECT*FROM ACTIVITY WHERE ACTNAME LIKE '%'||'얍'||'%' OR ACTINFO LIKE '%'||'얍'||'%' ORDER BY ACTLIKE DESC;
SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT*FROM ACTIVITY WHERE ACTNAME LIKE '%'||'얍'||'%' OR ACTINFO LIKE '%'||'얍'||'%' ORDER BY ACTLIKE DESC)A) 
        WHERE RN BETWEEN 1 AND 2;

-- 카테고리 별 정렬한 액티비티 리스트(버튼 누르면 단계별로 들어간당, 검색 결과는 최근 순, 페이징까지) id : activityAsCateList
-- 1차 카테고리 별 정렬한 액티비티 리스트 id : activityFirstCateList
SELECT*FROM ACTIVITY A, ACTIVITY_CATEGORY AC WHERE A.ACTCNO=AC.ACTCNO AND AC.ACTCATEGORY='일상' ORDER BY ACTID DESC;
SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT A.*, ACTCATEGORY FROM ACTIVITY A, ACTIVITY_CATEGORY AC 
        WHERE A.ACTCNO=AC.ACTCNO AND AC.ACTCATEGORY='일상' 
        ORDER BY ACTID DESC)A) 
        WHERE RN BETWEEN 1 AND 2;

-- (1차+)2차 카테고리 별 정렬한 액티비티 리스트 id : activitySecondCateList
SELECT*FROM ACTIVITY A, ACTIVITY_CATEGORY AC WHERE A.ACTCNO=AC.ACTCNO AND AC.ACTCATEGORY='일상' AND AC.ACTCATEGORY2='배움' ORDER BY ACTID DESC;
SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT A.*, ACTCATEGORY, ACTCATEGORY2 FROM ACTIVITY A, ACTIVITY_CATEGORY AC 
        WHERE A.ACTCNO=AC.ACTCNO AND AC.ACTCATEGORY='일상' AND AC.ACTCATEGORY2='배움' 
        ORDER BY ACTID DESC)A) 
        WHERE RN BETWEEN 1 AND 2;

-- (1차+2차+)3차 카테고리 별 정렬한 액티비티 리스트(★이건 상세에서도 써먹을 수 있음) id : activityThirdCateList 
SELECT*FROM ACTIVITY A, ACTIVITY_CATEGORY AC WHERE A.ACTCNO=AC.ACTCNO AND AC.ACTCATEGORY='일상' AND AC.ACTCATEGORY2='배움' AND AC.ACTCATEGORY3='스포츠' ORDER BY ACTID DESC;
SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT A.*, ACTCATEGORY, ACTCATEGORY2, ACTCATEGORY3 FROM ACTIVITY A, ACTIVITY_CATEGORY AC 
        WHERE A.ACTCNO=AC.ACTCNO AND AC.ACTCATEGORY='일상' AND AC.ACTCATEGORY2='배움' AND AC.ACTCATEGORY3='스포츠' 
        ORDER BY ACTID DESC)A) 
        WHERE RN BETWEEN 1 AND 2;

-- (1차+2차+3차+)4차 카테고리 별 정렬한 액티비티 리스트 id : activityFourthCateList
SELECT*FROM ACTIVITY A, ACTIVITY_CATEGORY AC WHERE A.ACTCNO=AC.ACTCNO AND AC.ACTCATEGORY='일상' AND AC.ACTCATEGORY2='배움' AND AC.ACTCATEGORY4='댄스' ORDER BY ACTID DESC;
SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT A.*, ACTCATEGORY, ACTCATEGORY2, ACTCATEGORY3, ACTCATEGORY4 FROM ACTIVITY A, ACTIVITY_CATEGORY AC 
        WHERE A.ACTCNO=AC.ACTCNO AND AC.ACTCATEGORY='일상' AND AC.ACTCATEGORY2='배움' AND AC.ACTCATEGORY3='스포츠' AND AC.ACTCATEGORY4='댄스' 
        ORDER BY ACTID DESC)A) 
        WHERE RN BETWEEN 1 AND 2;

-- (1차+2차+3차+4차+)5차 카테고리 별 정렬한 액티비티 리스트 id : activityFithCateList
SELECT*FROM ACTIVITY A, ACTIVITY_CATEGORY AC WHERE A.ACTCNO=AC.ACTCNO AND AC.ACTCATEGORY='일상' AND AC.ACTCATEGORY2='배움' AND AC.ACTCATEGORY4='댄스' AND ACTCATEGORY5='없겠지' ORDER BY ACTID DESC;
SELECT*FROM(SELECT ROWNUM RN, A.* 
    FROM (SELECT A.*, ACTCATEGORY, ACTCATEGORY2, ACTCATEGORY3, ACTCATEGORY4, ACTCATEGORY5 FROM ACTIVITY A, ACTIVITY_CATEGORY AC 
        WHERE A.ACTCNO=AC.ACTCNO AND AC.ACTCATEGORY='일상' AND AC.ACTCATEGORY2='배움' AND AC.ACTCATEGORY3='스포츠' AND AC.ACTCATEGORY4='댄스' AND ACTCATEGORY5='없겠지' 
        ORDER BY ACTID DESC)A) 
        WHERE RN BETWEEN 1 AND 2;


-- 호스트가 좋아요 많은 순으로 정렬한 액티비티 리스트(페이징까지) id : activityBestHostList
SELECT A.*, HCNTLIKE FROM ACTIVITY A, HOST H WHERE A.HID=H.HID ORDER BY H.HCNTLIKE DESC;
SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT A.*, HCNTLIKE FROM ACTIVITY A, HOST H WHERE A.HID=H.HID ORDER BY H.HCNTLIKE DESC)A) 
        WHERE RN BETWEEN 1 AND 2;

-- 좋아요가 높은순으로 정렬한 액티비티 리스트(1위부터 10위까지) id : activityLikeBestList
SELECT*FROM ACTIVITY ORDER BY ACTLIKE DESC;
SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT*FROM ACTIVITY ORDER BY ACTLIKE DESC)A) WHERE RN BETWEEN 1 AND 10;

-- 최신 순 액티비티 리스트(페이징까지)
SELECT A.* FROM ACTIVITY  ORDER BY ACTID DESC; -- 기준
SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT A.* FROM ACTIVITY A, ACTIVITY_CATEGORY AC 
    WHERE A.ACTCNO=AC.ACTCNO ORDER BY ACTID DESC)A) WHERE RN BETWEEN 1 AND 5;

SELECT A.*FROM ACTIVITY A, ACTIVITY_CATEGORY AC 
    WHERE A.ACTCNO=AC.ACTCNO 
    AND  ACTNAME LIKE '%'||'얍'||'%' OR ACTINFO LIKE '%'||'얍'||'%' 
    AND AC.ACTCATEGORY='일상' AND AC.ACTCATEGORY2='배움' AND AC.ACTCATEGORY3='스포츠' AND AC.ACTCATEGORY4='댄스' AND ACTCATEGORY5='없겠지'
    ORDER BY ACTID DESC;

SELECT*FROM(SELECT ROWNUM RN, B.* FROM 
    (SELECT A.*FROM ACTIVITY A, ACTIVITY_CATEGORY AC 
    WHERE A.ACTCNO=AC.ACTCNO 
    AND  ACTNAME LIKE '%'||''||'%' OR ACTINFO LIKE '%'||''||'%' 
    AND AC.ACTCATEGORY='일상' AND AC.ACTCATEGORY2='배움' AND AC.ACTCATEGORY3='스포츠' AND AC.ACTCATEGORY4='댄스' AND ACTCATEGORY5='없겠지'
    ORDER BY ACTID DESC)B) WHERE RN BETWEEN 1 AND 5;


-- 인기 카테고리 리스트 (3차 카테고리로 분류) id: activityBestCateList

SELECT*FROM ACTIVITY A, ACTIVITY_CATEGORY AC WHERE A.ACTCNO=AC.ACTCNO AND ac.actcategory3='스포츠' ORDER BY ACTLIKE DESC;

SELECT*FROM(SELECT ROWNUM RN, A.* FROM
    (SELECT A.*, ACTCATEGORY3 FROM ACTIVITY A, ACTIVITY_CATEGORY AC 
        WHERE A.ACTCNO=AC.ACTCNO AND ac.actcategory3='스포츠' ORDER BY ACTLIKE DESC)A)
            WHERE RN BETWEEN 1 AND 2;

SELECT COUNT(*) FROM ACTIVITY A, ACTIVITY_CATEGORY AC 
        WHERE A.ACTCNO=AC.ACTCNO AND ac.actcategory3='스포츠';

commit;

select*from activity a, activity_category ac where a.actcno=ac.actcno and ac.actcategory3='어학';

select*from acteventdate;
INSERT INTO acteventdate (ENO, acteventdate, HID, ACTID) VALUES (1, '2020-04-20', 'test1', 2);
SELECT*FROM HOST;
SELECT*FROM ACTIVITY_CATEGORY;

-- 액티비티 상세보기(id: activityDetail
SELECT A.*, hPHOTO, hNAME, hCNTLIKE
    FROM ACTIVITY A, HOST H 
        WHERE A.HID=H.HID       
        AND A.ACTID='2';

-- 액티비티 일정 상세보기(id: activityEventDates)
SELECT*FROM ACTEVENTDATE WHERE ACTID='2';

-- category3이 같은 액티비티 불러오기(상세보기 하단에 뿌릴용) id: activitySameCate3List
SELECT A.* FROM ACTIVITY A, ACTIVITY_CATEGORY AC 
    WHERE A.ACTCNO=AC.ACTCNO AND ACTCATEGORY3 
        IN (SELECT ACTCATEGORY3 FROM ACTIVITY A, ACTIVITY_CATEGORY AC WHERE A.ACTCNO=AC.ACTCNO AND ACTID=2);

-- 액티비티 카테고리 리스트 id : activityCategoryList
SELECT DISTINCT actCATEGORY FROM ACTIVITY_CATEGORY;
SELECT DISTINCT actCATEGORY2 FROM ACTIVITY_CATEGORY WHERE actCATEGORY='일상';
SELECT DISTINCT actCATEGORY3 FROM ACTIVITY_CATEGORY WHERE actCATEGORY2='동남아시아';
SELECT DISTINCT actCATEGORY4 FROM ACTIVITY_CATEGORY WHERE actCATEGORY3='필리핀';
SELECT DISTINCT actCATEGORY5 FROM ACTIVITY_CATEGORY WHERE actCATEGORY4='제주도';
SELECT actCNO FROM ACTIVITY_CATEGORY 
    WHERE actCATEGORY='여행'
    AND actCATEGORY2='동남아시아'
    AND actCATEGORY3='필리핀'
    AND actCATEGORY4='세부'
    AND actCATEGORY5='호스트투어';

-- 액티비티 카테고리 생성 id : activityCategoryWrite
INSERT INTO ACTIVITY_CATEGORY (actCNO, actCATEGORY, actCATEGORY2, actCATEGORY3, actCATEGORY4)
    VALUES (ACTIVITY_CATEGORY_SQ.NEXTVAL, '일상', '액티비티', '테마파크', '놀이동산');

-- 액티비티 생성 id : activityWrite 나
INSERT INTO ACTIVITY 
    (actID, actNAME, actIMG, actINFO, actADDRESS, actPRICE, actINCLUDE, actEXCLUDE, actPOLICY, actSCHEDULE, hID, actDISCOUNT, actCNO, actMINMEMBER, actMAXMEMBER, actOPTION)
    VALUES (ACTIVITY_SQ.NEXTVAL, '생성테스트', 'noImg.jpg', '소개', '종로', 13000, '테스트', '테스트', '안됨', null, 'aaa', 5, 1, 1, 10, '참가자1인');

-- 액티비티 수정 id : activityModify 나
UPDATE ACTIVITY SET actNAME='수정테스트', actIMG='noImg.png', actINFO='소개',
                    actADDRESS='종로', actPRICE=20000, actINCLUDE='ㅇ', actEXCLUDE='ㅇ',
                    actPOLICY='ㅇ', actSCHEDULE='ㅇ', hID='aaa', actDISCOUNT=5,
                    actMINMEMBER=1, actMAXMEMBER=10, actOPTION='참가자1인' WHERE actID=2;

-- 액티비티 삭제 id : activityDelete 나
DELETE FROM ACTIVITY WHERE actID=2;

-- actId로 액티비티 불러오기 id : getActivity
SELECT * FROM ACTIVITY WHERE actID=4;

-- actId로 액티비티 일정 가져오기 id : getActivityDate
SELECT * FROM ACTEVENTDATE WHERE actId=8;

-- 액티비티 일정 숫자 가져오기 id : getActivityDateCnt
SELECT COUNT(*) FROM ACTEVENTDATE WHERE actID=8;

-- eNo로 액티비티 일정 가져오기 id : getActDate
SELECT * FROM ACTEVENTDATE WHERE eNO=4;

-- 액티비티 일정 생성 id : activityDate
INSERT INTO ACTEVENTDATE VALUES (ACTEVENTDATE_SQ.NEXTVAL, '2020-04-26', '2020-04-27', 'test', 39);

-- 액티비티 일정 수정 id : activityDateModify
UPDATE ACTEVENTDATE SET actSTARTDATE='2020-04-17 13:00:00', actENDDATE='2020-04-23 14:00:00' WHERE eNO=4;


-- hostActivityDateList
select*from activity where actid=2;
select*from ACTEVENTDATE;
SELECT * FROM ACTEVENTDATE WHERE actID=2 ORDER BY actSTARTDATE;
insert into ACTEVENTDATE values (acteventdate_sq.nextval, sysdate, sysdate, 'test1',2);


-- 액티비티 일정 삭제 id : activityDateDelete
DELETE FROM ACTEVENTDATE WHERE eNO=4;

--- 내가만든 액티비티 총 개수 id : hostActivityTotal
SELECT COUNT(*) FROM ACTIVITY WHERE hID='aaa';

-- 내가만든 액티비티 리스트 id : hostActivityList 나
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
    (SELECT * FROM ACTIVITY ORDER BY actID DESC) A) 
    WHERE hID='aaa' AND RN BETWEEN 1 AND 15;


-- 액티비티 출석체크용 리스트 id : hostActivityCheckList
SELECT A.*, (SELECT actNAME FROM ACTIVITY WHERE actID=A.actID) actNAME, (SELECT actIMG FROM ACTIVITY WHERE actID=A.actID) actIMG
    FROM (SELECT ROWNUM RN, AR.* 
    FROM (SELECT * FROM actEVENTDATE WHERE actENDDATE < SYSDATE ORDER BY eNO DESC) AR) A
    WHERE RN BETWEEN 1 AND 3 AND hID='aaa' AND actENDDATE < SYSDATE ORDER BY actSTARTDATE;

-- 액티비티 출석체크 총 개수 id : hostActivityCheckTotal
SELECT COUNT(*) FROM ACTEVENTDATE WHERE hID='aaa' AND actENDDATE < SYSDATE;

-- 액티비티 예약자 리스트 id : hostActivityReserveList 나
SELECT AR.*, (SELECT mNAME FROM MEMBER WHERE mID=AR.mID) mNAME,
            (SELECT mPHONE FROM MEMBER WHERE mID=AR.mID) mPHONE,
            (SELECT mBIRTH FROM MEMBER WHERE mID=AR.mID) mBIRTH
    FROM ACTIVITY_RESERVE AR WHERE eNo=2;

-- 액티비티 출석체크 id : hostActivityCheck 나
UPDATE ACTIVITY_RESERVE SET arCHECK=1 WHERE arID=13;

SELECT O.*, (SELECT actSTARTDATE FROM actEVENTDATE WHERE eNO=O.eNO) actSTARTDATE, (SELECT actENDDATE FROM actEVENTDATE WHERE eNO=O.eNO) actENDDATE,
    (SELECT actNAME FROM ACTIVITY WHERE actID=O.actID) actNAME, (SELECT actIMG FROM ACTIVITY WHERE actID=O.actID) actIMG
    FROM (SELECT O.*, ROWNUM RN FROM (SELECT * FROM ORDERS ORDER BY oNO DESC) O) O
    WHERE RN BETWEEN 1 AND 5 AND mID='rlgy0126';

-- 액티비티 예약 id : hostActivityReserve 나
INSERT INTO ACTIVITY_RESERVE (arID, hID, mID, actID, eNO) VALUES (ACTIVITY_RESERVE_SQ.NEXTVAL, 'test', 'rlgy0126', 39, 157);

-- 액티비티 예약자 수 id : hostActivityReserveCnt
SELECT COUNT(*) FROM ACTIVITY_RESERVE WHERE eNO=8;

-- 자신이 예약한 액티비티 리스트 수 id : myActivityReserveCnt
SELECT COUNT(*) FROM ACTIVITY_RESERVE WHERE mID='aaaaaa';

-- 자신이 예약한 액티비티 리스트 id : myActivityList
SELECT A.*, (SELECT actNAME FROM ACTIVITY WHERE actID=A.actID) actNAME,
    (SELECT actIMG FROM ACTIVITY WHERE actID=A.actID) actIMG,
    (SELECT actSTARTDATE FROM ACTEVENTDATE WHERE eNO=A.eNO) actSTARTDATE,
    (SELECT actENDDATE FROM ACTEVENTDATE WHERE eNO=A.eNO) actENDDATE FROM
    (SELECT ROWNUM RN, A.* FROM 
    (SELECT * FROM ACTIVITY_RESERVE ORDER BY arID DESC) A) A
    WHERE mID='aaaaaa' AND ROWNUM BETWEEN 1 AND 5;

SELECT*FROM ACTIVITY;
SELECT*FROM LIKE_ACTIVITY where mId='test';
SELECT*FROM MEMBER;
INSERT INTO MEMBER VALUES ('test2', 'test', 'test', 'test', 'test@test.test', '12345', 'test', sysdate, sysdate, 'test');

-- 멤버가 액티비티 좋아하기 id : memberLikeActivity
INSERT INTO LIKE_ACTIVITY (laID, mID, actID) VALUES (LIKE_ACTIVITY_SQ.nextval, 'test2', 2);
INSERT INTO LIKE_ACTIVITY (laID, mID, actID) VALUES (LIKE_ACTIVITY_SQ.nextval, 'test', 5);
INSERT INTO LIKE_ACTIVITY (laID, mID, actID) VALUES (LIKE_ACTIVITY_SQ.nextval, 'test', 3);

-- 멤버가 액티비티 좋아하기 취소 id : memberLikeActivityDelete
DELETE LIKE_ACTIVITY WHERE actID='2' AND mID='test';

COMMIT;

-- 멤버가 좋아한 총 액티비티 개수 id : memberLikeActivityCnt
SELECT COUNT(*) FROM LIKE_ACTIVITY WHERE mID='test';

-- 멤버가 좋아한 액티비티 리스트(+페이징) id: memberLikeActivityList
SELECT LA.*, actNAME, actIMG, actPRICE, actDISCOUNT, hId FROM ACTIVITY A, LIKE_ACTIVITY LA WHERE A.actID=LA.actID AND mID='test' ORDER BY laRDATE DESC;  -- 기준(좋아한 최신순)
SELECT*FROM(SELECT ROWNUM RN, B.* 
    FROM(SELECT LA.*, actNAME, actIMG, actPRICE, actDISCOUNT, hId FROM ACTIVITY A, LIKE_ACTIVITY LA 
    WHERE A.actID=LA.actID AND mID='test' ORDER BY laRDATE DESC)B) WHERE RN BETWEEN 2 AND 3; -- 페이징

-- 멤버가 이 액티비티를 이미 좋아했는가??? 체크용 id: memberLikeActivityCheck
SELECT COUNT(*) FROM like_activity WHERE actID=2 AND mID='test';

-- 이 액티비티를 좋아하는 멤버 명 수 id: activityLikeMemberCnt
SELECT COUNT(*) FROM LIKE_ACTIVITY WHERE actID='2';

-- 이 액티비티를 좋아하는 멤버 리스트(페이징) id: activityLikeMemberList
SELECT mNAME, mEMAIL, mPHONE, LA.* FROM MEMBER M, LIKE_ACTIVITY LA WHERE M.mID=LA.mID AND actID=2 ORDER BY laRDATE DESC;-- 기준(좋아한 최신 순)
SELECT*FROM(SELECT ROWNUM RN, A.* 
    FROM(SELECT mNAME, mEMAIL, mPHONE, LA.* FROM MEMBER M, LIKE_ACTIVITY LA 
    WHERE M.mID=LA.mID AND actID=2 ORDER BY laRDATE DESC)A) WHERE RN BETWEEN 1 AND 2;-- 페이징
select * from activity where actid=6;
COMMIT;
-- 액티비티 평점 구하기 id : activityReviewGrade
UPDATE ACTIVITY SET ACTGRADE=(SELECT AVG(rGRADE) FROM REVIEW WHERE actID=6) WHERE actID=6;
commit;

SELECT * FROM ACTEVENTDATE WHERE ACTID=1 AND SYSDATE < ACTSTARTDATE;

----------------------------------------
---              후기 관련             --- 나
----------------------------------------
-- 후기 리스트 id : reviewList
SELECT REVIEW.*, (SELECT actNAME FROM ACTIVITY WHERE actID=2) actNAME
    FROM (SELECT ROWNUM RN, R.* 
    FROM (SELECT * FROM REVIEW ORDER BY rGROUP DESC, rSTEP) R) REVIEW
    WHERE actID=2 AND RN BETWEEN 1 AND 5;

-- 좋아요 높은 후기 가져오기 id : LikeReview
SELECT ROWNUM, REVIEW.*, (SELECT actNAME FROM ACTIVITY WHERE actID=3) actNAME
    FROM REVIEW WHERE actID=3 AND rLIKE = (SELECT MAX(rLIKE) FROM REVIEW WHERE actID=3) AND ROWNUM=1;

-- 후기 작성 id : reviewWrite(호스트 작성시)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, rGRADE, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '작성텟', (SELECT hNAME FROM HOST WHERE hID='aaa1'), '111', '내용', REVIEW_SQ.CURRVAL, 0, 0, 3, 3, 'aaa1');
-- 후기 작성(이미지 있을때)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, hID)
    VALUES (REVIEW_SQ.NEXTVAL, '작성텟', (SELECT hNAME FROM HOST WHERE hID='aaa'), '111', '내용', 'noImg.png', REVIEW_SQ.CURRVAL, 0, 0, 3, 2, 'aaa');
-- 후기 작성(멤버 작성시)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '작성텟', (SELECT mNAME FROM MEMBER WHERE mID='aaa'), '111', '내용', REVIEW_SQ.CURRVAL, 0, 0, 3, 2, 'aaa');
-- 후기 작성(이미지 있을때)
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rIMG, rGROUP, rSTEP, rINDENT, rGRADE, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '작성텟', (SELECT mNAME FROM MEMBER WHERE mID='aaa'), '111', '내용', 'noImg.png', REVIEW_SQ.CURRVAL, 0, 0, 4, 2, 'aaa');
    
-- 후기 수정 id : reviewModfy
UPDATE REVIEW SET rTITLE='수정', rCONTENT='내용', rGRADE=3.0 WHERE rID=1 AND rPW='111';

-- 후기 삭제 id : reviewDelete
DELETE REVIEW WHERE rID=1 AND rPW='111';

-- 후기 도움 클릭 id : reviewLike
UPDATE REVIEW SET rLIKE=rLIKE+1 WHERE rID=17;

--후기 도움 취소 id : reviewUnLike
UPDATE REVIEW SET rLIKE=rLIKE-1 WHERE rID=17;

-- 답변 전 stepA id : reviewStepA
UPDATE REVIEW SET rSTEP=rSTEP+1 WHERE rGROUP=3 AND rSTEP > 0 AND actID=2;

-- 후기 답변 id : reviewReply
INSERT INTO REVIEW (rID, rTITLE, rWRITER, rPW, rCONTENT, rGROUP, rSTEP, rINDENT, actID, mID)
    VALUES (REVIEW_SQ.NEXTVAL, '답변텟', (SELECT hNAME FROM HOST WHERE hID='aaa'), '111', '내용', 3, 1, 1, 1, 'aaa');

--후기 총 개수 id : reviewCnt
SELECT COUNT(*) FROM REVIEW WHERE actID=2;

-- 후기 평점 계산 id : reviewGrade
SELECT AVG(rGRADE) FROM REVIEW WHERE actID=2;

-- 후기 좋아요 클릭 id : reviewLikeClickWrite(첫클릭 시 생성)
INSERT INTO REVIEW_LIKE VALUES (REVIEW_LIKE_SQ.NEXTVAL, 13, 'aaa', 1, 2);
select * from review_like;
-- 후기 좋아요 클릭 id : reviewLikeClick(생성 후 클릭 시 : 좋아요올리기)
UPDATE REVIEW_LIKE SET rlCHECK=1 WHERE rlNO=1;

-- 후기 좋아요 클릭 취소 id : reviewLikeClick(좋아요 내리기)
UPDATE REVIEW_LIKE SET rlCHECK=0 WHERE rlNO=1;

-- 후기 좋아요 클릭 체크 id : reviewLikeCheck
SELECT * FROM REVIEW_LIKE WHERE rID=12 AND actID=2;

-- 후기 좋아요 높은 수 id : likeReviewCheck
SELECT ROWNUM, actID, rID
    FROM REVIEW
    WHERE actID=2 AND
    rLIKE = (SELECT MAX(rLIKE) FROM REVIEW WHERE actID=2)
    AND ROWNUM=1;

-- 후기 전체리스트 클릭 체크 id : reviewListLikeCheck
SELECT rID, actID,
    (SELECT rlNO FROM REVIEW_LIKE WHERE rID=REVIEW.rID) rlNO,
    (SELECT rlCHECK FROM REVIEW_LIKE WHERE rID=REVIEW.rID) rlCHECK
    FROM (SELECT ROWNUM RN, R.* 
    FROM (SELECT * FROM REVIEW ORDER BY rGROUP DESC, rSTEP) R) REVIEW
    WHERE actID=2 AND RN BETWEEN 1 AND 5;

-- 멤버가 작성한 후기 보기 id : myReviewList
SELECT R.*, (SELECT actNAME FROM ACTIVITY WHERE actID=R.actID) actNAME FROM
    (SELECT ROWNUM RN, R.* FROM
    (SELECT * FROM REVIEW ORDER BY rID DESC) R) R 
    WHERE mID='aaaaaa' AND RN BETWEEN 1 AND 5;

-- 멤버가 작성한 후기 총 개수 id : myReviewCnt
SELECT COUNT(*) FROM REVIEW WHERE mID='aaaaaa';

----------------------------------------
---              공지 관련             ---
----------------------------------------
-- 전체 리스트 id : noticeAllList

-- 공지 리스트 id : noticeList

-- 이벤트 리스트 id : eventList

-- 발표 리스트 id : AnnouncementList

-- 공지 작성 : noticeWrite

-- 공지 수정 : noticeModify

-- 공지 삭제 : noticeDelete

----------------------------------------
---              Q&A 관련(관리자)      ---
SELECT*FROM admin_qna;
----------------------------------------
-- Q&A 리스트(+검색+페이징) id : adminQnaList
-- 기준 : 검색을 하지 않는다면 최신순으로, 원글-답변글 순으로
SELECT*FROM ADMIN_QNA WHERE qTITLE LIKE '%'||'쓰'||'%' OR qCONTENT LIKE '%'||'쓰'||'%' ORDER BY qGROUP DESC, qSTEP;
-- 페이징까지 한 최종
SELECT*FROM(SELECT ROWNUM RN, A.* FROM
    (SELECT*FROM ADMIN_QNA WHERE qTITLE LIKE '%'||'제'||'%' OR qCONTENT LIKE '%'||'제'||'%' ORDER BY qGROUP DESC, qSTEP)A) 
        WHERE RN BETWEEN 1 AND 3;

-- Q&A 히트 수 올리기 id : adminQnaHitup
UPDATE ADMIN_QNA SET qHIT = qHIT+1 WHERE qID='7';

-- Q&A 상세보기 id : adminQnaDetail
SELECT*FROM ADMIN_QNA WHERE qID='7';

-- Q&A 작성 id : adminQnaWrite
INSERT INTO ADMIN_QNA (qID, qTITLE, qWRITER, qPW, qCONTENT, qFILE, qGROUP, qSTEP, qINDENT, qIP)
    VALUES (ADMIN_QNA_SEQ.NEXTVAL, '제목', '작성자', '비밀번호', '내용', '첨부파일.JPG', ADMIN_QNA_SEQ.CURRVAL, 0, 0, '111.111.11.11');

-- Q&A 수정 id : adminQnaModify
UPDATE ADMIN_QNA SET 
    qTITLE = '수정한 제목',
    qCONTENT = '수정한 내용',
    qFILE = '수정한 파일',
    qIP = '222.222.22.22',
    qRDATE = SYSDATE
    WHERE qID='1' AND qPW='비밀번호';

-- Q&A 삭제 id : adminQnaDelete
DELETE ADMIN_QNA WHERE qID = '4' AND qPW='비밀번호';

-- Q&A 답글 달기 stepA  id : adminQnaReplyStepA
UPDATE ADMIN_QNA SET qSTEP = qSTEP+1 WHERE qGROUP='7' AND qSTEP>0;

-- Q&A 답글 달기 id : adminQnaReply
INSERT INTO ADMIN_QNA (qID, qTITLE, qWRITER, qPW, qCONTENT, qGROUP, qSTEP, qINDENT, qIP)
    VALUES (ADMIN_QNA_SEQ.NEXTVAL, '답변제목', '답변작성자', '1234', '답변내용', '7', 0+1, 0+1, '222.222.22.22'); 

-- 전체 개수(+검색 시) id : adminQnaCnt
SELECT COUNT(*) FROM ADMIN_QNA WHERE qTITLE LIKE '%'||'제'||'%' OR qCONTENT LIKE '%'||'제'||'%';

COMMIT;
select * from admin;
insert into admin values ('admin', '관리자', 'admin');
----------------------------------------
---              Q&A 관련(호스트)      ---
----------------------------------------
-- Q&A 리스트 id : QnaList

-- Q&A 상세보기 id : QnaDetail

-- Q&A 작성 id : QnaWrite

-- Q&A 수정 id : QnaModify

-- Q&A 삭제 id : QnaDelete

----------------------------------------
---              쿠폰 관련             --- 나
----------------------------------------
--전체 쿠폰 리스트 id : couponAllList
SELECT * FROM
    (SELECT ROWNUM RN, C.* FROM
    (SELECT * FROM COUPON ORDER BY cID DESC) C)
    WHERE RN BETWEEN 1 AND 5;

-- 멤버 쿠폰 리스트 id : couponList
SELECT C.*, (SELECT cNAME FROM COUPON WHERE cID=C.cID) cNAME FROM
    (SELECT ROWNUM RN, C.* FROM
    (SELECT * FROM MEMBER_COUPON ORDER BY cID DESC) C) C
    WHERE mID='aaaaaa' AND RN BETWEEN 1 AND 5;

-- 쿠폰 생성 id : couponWrite
INSERT INTO COUPON VALUES (COUPON_SQ.NEXTVAL, (SELECT SUBSTR(SYS_GUID(), 0, 8) FROM DUAL), '생일기념 쿠폰', 10, 5);
select * from coupon;
-- 쿠폰 수정 id : couponModify
UPDATE COUPON SET cNAME='생일기념 쿠폰', cDISCOUNT=10, cDATE=3 WHERE cID=3;
commit;
-- 쿠폰 삭제 id : couponDelete
DELETE FROM COUPON WHERE cID=7;
select * from member;
select * from member_coupon;

-- 쿠폰 지급 id : couponPayments
INSERT INTO MEMBER_COUPON VALUES (MEMBER_COUPON_SQ.NEXTVAL, 'aaa', 1, '2020-07-21', 0);
-- 전체회원 쿠폰지급
INSERT INTO MEMBER_COUPON (mcNO, mID, cID, mcDATE)
SELECT MEMBER_COUPON_SQ.NEXTVAL, M.mID, C.cID, '2020-07-21' FROM COUPON C, MEMBER M WHERE cID=1;
-- 생일자 쿠폰 지급
INSERT INTO MEMBER_COUPON (mcNO, mID, cID, mcDATE) 
SELECT MEMBER_COUPON_SQ.NEXTVAL, M.mID, C.cID, '2020-07-21' FROM COUPON C, MEMBER M WHERE cID=3 AND mBIRTH LIKE '%'||'04/22';

-- 생일자 쿠폰 자동 지급 id : autoCouponPayments
INSERT INTO MEMBER_COUPON (mcNO, mID, cID, mcDATE)
SELECT MEMBER_COUPON_SQ.NEXTVAL, M.mID, C.cID, (SELECT ADD_MONTHS(SYSDATE, 6) FROM DUAL) FROM COUPON C, MEMBER M WHERE cID=3 AND TO_CHAR(mBIRTH, 'MM-DD') LIKE (SELECT TO_CHAR(SYSDATE, 'MM-DD') FROM DUAL);

-- 전체 쿠폰 총 개수 id : couponTotCnt;
SELECT COUNT(*) FROM COUPON;

-- 멤버 쿠폰 총 개수 id : memberCouponTotCnt;
SELECT COUNT(*) FROM MEMBER_COUPON;

-- 쿠폰 가져오기 id : getCoupon
SELECT * FROM COUPON WHERE cID=1;

-- 멤버 쿠폰 가져오기 id : getMemberCoupon
SELECT * FROM MEMBER_COUPON WHERE mcNO=1;

-- cID로 해당 쿠폰 지급된 멤버 수 id : getMemberCouponCnt
SELECT COUNT(*) FROM MEMBER_COUPON WHERE cID=1;

-- 멤버가 가지고 있는 쿠폰 수 id : myCouponCnt
SELECT COUNT(*) FROM MEMBER_COUPON WHERE mID='aaaaaa';

----------------------------------------
---              관리자 관련          ---
SELECT*FROM ADMIN;
----------------------------------------
-- 관리자 등록 id:adminJoin
INSERT INTO ADMIN VALUES ('admin', '관리자', '1234');

-- 관리자 로그인 (ID로 다 가져와서 체쿠체쿠) id:getAdmin
SELECT*FROM ADMIN WHERE aID='admin';

commit;

-- 블랙리스트 처리

select*from host;
select*from member;
select*from like_category where mid='test';

SELECT COUNT(*) FROM LIKE_HOST WHERE mID='test';

SELECT COUNT(*) FROM LIKE_HOST LH, HOST H WHERE LH.hID=H.hID AND mID='test';

SELECT*FROM(SELECT ROWNUM RN, A.* FROM
    		(SELECT LHID, MID, LH.HID HID, hName, hPhone, hEmail, hPhoto FROM LIKE_HOST LH, HOST H WHERE LH.hID=H.hID AND mID='test')A) 
        	WHERE RN BETWEEN 1 AND 3;