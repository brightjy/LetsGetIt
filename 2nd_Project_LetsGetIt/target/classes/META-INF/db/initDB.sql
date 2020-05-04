DROP SEQUENCE NOTICE_SQ;
DROP TABLE NOTICE;

DROP SEQUENCE ADMIN_QNA_SQ;
DROP TABLE ADMIN_QNA;

DROP TABLE ADMIN;

DROP SEQUENCE QNA_SQ;
DROP TABLE QNA;

DROP SEQUENCE MEMBER_COUPON_SQ;
DROP TABLE MEMBER_COUPON;

DROP SEQUENCE COUPON_SQ;
DROP TABLE COUPON;

DROP SEQUENCE ORDERS_SQ;
DROP TABLE ORDERS;

DROP SEQUENCE LIKE_CATEGORY_SQ;
DROP TABLE LIKE_CATEGORY;

DROP SEQUENCE LIKE_ACTIVITY_SQ;
DROP TABLE LIKE_ACTIVITY;

DROP SEQUENCE LIKE_HOST_SQ;
DROP TABLE LIKE_HOST;

DROP SEQUENCE REVIEW_LIKE_SQ;
DROP TABLE REVIEW_LIKE;

DROP SEQUENCE REVIEW_SQ;
DROP TABLE REVIEW;

DROP SEQUENCE ACTIVITY_RESERVE_SQ;
DROP TABLE ACTIVITY_RESERVE;

DROP SEQUENCE ACTEVENTDATE_SQ;
DROP TABLE ACTEVENTDATE;

DROP SEQUENCE ACTIVITY_SQ;
DROP TABLE ACTIVITY;

DROP SEQUENCE ACTIVITY_CATEGORY_SQ;
DROP TABLE ACTIVITY_CATEGORY;

DROP SEQUENCE HOST_JOIN_SQ;
DROP TABLE HOST;

DROP TABLE MEMBER;

CREATE TABLE MEMBER(    -- 멤버 테이블
    mID      VARCHAR2(50),                  -- 아이디
    mPW      VARCHAR2(50)  NOT NULL,        -- 비밀번호
    mNAME    VARCHAR2(50)  NOT NULL,        -- 이름
    mPHONE   VARCHAR2(100) NOT NULL,        -- 전화번호
    mEMAIL   VARCHAR2(100) NOT NULL,        -- 이메일
    mPOST    VARCHAR2(50),                  -- 우편번호
    mADDRESS VARCHAR2(1000),                -- 주소
    mBIRTH   DATE,                          -- 생일
    mRDATE   DATE DEFAULT SYSDATE NOT NULL, -- 가입일
    mImg     VARCHAR2(1000),                -- 이미지
    PRIMARY KEY(mID)
);

CREATE SEQUENCE  HOST_JOIN_SQ   -- 호스트 회원가입 시퀀스
    MAXVALUE 999
    NOCACHE
    NOCYCLE;

CREATE TABLE HOST(      -- 호스트 테이블
    hID      VARCHAR2(50) PRIMARY KEY,      -- 아이디
    hPW      VARCHAR2(50) NOT NULL,         -- 비밀번호
    hNAME    VARCHAR2(50) NOT NULL,         -- 이름
    hPHONE   VARCHAR2(100) NOT NULL,        -- 전화번호
    hEMAIL   VARCHAR2(100) NOT NULL,        -- 이메일
    hPhoto   VARCHAR2(4000),                -- 이미지
    hRDATE   DATE DEFAULT SYSDATE NOT NULL, -- 가입일
    hBLACK   NUMBER(1) DEFAULT 0 NOT NULL,  -- 블랙여부
    hPOST    VARCHAR2(50),                  -- 우편번호
    hADDRESS VARCHAR2(4000),                -- 주소
    hCNTLIKE NUMBER(4) DEFAULT 0 NOT NULL   -- 호스트 좋아요 수
);

