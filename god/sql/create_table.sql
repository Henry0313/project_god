-- member TABLE
CREATE TABLE member (
    member_id VARCHAR2(45) NOT NULL,
    member_pw VARCHAR2(60) NOT NULL,
    member_name VARCHAR2(40) NOT NULL,
    member_phone VARCHAR2(20),
    member_cellphone VARCHAR2(20) NOT NULL,
    member_birth DATE NOT NULL,
    member_email VARCHAR2(40) NOT NULL,
    member_zip VARCHAR2(7) NOT NULL,
    member_Addr VARCHAR2(100),
    member_Addr_detail VARCHAR2(100),
    member_class VARCHAR2(10) NOT NULL,
    member_use_yn CHAR(1) DEFAULT 'Y',
    member_join_DATE DATE DEFAULT SYSDATE,
    enabled NUMBER(1) DEFAULT 1,
    sms_check CHAR(1) DEFAULT 'Y',
    email_check CHAR(1) DEFAULT 'Y',
    forever_check CHAR(1) DEFAULT 'Y',
    CONSTRAINT pk_member PRIMARY KEY (member_id)
);

-- member_roles TABLE
CREATE TABLE member_roles (
  member_role_id NUMBER(11) NOT NULL,
  member_id VARCHAR(45) NOT NULL,
  ROLE VARCHAR(45) NOT NULL,
  PRIMARY KEY (member_role_id),
  CONSTRAINT fk_member_id FOREIGN KEY (member_id)
     REFERENCES member (member_id)
);
 
CREATE SEQUENCE member_roles_seq
    START WITH 1
    INCREMENT BY 1
    maxvalue 99999
    nocycle;
 
DROP SEQUENCE member_roles_seq;   
   
 -- remember-me 항목(csrf token) 사용시 저장 선택적 생성
CREATE TABLE persistent_logins (
   username VARCHAR(64) NOT NULL,
   series VARCHAR(64) PRIMARY KEY,
   token VARCHAR(64) NOT NULL,
   last_used TIMESTAMP NOT NULL
); 

-- cart TABLE
CREATE TABLE cart(
    cart_id NUMBER(11) NOT NULL,
    member_id VARCHAR2(45) NOT NULL,
    product_id NUMBER(5) NOT NULL,
    cart_quan NUMBER(5) DEFAULT 1,
    cart_DATE DATE DEFAULT SYSDATE,
    cart_color VARCHAR2(100),
    cart_size VARCHAR2(100),
    CONSTRAINT pk_cart PRIMARY KEY (cart_id),
    CONSTRAINT fk_cart FOREIGN KEY (member_id)
    REFERENCES member(member_id),
    CONSTRAINT fk_cart2 FOREIGN KEY (product_id)
    REFERENCES product(product_id)
);

ALTER TABLE cart
ADD cart_color VARCHAR2(100);

-- category TABLE
CREATE TABLE category (
    cate_name VARCHAR2(100) NOT NULL,
    cate_code VARCHAR2(30) NOT NULL,
    cate_ref VARCHAR2(30),
    cate_lev NUMBER(22),
    CONSTRAINT pk_category PRIMARY KEY (cate_code)
);

-- faq TABLE
CREATE TABLE faq(
    faq_id NUMBER(11) NOT NULL,
    member_id VARCHAR2(45) NOT NULL,
    faq_title VARCHAR2(100) NOT NULL,
    faq_readcount NUMBER(11),
    faq_date DATE DEFAULT SYSDATE,
    faq_content CLOB,
    CONSTRAINT pk_faq PRIMARY KEY (faq_id),
    CONSTRAINT fk_faq FOREIGN KEY (member_id)
    REFERENCES member(member_id)
);

-- qna_product TABLE
CREATE TABLE qna_product (
	qna_product_id NUMBER(11) NOT NULL,
	member_id VARCHAR2(45) NOT NULL,
	qna_product_pw VARCHAR2(20) NOT NULL,
	qna_product_title VARCHAR2(100) NOT NULL,
	qna_product_file VARCHAR2(50),
	qna_product_re_ref NUMBER NOT NULL,
	qna_product_re_lev NUMBER NOT NULL,
	qna_product_re_seq NUMBER NOT NULL,
	qna_product_readcount NUMBER(11) DEFAULT 0,
	qna_product_date DATE DEFAULT sysdate,
	qna_product_content CLOB,
    CONSTRAINT pk_qna_product PRIMARY KEY (qna_product_id),
    CONSTRAINT fk_qna_product FOREIGN KEY (member_id)
    REFERENCES member(member_id)
);

