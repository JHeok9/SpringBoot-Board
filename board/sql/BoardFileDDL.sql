-- 테이블 생성 SQL - board_file
CREATE TABLE board_file
(
    file_id      INT               NOT NULL, 
    board_id     INT               NOT NULL, 
    file_name    VARCHAR2(4000)    NOT NULL, 
    reg_date     TIMESTAMP         NOT NULL, 
    CONSTRAINT PK_board_file PRIMARY KEY (file_id)
);

-- Auto Increment를 위한 Sequence 추가 SQL - board_file.file_id
CREATE SEQUENCE board_file_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - board_file.file_id
CREATE OR REPLACE TRIGGER board_file_AI_TRG
BEFORE INSERT ON board_file 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT board_file_SEQ.NEXTVAL
    INTO :NEW.file_id
    FROM DUAL;
END;

-- DROP TRIGGER board_file_AI_TRG; 

-- DROP SEQUENCE board_file_SEQ; 

-- 테이블 Comment 설정 SQL - board_file
COMMENT ON TABLE board_file IS '회원 상세';

-- 컬럼 Comment 설정 SQL - board_file.file_id
COMMENT ON COLUMN board_file.file_id IS '파일 ID. 회원 아이디';

-- 컬럼 Comment 설정 SQL - board_file.board_id
COMMENT ON COLUMN board_file.board_id IS '게시글 ID';

-- 컬럼 Comment 설정 SQL - board_file.file_name
COMMENT ON COLUMN board_file.file_name IS '파일 이름';

-- 컬럼 Comment 설정 SQL - board_file.reg_date
COMMENT ON COLUMN board_file.reg_date IS '등록일';

-- Foreign Key 설정 SQL - board_file(board_id) -> board(board_id)
ALTER TABLE board_file
    ADD CONSTRAINT FK_board_file_board_id FOREIGN KEY (board_id)
        REFERENCES board (board_id) ;

-- Foreign Key 삭제 SQL - board_file(board_id)
-- ALTER TABLE board_file
-- DROP CONSTRAINT FK_board_file_board_id;