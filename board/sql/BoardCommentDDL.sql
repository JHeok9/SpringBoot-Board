-- 테이블 생성 SQL - board_comment
CREATE TABLE board_comment
(
    comment_id        INT               NOT NULL, 
    member_id         INT               NOT NULL, 
    board_id          INT               NOT NULL, 
    is_reply_to_id    INT               NOT NULL, 
    content           VARCHAR2(4000)    NOT NULL, 
    reg_date          TIMESTAMP         NOT NULL, 
    CONSTRAINT PK_board_comment PRIMARY KEY (comment_id, member_id)
);

-- Auto Increment를 위한 Sequence 추가 SQL - board_comment.comment_id
CREATE SEQUENCE board_comment_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - board_comment.comment_id
CREATE OR REPLACE TRIGGER board_comment_AI_TRG
BEFORE INSERT ON board_comment 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT board_comment_SEQ.NEXTVAL
    INTO :NEW.comment_id
    FROM DUAL;
END;

-- DROP TRIGGER board_comment_AI_TRG; 

-- DROP SEQUENCE board_comment_SEQ; 

-- 테이블 Comment 설정 SQL - board_comment
COMMENT ON TABLE board_comment IS '댓글';

-- 컬럼 Comment 설정 SQL - board_comment.comment_id
COMMENT ON COLUMN board_comment.comment_id IS '댓글 ID';

-- 컬럼 Comment 설정 SQL - board_comment.member_id
COMMENT ON COLUMN board_comment.member_id IS '회원 ID. 비회원 댓글 가능';

-- 컬럼 Comment 설정 SQL - board_comment.board_id
COMMENT ON COLUMN board_comment.board_id IS '게시글 ID';

-- 컬럼 Comment 설정 SQL - board_comment.is_reply_to_id
COMMENT ON COLUMN board_comment.is_reply_to_id IS '원본 댓글 아이디';

-- 컬럼 Comment 설정 SQL - board_comment.content
COMMENT ON COLUMN board_comment.content IS '댓글 내용';

-- 컬럼 Comment 설정 SQL - board_comment.reg_date
COMMENT ON COLUMN board_comment.reg_date IS '등록일';

-- Index 설정 SQL - board_comment(board_id)
CREATE INDEX blog_comment_Index_2
    ON board_comment(board_id);

-- Index 설정 SQL - board_comment(comment_id)
CREATE INDEX blog_comment_Index_1
    ON board_comment(comment_id);

-- Index 설정 SQL - board_comment(member_id)
CREATE INDEX blog_comment_Index_3
    ON board_comment(member_id);

-- Foreign Key 설정 SQL - board_comment(member_id) -> member(member_id)
ALTER TABLE board_comment
    ADD CONSTRAINT FK_board_comment_member_id FOREIGN KEY (member_id)
        REFERENCES member (member_id) ;

-- Foreign Key 삭제 SQL - board_comment(member_id)
-- ALTER TABLE board_comment
-- DROP CONSTRAINT FK_board_comment_member_id_;

-- Foreign Key 설정 SQL - board_comment(board_id) -> board(board_id)
ALTER TABLE board_comment
    ADD CONSTRAINT FK_board_comment_board_id FOREIGN KEY (board_id)
        REFERENCES board (board_id) ;

-- Foreign Key 삭제 SQL - board_comment(board_id)
-- ALTER TABLE board_comment
-- DROP CONSTRAINT FK_board_comment_board_id