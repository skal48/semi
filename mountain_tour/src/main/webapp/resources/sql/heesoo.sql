-- 시퀀스
DROP SEQUENCE INQUIRY_SEQ;
DROP SEQUENCE ANSWER_SEQ;
DROP SEQUENCE FAQ_SEQ;

CREATE SEQUENCE INQUIRY_SEQ NOCACHE;
CREATE SEQUENCE ANSWER_SEQ NOCACHE;
CREATE SEQUENCE FAQ_SEQ NOCACHE;

-- 테이블

DROP TABLE FAQ_T;
DROP TABLE INQUIRY_ANSWER_T;
DROP TABLE INQUIRY_T;

-- 문의하기 테이블
CREATE TABLE INQUIRY_T (
    INQUIRY_NO       NUMBER             NOT NULL,           -- 문의번호         (PK)
    USER_NO          NUMBER             NOT NULL,           -- 회원번호(작성자) (FK)
    PRODUCT_NO       NUMBER             NULL,               -- 상품번호         (FK)
    INQUIRY_TITLE    VARCHAR2(100 BYTE) NULL,               -- 제목
    INQUIRY_CONTENTS CLOB               NULL,               -- 내용
    IP               VARCHAR2(30 BYTE)  NULL,               -- IP주소
    CREATED_AT       DATE               NULL,               -- 작성일
    CONSTRAINT PK_INQUIRY PRIMARY KEY(INQUIRY_NO),
    CONSTRAINT FK_USER_INQUIRY FOREIGN KEY(USER_NO) REFERENCES USER_T(USER_NO) ON DELETE CASCADE,
    CONSTRAINT FK_PRODUCT_INQUIRY FOREIGN KEY(PRODUCT_NO) REFERENCES PRODUCT_T(PRODUCT_NO) ON DELETE SET NULL
);


-- 문의하기-답변 테이블
CREATE TABLE INQUIRY_ANSWER_T (
    ANSWER_NO   NUMBER             NOT NULL,   -- 답변번호           (PK)
    INQUIRY_NO  NUMBER             NOT NULL,   -- 문의번호           (FK)
    USER_NO     NUMBER             NULL,       -- 작성자(관리자)번호 (FK)
    CONTENTS    CLOB               NULL,       -- 내용
    CREATED_AT  DATE               NULL,       -- 작성일
    MODIFIED_AT DATE               NULL,       -- 수정일
    CONSTRAINT PK_ANSWER PRIMARY KEY(ANSWER_NO),
    CONSTRAINT FK_INQUIRY_ANSWER FOREIGN KEY(INQUIRY_NO) REFERENCES INQUIRY_T(INQUIRY_NO) ON DELETE CASCADE,
    CONSTRAINT FK_USER_ANSWER FOREIGN KEY(USER_NO) REFERENCES USER_T(USER_NO) ON DELETE SET NULL
);

-- 자주묻는질문 테이블
CREATE TABLE FAQ_T (
    FAQ_NO      NUMBER             NOT NULL,   -- 글번호 (PK)
    TITLE       VARCHAR2(100 BYTE) NULL,       -- 제목
    CONTENTS    CLOB               NULL,       -- 내용
    CREATED_AT  DATE               NULL,       -- 작성일
    MODIFIED_AT DATE               NULL,       -- 수정일
    CONSTRAINT PK_FAQ PRIMARY KEY(FAQ_NO)
);