-- orders TABLE
-- order_amount 총 가격
CREATE TABLE orders (
    order_id VARCHAR2(50) NOT NULL,
    member_id VARCHAR2(45) NOT NULL,
    order_name VARCHAR2(40) NOT NULL,
	order_zip VARCHAR2(7) NOT NULL,
    order_Addr VARCHAR2(100),
    order_Addr_detail VARCHAR2(100),
    order_phone VARCHAR2(20),
    order_cellphone VARCHAR2(20) NOT NULL,
    order_msg VARCHAR2(200),
    order_amount NUMBER NOT NULL,
    order_date DATE DEFAULT SYSDATE,
    order_delivery VARCHAR2(20) DEFAULT '배송준비중',
    CONSTRAINT pk_orders PRIMARY KEY (order_id),
    CONSTRAINT fk_orders FOREIGN KEY (member_id)
    REFERENCES member(member_id)
);

-- order_detail TABLE
CREATE TABLE order_detail(
    order_detail_id NUMBER(11) NOT NULL,
    order_id VARCHAR2(50) NOT NULL,
    product_id NUMBER(5) NOT NULL,
    cart_quan NUMBER(5),
    cart_color VARCHAR2(100),
    cart_size VARCHAR2(100),
    CONSTRAINT pk_order_detail PRIMARY KEY (order_detail_id),
    CONSTRAINT fk_order_detail FOREIGN KEY (order_id)
    REFERENCES orders(order_id),
    CONSTRAINT fk_order_detail2 FOREIGN KEY (product_id)
    REFERENCES product(product_id)
);

-- product TABLE
-- cate_name 카테고리
-- product_price1 원가
-- product_price2 판매가
-- product_info : 상품 노출 여부 D : 진열(display), H : 숨김(hide), S : 품절(sold-out)
CREATE TABLE product(
    product_id NUMBER(5) NOT NULL,
    product_name VARCHAR2(100) NOT NULL,
    product_price1 NUMBER(7) DEFAULT 0,
    product_price2 NUMBER(7) DEFAULT 0,
    product_img VARCHAR2(100) DEFAULT 'DEFAULT.jpg',
    product_thum_img VARCHAR2(100) DEFAULT 'DEFAULT.jpg',
    product_list_img VARCHAR2(100) DEFAULT 'DEFAULT.jpg',
    product_content CLOB,
    product_color VARCHAR2(100),
    product_size VARCHAR2(100),
    product_quan NUMBER(5) DEFAULT 0,
    product_DATE DATE DEFAULT SYSDATE,
    product_info CHAR(1) DEFAULT 'D',
    product_read_count NUMBER DEFAULT 0,
    product_delivery_fee CHAR(1) DEFAULT 'Y',
    cate_code VARCHAR2(30) NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY (product_id),
    CONSTRAINT fk_product FOREIGN KEY (cate_code)
    REFERENCES category(cate_code)
);

CREATE SEQUENCE product_seq 
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE;

DROP SEQUENCE product_seq;

INSERT INTO product (product_id, product_name, product_price1, product_price2, product_img, product_thum_img, product_list_img, product_content, product_color, product_size, product_quan, product_info, product_read_count, product_delivery_fee, cate_code)
VALUES (product_seq.nextval,'로즈 더블 롱코트',79000, 60000, 'default.jpg', 'default.jpg', 'default.jpg', '설명', 'black,red', '95,100', 100, 'D', 0, 'Y', '101' );

CREATE SEQUENCE orders_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE;

DROP SEQUENCE orders_seq;

CREATE SEQUENCE order_detail_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE;

DROP TABLE order_detail;

DROP SEQUENCE order_detail_seq;

-- wish_list TABLE
CREATE TABLE wish_list(
    wish_id NUMBER(11) NOT NULL,
    member_id VARCHAR2(45) NOT NULL,
    product_id NUMBER(5) NOT NULL,
    wish_quan NUMBER(5) DEFAULT 1,
    wish_DATE DATE DEFAULT SYSDATE,
    CONSTRAINT pk_wish_list PRIMARY KEY (wish_id),
    CONSTRAINT fk_wish_list FOREIGN KEY (member_id)
    REFERENCES member(member_id),
    CONSTRAINT fk_wish_list2 FOREIGN KEY (product_id)
    REFERENCES product(product_id)
);