CREATE TABLE LIKE_HOST(     -- 호스트 좋아요 테이블
    lhID NUMBER(7)    PRIMARY KEY,              -- 순차번호
    mID  VARCHAR2(50) REFERENCES MEMBER(mID),   -- 멤버 아이디
    hID  VARCHAR2(50) REFERENCES HOST(hID)      -- 호스트 아이디
);

CREATE SEQUENCE LIKE_HOST_SQ    -- 호스트 좋아요 시퀀스
    MAXVALUE 9999999
    NOCYCLE
    NOCACHE;

CREATE TABLE ADMIN_QNA(     -- 관리자 QNA 테이블
    qID      NUMBER(7) PRIMARY KEY,     -- 순차번호
    qTITLE   VARCHAR2(100) NOT NULL,    -- 제목
    qWRITER  VARCHAR2(50) NOT NULL,     -- 작성자
    qPW      VARCHAR2(50),              -- 비밀번호
    qCONTENT CLOB,                      -- 내용
    qFILE    VARCHAR2(4000),            -- 첨부파일
    qGROUP   NUMBER(3) NOT NULL,        -- 글 그룹
    qSTEP    NUMBER(3) NOT NULL,        -- 글 스텝
    qINDENT  NUMBER(3) NOT NULL,        -- 글 들여쓰기
    qRDATE   DATE DEFAULT SYSDATE,      -- 글 작성일
    qIP      VARCHAR2(100) NOT NULL,    -- 작성자 IP
    qHIT     NUMBER(7) DEFAULT 0        -- 글 좋아요 수
);


CREATE SEQUENCE ADMIN_QNA_SQ    -- 관리자 QNA 시퀀스
    MAXVALUE 9999999
    NOCACHE
    NOCYCLE;

CREATE TABLE ADMIN(     -- 관리자 테이블
    aID   VARCHAR2(50) PRIMARY KEY, -- 아이디
    aNAME VARCHAR2(50) NOT NULL,    -- 이름
    aPW   VARCHAR2(50) NOT NULL     -- 비밀번호
);

CREATE SEQUENCE ACTIVITY_CATEGORY_SQ -- 액티비티 카테고리 시퀀스
    MAXVALUE 99999
    NOCYCLE
    NOCACHE;

CREATE TABLE ACTIVITY_CATEGORY ( -- 액티비티 카테고리 테이블
    actCNO       NUMBER(5),             -- 순차번호
    actCATEGORY  VARCHAR2(50) NOT NULL, -- 주 카테고리
    actCATEGORY2 VARCHAR2(50) NOT NULL, -- 2차 카테고리
    actCATEGORY3 VARCHAR2(50) NOT NULL, -- 3차 카테고리
    actCATEGORY4 VARCHAR2(50) NOT NULL, -- 4차 카테고리
    actCATEGORY5 VARCHAR2(50),          -- 5차 카테고리
    PRIMARY KEY(actCNO)
);

CREATE SEQUENCE ACTIVITY_SQ -- 액티비티 시퀀스
    MAXVALUE 9999999
    NOCYCLE
    NOCACHE;

