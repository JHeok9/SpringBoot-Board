-- 테이블 생성 SQL - board
CREATE TABLE board
(
    board_id       INT              NOT NULL, 
    member_id      INT              NOT NULL, 
    title          VARCHAR2(255)    NOT NULL, 
    content        CLOB             NULL, 
    reg_date       TIMESTAMP        NOT NULL, 
    views          INT              NOT NULL, 
    update_date    TIMESTAMP        NULL, 
    delete_date    TIMESTAMP        NULL, 
    CONSTRAINT PK_board PRIMARY KEY (board_id)
);

-- Auto Increment를 위한 Sequence 추가 SQL - board.board_id
CREATE SEQUENCE board_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - board.board_id
CREATE OR REPLACE TRIGGER board_AI_TRG
BEFORE INSERT ON board 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT board_SEQ.NEXTVAL
    INTO :NEW.board_id
    FROM DUAL;
END;

-- DROP TRIGGER board_AI_TRG; 

-- DROP SEQUENCE board_SEQ; 

-- 테이블 Comment 설정 SQL - board
COMMENT ON TABLE board IS '게시글';

-- 컬럼 Comment 설정 SQL - board.board_id
COMMENT ON COLUMN board.board_id IS '게시글 ID';

-- 컬럼 Comment 설정 SQL - board.member_id
COMMENT ON COLUMN board.member_id IS '게시글 작성자';

-- 컬럼 Comment 설정 SQL - board.title
COMMENT ON COLUMN board.title IS '게시글 제목';

-- 컬럼 Comment 설정 SQL - board.content
COMMENT ON COLUMN board.content IS '게시글 내용';

-- 컬럼 Comment 설정 SQL - board.reg_date
COMMENT ON COLUMN board.reg_date IS '작성일';

-- 컬럼 Comment 설정 SQL - board.views
COMMENT ON COLUMN board.views IS '조회수';

-- 컬럼 Comment 설정 SQL - board.update_date
COMMENT ON COLUMN board.update_date IS '수정일';

-- 컬럼 Comment 설정 SQL - board.delete_date
COMMENT ON COLUMN board.delete_date IS '삭제일';

-- Index 설정 SQL - board(board_id)
CREATE INDEX blog_post_Index_1
    ON board(board_id);

-- Foreign Key 설정 SQL - board(member_id) -> member(member_id)
ALTER TABLE board
    ADD CONSTRAINT FK_board_member_id FOREIGN KEY (member_id)
        REFERENCES member (member_id) ;

-- Foreign Key 삭제 SQL - board(member_id)
-- ALTER TABLE board
-- DROP CONSTRAINT FK_board_member_id