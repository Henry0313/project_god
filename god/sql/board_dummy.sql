----- Faq TABLE
CREATE TABLE faq(
    faq_id NUMBER(11) NOT NULL,
    member_id VARCHAR2(45) NOT NULL,
    faq_title VARCHAR2(100) NOT NULL,
    faq_content VARCHAR2(1000),
    faq_readcount NUMBER(11),
    faq_date DATE DEFAULT SYSDATE,
    CONSTRAINT pk_faq PRIMARY KEY (faq_id),
    CONSTRAINT fk_faq FOREIGN KEY (member_id)
    REFERENCES member(member_id)
);

DROP TABLE faq;

CREATE SEQUENCE faq_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE;

DROP SEQUENCE faq_seq;

INSERT INTO faq 
	(faq_id,
	 member_id,
	 faq_title,
	 faq_content,
	 faq_readcount)
VALUES (faq_seq.nextval,
		'admin_user',
		'제목입니당ㅋ',
		'내용입니당',
		0);
           
----- Qna Product TABLE

CREATE TABLE qna_product (
	qna_product_id NUMBER(11) NOT NULL,
	member_id VARCHAR2(45) NOT NULL,
	qna_product_pw VARCHAR2(20) NOT NULL,
	qna_product_title VARCHAR2(100) NOT NULL,
	qna_product_content VARCHAR2(2000),
	qna_product_file VARCHAR2(50),
	qna_product_re_ref NUMBER NOT NULL,
	qna_product_re_lev NUMBER NOT NULL,
	qna_product_re_seq NUMBER NOT NULL,
	qna_product_readcount NUMBER(11) DEFAULT 0,
	qna_product_date DATE DEFAULT sysdate,
    CONSTRAINT pk_qna_product PRIMARY KEY (qna_product_id),
    CONSTRAINT fk_qna_product FOREIGN KEY (member_id)
    REFERENCES member(member_id)
);

-- Qna Product Table content 컬럼 특성 변경
ALTER TABLE qna_product ADD qna_product_contents CLOB;

UPDATE qna_product SET qna_product_contents = qna_product_content;

ALTER TABLE qna_product DROP COLUMN qna_product_content;

ALTER TABLE qna_product RENAME COLUMN qna_product_contents TO qna_product_content;


DROP TABLE qna_product;

CREATE SEQUENCE qna_product_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE;

DROP SEQUENCE qna_product_seq;

INSERT INTO qna_product 
	(qna_product_id,
	 member_id,
	 qna_product_pw,
	 qna_product_title,
	 qna_product_content,
	 qna_product_file,
	 qna_product_re_ref,
	 qna_product_re_lev,
	 qna_product_re_seq)
VALUES (qna_product_seq.nextval,
		'admin_user',
		'#Abcd1234',
		'제목입니당ㅋ',
		'내용입니당',
		'file',
		0,
		0,
		0);