CREATE TABLE ACTIVITY ( -- 액티비티 테이블
    actID        NUMBER(7),                 -- 액티비티 아이디
    actNAME      VARCHAR2(100) NOT NULL,    -- 액티비티 이름
    actIMG       VARCHAR2(4000) NOT NULL,   -- 액티비티 대표이미지
    actINFO      CLOB NOT NULL,             -- 액티비티 소개글
    actADDRESS1  VARCHAR2(10) NOT NULL,     -- 액티비티 우편번호
    actADDRESS2  VARCHAR2(1000) NOT NULL,   -- 액티비티 도로명주소
    actPRICE     NUMBER(7) NOT NULL,        -- 액티비티 가격
    actGRADE     NUMBER(2, 1) DEFAULT 0.0,  -- 액티비티 평점
    actLIKE      NUMBER(7) DEFAULT 0,       -- 액티비티 좋아요
    actINCLUDE   VARCHAR2(4000) NOT NULL,   -- 액티비티 포함사항
    actEXCLUDE   VARCHAR2(4000) NOT NULL,   -- 액티비티 불포함사항
    actSCHEDULE  VARCHAR2(4000),            -- 액티비티 준비물
    actPOLICY    VARCHAR2(4000) NOT NULL,   -- 액티비티 유의사항
    hID          VARCHAR2(50) NOT NULL,     -- 호스트 아이디
    actDISCOUNT  NUMBER(3) DEFAULT 0,       -- 액티비티 할인율
    actCNO       NUMBER(5),                 -- 액티비티 카테고리 번호
    actMINMEMBER NUMBER(3),                 -- 액티비티 최소참여인원
    actMAXMEMBER NUMBER(3),                 -- 액티비티 최대참여인원
    actOPTION    VARCHAR2(50) NOT NULL,     -- 액티비티 가격 옵션
    PRIMARY KEY(actID),
    FOREIGN KEY(hID) REFERENCES HOST(hID),
    FOREIGN KEY(actCNO) REFERENCES ACTIVITY_CATEGORY(actCNO)
);

CREATE SEQUENCE QNA_SQ  -- QNA 시퀀스
    MAXVALUE 9999999
    NOCYCLE
    NOCACHE;

CREATE TABLE QNA (  -- QNA 테이블
    qID      NUMBER(7),                 -- 순차번호
    qTITLE   VARCHAR2(100) NOT NULL,    -- 제목
    qWRITER  VARCHAR2(50) NOT NULL,     -- 작성자
    qPW      VARCHAR2(50) NOT NULL,     -- 비밀번호
    qCONTENT CLOB NOT NULL,             -- 내용
    qGROUP   NUMBER(3) NOT NULL,        -- 글 그룹
    qSTEP    NUMBER(3) NOT NULL,        -- 글 스텝
    qINDENT  NUMBER(3) NOT NULL,        -- 글 들여쓰기
    actID    NUMBER(7) NOT NULL,        -- 액티비티 번호
    PRIMARY KEY(qID),
    FOREIGN KEY(actID) REFERENCES ACTIVITY(actID)
);

CREATE SEQUENCE LIKE_ACTIVITY_SQ -- 액티비티 좋아요 시퀀스
    MAXVALUE 9999999
    NOCYCLE
    NOCACHE;
    
CREATE TABLE LIKE_ACTIVITY( -- 액티비티 좋아요 테이블
    laID  NUMBER(7) PRIMARY KEY,                -- 순차번호
    mID   VARCHAR2(50) REFERENCES MEMBER(mID),  -- 멤버 아이디
    actID NUMBER(7) REFERENCES ACTIVITY(actID), -- 액티비티 번호
    laRDATE DATE DEFAULT SYSDATE                -- 좋아요 누른 시간
);

-- 관심 액티비티 카테고리(a.k.a 액티비티 카테고리 좋아요) 시퀀스
CREATE SEQUENCE LIKE_CATEGORY_SQ
    MAXVALUE 999
    NOCYCLE
    NOCACHE;

-- 관심 액티비티 카테고리(a.k.a 액티비티 카테고리 좋아요) 액티비티 좋아요 테이블
CREATE TABLE LIKE_CATEGORY(
    lcId   NUMBER(3) PRIMARY KEY,                           -- 순차번호
    mID    VARCHAR2(50) REFERENCES MEMBER(mID),             -- 멤버 아이디
    actCNO NUMBER(5) REFERENCES ACTIVITY_CATEGORY(actCNO)   -- 액티비티 카테고리 순차번호
);


CREATE SEQUENCE COUPON_SQ -- 쿠폰 시퀀스
    MAXVALUE 9999999
    NOCYCLE
    NOCACHE;

  
