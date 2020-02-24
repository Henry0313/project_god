ALTER TABLE member 
ADD sms_check CHAR(1) DEFAULT 'Y';

ALTER TABLE member 
ADD email_check CHAR(1) DEFAULT 'Y';

ALTER TABLE member 
ADD forever_check CHAR(1) DEFAULT 'Y';