-- review TABLE
CREATE TABLE review(
    review_id NUMBER(11) NOT NULL,
    member_id VARCHAR2(45) NOT NULL,
    review_title VARCHAR2(30) NOT NULL,
    review_eval NUMBER(2),
    review_content VARCHAR2(1000),
    review_reply VARCHAR2(1000),
    review_reply_yn CHAR(1) DEFAULT 'N',
    review_img VARCHAR2(50),
    review_DATE DATE DEFAULT SYSDATE,
    CONSTRAINT pk_review PRIMARY KEY (review_id),
    CONSTRAINT fk_review FOREIGN KEY (member_id)
    REFERENCES member(member_id)
);

CREATE TABLE class_upgrade(
    up_id NUMBER(11) NOT NULL,
    member_id VARCHAR2(45) NOT NULL,
    up_content VARCHAR2(1000),
    up_DATE DATE DEFAULT SYSDATE,
    CONSTRAINT pk_class_upgrade PRIMARY KEY (up_id),
    CONSTRAINT fk_class_upgrade FOREIGN KEY (member_id)
    REFERENCES member(member_id)
);

CREATE TABLE event(
    event_id NUMBER(11) NOT NULL,
    event_title VARCHAR2(30) NOT NULL,
    event_content VARCHAR2(1000),
    member_id VARCHAR2(45),
    event_reply CHAR(1),
    event_DATE DATE DEFAULT SYSDATE,
    event_reply_DATE DATE DEFAULT SYSDATE,
    CONSTRAINT pk_event PRIMARY KEY (event_id),
    CONSTRAINT fk_event FOREIGN KEY (member_id)
    REFERENCES member(member_id)
);

---------------------------------------------------------------

ALTER TABLE faq ADD(faq_date DATE DEFAULT SYSDATE);
ALTER TABLE faq MODIFY(faq_title VARCHAR2(100));
ALTER TABLE faq ADD(faq_file VARCHAR2(100));


--카테고리 테이블
CREATE TABLE category (
    cate_name VARCHAR2(100) NOT NULL,
    cate_code VARCHAR2(30) NOT NULL,
    cate_ref VARCHAR2(30),
    cate_lev NUMBER,
    CONSTRAINT pk_category PRIMARY KEY (cate_code)
);

DROP TABLE category;
DROP TABLE product;

INSERT INTO category (cate_name, cate_code)
VALUES ('OUTER','100');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('코트/트렌치코트','101','100');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('자켓','102','100');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('점퍼','103','100');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('가디건','104','100');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('집업','105','100');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('조끼','106','100');
INSERT INTO category (cate_name, cate_code)
VALUES ('TOP','200');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('긴팔티','201','200');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('맨투맨/후드','202','200');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('반팔티','203','200');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('니트','204','200');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('나시','205','200');
INSERT INTO category (cate_name, cate_code)
VALUES ('SHIRT','300');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('심플/베이직','301','300');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('체크/패턴/데님','302','300');
INSERT INTO category (cate_name, cate_code)
VALUES ('PANTS','400');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('슬랙스','401','400');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('밴딩팬츠','402','400');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('면바지','403','400');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('청바지','404','400');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('반바지','405','400');
INSERT INTO category (cate_name, cate_code)
VALUES ('SHOES','500');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('스니커즈','501','500');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('로퍼','502','500');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('부츠/워커','503','500');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('샌들','504','500');
INSERT INTO category (cate_name, cate_code)
VALUES ('BAG','600');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('백팩','601','600');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('토드백','602','600');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('크로스백','603','600');
INSERT INTO category (cate_name, cate_code)
VALUES ('ACC','700');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('목걸이/팔찌/반지','701','700');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('모자','702','700');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('안경/선글라스','703','700');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('양말','704','700');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('벨트','705','700');
INSERT INTO category (cate_name, cate_code, cate_ref)
VALUES ('기타','706','700');


-- 테이블 삭제
DROP TABLE qna;

-- 테이블 수정

 -- 컬럼 추가
ALTER TABLE member
ADD(member_id VARCHAR2(45));

 -- 컬럼 수정
ALTER TABLE qna
MODIFY(qna_id NUMBER(11) NOT NULL);

 -- 컬럼 이름 변경
ALTER TABLE member
RENAME COLUMN member_id to member_id2;

 -- 컬럼 삭제
ALTER TABLE member
DROP COLUMN member_id;


