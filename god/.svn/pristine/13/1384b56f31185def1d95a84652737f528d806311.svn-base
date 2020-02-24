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

-- example
-- pw : #Abcd1234
INSERT INTO member(member_id,member_pw,enabled,member_name,member_cellphone,member_birth,member_email,member_zip,member_class,sms_check,email_check,forever_check)
VALUES ('admin_user','$2a$10$YNPaVBGQmwbHpnSni/EwyeDGcvuuJH6f8j/uYOn7YTQSgnr8gv3W2', 1,'관리자','010-1234-5678','1991-01-01','admin@admin.com','12345','admin','Y','Y','Y');

INSERT INTO member(member_id,member_pw,enabled,member_name,member_cellphone,member_birth,member_email,member_zip,member_class,sms_check,email_check,forever_check)
VALUES ('oracle_1056','$2a$10$YNPaVBGQmwbHpnSni/EwyeDGcvuuJH6f8j/uYOn7YTQSgnr8gv3W2', 1,'성이민','010-1234-1056','1991-01-01','user56@abcd.com','12345','silver','Y','Y','Y');
 
INSERT INTO member_roles (member_role_id, member_id, ROLE)
VALUES (member_roles_seq.NEXTVAL, 'admin_user', 'ROLE_ADMIN');

INSERT INTO member_roles (member_role_id, member_id, ROLE)
VALUES (member_roles_seq.NEXTVAL, 'oracle_1056', 'ROLE_USER');

SELECT * FROM member;
SELECT * FROM member_roles;

DELETE 
  FROM member
 WHERE member_id='java111111';
 
DELETE
  FROM member_roles
 WHERE member_role_id='61';