CREATE TABLE COUPON ( -- 쿠폰 테이블
    cID       NUMBER(7),              -- 순차번호
    cCode     VARCHAR2(8) UNIQUE,     -- 쿠폰 일련번호
    cNAME     VARCHAR2(100) NOT NULL, -- 쿠폰 이름
    cDISCOUNT NUMBER(3) DEFAULT 0,    -- 할인율
    cDATE     NUMBER(1) NOT NULL,     -- 쿠폰 유효기간(1: 1개월, 2: 3개월, 3: 6개월, 4: 1년, 5: 무제한(100년)
    PRIMARY KEY(cID)
);



CREATE SEQUENCE MEMBER_COUPON_SQ -- 멤버 쿠폰 시퀀스
    MAXVALUE 9999999
    NOCYCLE
    NOCACHE;
    
CREATE TABLE MEMBER_COUPON ( -- 멤버 쿠폰 테이블
    mcNO   NUMBER(7),           -- 순차번호
    mID    VARCHAR2(50),        -- 멤버아이디
    cID    NUMBER(7),           -- 쿠폰 순차번호
    mcDATE DATE,                -- 유효기간
    mcUSE NUMBER(1) DEFAULT 0,  -- 사용여부
    PRIMARY KEY(mcNO),
    FOREIGN KEY(mID) REFERENCES MEMBER(mID),
    FOREIGN KEY(cID) REFERENCES COUPON(cID)
);

CREATE SEQUENCE ACTEVENTDATE_SQ -- 액티비티 일정 시퀀스
    MAXVALUE 9999999999
    NOCYCLE
    NOCACHE;

CREATE TABLE ACTEVENTDATE ( -- 액티비티 일정 테이블
    eNO          NUMBER(10),                -- 순차번호
    actSTARTDATE DATE,                      -- 액티비티 시작 날짜
    actENDDATE   DATE,                      -- 액티비티 종료 날짜
    hID          VARCHAR2(50) NOT NULL,     -- 호스트 아이디
    actID        NUMBER(7) NOT NULL,        -- 액티비티 번호
    PRIMARY KEY(eNO),
    FOREIGN KEY(hID) REFERENCES HOST(hID),
    FOREIGN KEY(actID) REFERENCES ACTIVITY(actID)
);

CREATE SEQUENCE REVIEW_SQ -- 후기 시퀀스
    MAXVALUE 9999999
    NOCYCLE
    NOCACHE;
    
CREATE TABLE REVIEW ( -- 후기 테이블
    rID      NUMBER(7),                 -- 후기 번호
    rTITLE   VARCHAR2(1000) NOT NULL,   -- 후기 제목
    rWRITER  VARCHAR2(50) NOT NULL,     -- 후기 작성자
    rPW      VARCHAR2(50) NOT NULL,     -- 비밀번호
    rCONTENT VARCHAR2(4000) NOT NULL,   -- 후기 내용
    rIMG     VARCHAR2(1000),            -- 후기 이미지
    rGROUP   NUMBER(7) NOT NULL,        -- 후기 그룹
    rSTEP    NUMBER(7) NOT NULL,        -- 후기 스텝
    rINDENT  NUMBER(3) NOT NULL,        -- 후기 들여쓰기
    rGRADE   NUMBER(1) DEFAULT 0,       -- 후기 평점
    actID    NUMBER(7) NOT NULL,        -- 액티비티 번호
    rLIKE    NUMBER(7) DEFAULT 0,       -- 후기 좋아요 수
    rDATE    DATE DEFAULT SYSDATE,      -- 후기 작성일
    mID      VARCHAR2(50),              -- 멤버 아이디
    hID      VARCHAR2(50),              -- 호스트 아이디
    rCHECK   NUMBER(1) DEFAULT 0,       -- 후기 평점 여부
    PRIMARY KEY(rID),
    FOREIGN KEY(actID) REFERENCES ACTIVITY(actID),
    FOREIGN KEY(mID) REFERENCES MEMBER(mID),
    FOREIGN KEY(hID) REFERENCES HOST(hID)
);

CREATE SEQUENCE REVIEW_LIKE_SQ -- 후기 좋아요 시퀀스
    MAXVALUE 9999999
    NOCYCLE
    NOCACHE;

CREATE TABLE REVIEW_LIKE ( -- 후기 좋아요 테이블
    rlNO    NUMBER(7),              -- 순차번호
    rID     NUMBER(7),              -- 후기 번호
    mID     VARCHAR2(50),           -- 멤버 아이디
    rlCHECK NUMBER(1) DEFAULT 1,    -- 후기 좋아요 여부
    actID   NUMBER(7),              -- 액티비티 번호
    PRIMARY KEY(rlNO),
    FOREIGN KEY(rID) REFERENCES REVIEW(rID),
    FOREIGN KEY(mID) REFERENCES MEMBER(mID),
    FOREIGN KEY(actID) REFERENCES ACTIVITY(actID)
);

CREATE SEQUENCE ACTIVITY_RESERVE_SQ -- 액티비티 예약 시퀀스
    MAXVALUE 9999999999
    NOCYCLE
    NOCACHE;

CREATE TABLE ACTIVITY_RESERVE ( -- 액티비티 예약 테이블
    arID        NUMBER(10),             -- 순차번호
    hID         VARCHAR2(50) NOT NULL,  -- 호스트 아이디
    mID         VARCHAR2(50) NOT NULL,  -- 멤버 아이디
    actID       NUMBER(7) NOT NULL,     -- 액티비티 아이디
    eNO         NUMBER(10) NOT NULL,    -- 액티비티 일정 번호
    arCHECK     NUMBER(1) DEFAULT 0,    -- 출석체크 여부
    arRDATE     DATE DEFAULT SYSDATE,   -- 액티비티 예약일
    arCHECKDATE DATE DEFAULT SYSDATE,   -- 출석체크 처리일
    PRIMARY KEY(arID),
    FOREIGN KEY(hID) REFERENCES HOST(hID),
    FOREIGN KEY(mID) REFERENCES MEMBER(mID),
    FOREIGN KEY(actID) REFERENCES ACTIVITY(actID),
    FOREIGN KEY(eNO) REFERENCES actEVENTDATE(eNO)
);

CREATE SEQUENCE ORDERS_SQ -- 예약 시퀀스
    MAXVALUE 9999999999
    NOCACHE
    NOCYCLE;
    
CREATE TABLE ORDERS( -- 예약 테이블
    ONO NUMBER(10) PRIMARY KEY,                     -- 순차번호
    OPRICE NUMBER(10) NOT NULL,                     -- 가격
    OQTY NUMBER(10),                                -- 수량
    mID VARCHAR2(50) REFERENCES MEMBER(mID),        -- 멤버 아이디
    actID NUMBER(7) REFERENCES ACTIVITY(actID),     -- 액티비티 번호
    eNO NUMBER(10) REFERENCES actEVENTDATE(eNO),    -- 액티비티 일정 번호
    arCHECK NUMBER(1) DEFAULT 0,                    -- 체크 여부
    oTYPE VARCHAR2(50) NOT NULL                     -- 예약 타입
    );
     
CREATE SEQUENCE NOTICE_SQ -- 공지 시퀀스
    MAXVALUE 9999999
    NOCYCLE
    NOCACHE;

CREATE TABLE NOTICE ( -- 공지 테이블
    NNO      NUMBER(7),                 -- 공지 번호
    NTYPE      VARCHAR2(50) NOT NULL,   -- 공지 타입
    nTITLE   VARCHAR2(100) NOT NULL,    -- 공\글 제목
    nCONTENT CLOB NOT NULL,             -- 글 내용
    NRGROUP NUMBER(10),                 -- 글 그룹
    NSTEP  NUMBER(10),                  -- 글 스텝
    NINDENT NUMBER(10),                 -- 글 들여쓰기
    nRDATE   DATE DEFAULT SYSDATE ,     -- 글 작성일
    NIMG VARCHAR2(100),                 -- 글 이미지
    PRIMARY KEY(nNO)
);

COMMIT;