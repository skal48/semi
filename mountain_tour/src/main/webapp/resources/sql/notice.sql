DROP SEQUENCE NOTICE_SEQ;

CREATE SEQUENCE NOTICE_SEQ NOCACHE;

DROP TABLE NOTICE_T;


CREATE TABLE NOTICE_T (
    NOTICE_NO       NUMBER               NOT NULL, -- 공지 번호
    TITLE           VARCHAR2(100 BYTE),            -- 공지 제목
    CONTENTS        CLOB,                          -- 공지 내용
    CREATED_AT      DATE,                          -- 공지 작성일
    MODIFIED_AT     DATE,                          -- 공지 수정일
    HIT             NUMBER,                        -- 조회수
    CONSTRAINT PK_NOTICE_T PRIMARY KEY(NOTICE_NO)
    ); 




