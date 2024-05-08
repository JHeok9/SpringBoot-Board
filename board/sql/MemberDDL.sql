-- 테이블 생성 SQL - member
CREATE TABLE member
(
    member_id      INT             NOT NULL, 
    name           VARCHAR2(45)    NOT NULL, 
    password       VARCHAR2(45)    NOT NULL, 
    member_name    VARCHAR2(50)    NOT NULL, 
    CONSTRAINT PK_member PRIMARY KEY (member_id)
);

-- Auto Increment를 위한 Sequence 추가 SQL - member.member_id
CREATE SEQUENCE member_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - member.member_id
CREATE OR REPLACE TRIGGER MEMBER_AI_TRG
BEFORE INSERT ON member 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT member_SEQ.NEXTVAL
    INTO :NEW.member_id
    FROM DUAL;
END;

-- DROP TRIGGER member_AI_TRG; 

-- DROP SEQUENCE member_SEQ; 

-- 테이블 Comment 설정 SQL - member
COMMENT ON TABLE member IS '회원';

-- 컬럼 Comment 설정 SQL - member.member_id
COMMENT ON COLUMN member.member_id IS '회원 ID';

-- 컬럼 Comment 설정 SQL - member.name
COMMENT ON COLUMN member.name IS '회원 아이디';

-- 컬럼 Comment 설정 SQL - member.password
COMMENT ON COLUMN member.password IS '회원 비밀번호';

-- 컬럼 Comment 설정 SQL - member.member_name
COMMENT ON COLUMN member.member_name IS '회원 이름';

-- Index 설정 SQL - member(member_id)
CREATE INDEX blog_user_Index_1
    ON member(member_id);

-- Index 설정 SQL - member(password)
CREATE INDEX blog_user_Index_2
    ON member(password);