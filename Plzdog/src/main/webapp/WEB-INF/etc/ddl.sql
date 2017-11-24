-- 회원 테이블
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;

CREATE TABLE MEMBER (
	EMAIL VARCHAR2(100) PRIMARY KEY, /* 이메일 */
	MEMBER_NAME VARCHAR2(30) NOT NULL, /* 이름 */
	PASSWORD VARCHAR2(80) NOT NULL, /* 비밀번호 */
	MAIN_ADDRESS VARCHAR2(100) NOT NULL, /* 기본주소 */
	SUB_ADDRESS VARCHAR2(100) NOT NULL, /* 상세주소 */
	ZIPCODE NUMBER(5) NOT NULL, /* 우편번호 */
	MEMBER_IMAGE VARCHAR2(100), /* 이미지 */
	PHONENUM VARCHAR2(20) NOT NULL, /* 연락처 */
	MEMBER_ENABLE NUMBER(1) DEFAULT 1 NOT NULL
);

insert into member values('suil@naver.com','김동수','1111','서울','마포',12345,'image1','010-7123-1223',0);
insert into member values('suil1@naver.com','김상민','1121','서울','마포',12345,'image1','010-7123-1223',0);
insert into member values('suil2@naver.com','김장미','1131','서울','마포',12345,'image1','010-7123-1223',0);
insert into member values('suil3@naver.com','김수미','1141','서울','마포',12345,'image1','010-7123-1223',0);

select * from member

-- 권한 테이블
DROP TABLE AUTHORITY 
	CASCADE CONSTRAINTS;

CREATE TABLE AUTHORITY (
	EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	AUTHORITY VARCHAR2(20) NOT NULL, /* 권한 */
	CONSTRAINT PK_AUTHORITY PRIMARY KEY(EMAIL,AUTHORITY),
	CONSTRAINT FK_AUTHORITY_MEMBER FOREIGN KEY(EMAIL) REFERENCES MEMBER ON DELETE CASCADE
);

insert into AUTHORITY values('suil@naver.com','ROLE_USER');
insert into AUTHORITY values('suil@naver.com','ROLE_ADMIN');
insert into AUTHORITY values('suil@naver.com','ROLE_SITTER');
insert into AUTHORITY values('suil1@naver.com','ROLE_USER');
insert into AUTHORITY values('suil2@naver.com','ROLE_USER');
insert into AUTHORITY values('suil3@naver.com','ROLE_USER');

select * from AUTHORITY

--코드 테이블
DROP TABLE CODE 
	CASCADE CONSTRAINTS;

CREATE TABLE CODE (
	CODE VARCHAR2(20) PRIMARY KEY, /* 코드 */
	CODE_NAME VARCHAR2(100) NOT NULL, /* 코드이름 */
	CATEGORY VARCHAR2(100) NOT NULL /* 카테고리 */
);

insert into code values('code-1','반려동물 경험 유무','시터');
insert into code values('code-2','펫트너 집에서 보살필 수 있어요','시터');
insert into code values('code-3','고객의 집에서 보살필 수 있어요','시터');
insert into code values('code-4','투약가능','시터');
insert into code values('code-5','노령견 케어 가능','시터');
insert into code values('code-6','퍼피 케어 가능','시터');
insert into code values('code-8','환자 모니터링 가능','시터');
INSERT INTO CODE VALUES('code-7','배변활동','강아지');
INSERT INTO CODE VALUES('code-9','심장사상충','강아지');
INSERT INTO CODE VALUES('code-10'l,'당뇨','강아지');

select * from code

-- 시퀀스 생성
drop sequence Dog_num_seq;
create sequence dog_num_seq;

-- 강아지 테이블
DROP TABLE DOG 
	CASCADE CONSTRAINTS;

CREATE TABLE DOG (
	DOG_ID NUMBER(5) PRIMARY KEY, /* 강아지ID */
	DOG_NAME VARCHAR2(30) NOT NULL, /* 이름 */
	SPECIES VARCHAR2(50) NOT NULL, /* 종 */
	GENDER VARCHAR2(50) NOT NULL, /* 성별 */
	WEIGHT NUMBER(3, 1) NOT NULL, /* 몸무게 */
	BIRTH DATE NOT NULL, /* 생년월일 */
	CODE VARCHAR2(20) NOT NULL, /* 코드 */
	EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	CONSTRAINT FK_DOG_CODE FOREIGN KEY(CODE) REFERENCES CODE ON DELETE CASCADE,
	CONSTRAINT FK_DOG_MEMBER FOREIGN KEY(EMAIL) REFERENCES MEMBER ON DELETE CASCADE
);

INSERT INTO DOG VALUES(dog_num_seq,'미륵','비숑','암컷',3.5,'20100608',select code form code where code.code = 1,'suil@naver.com');
INSERT INTO DOG VALUES(dog_num_seq,'미륵1','슈바이처','암컷',4.5,'20100608',select code form code where code.code = 2,'suil@naver.com');
INSERT INTO DOG VALUES(dog_num_seq,'미륵2','진돗개','수컷',5.5,'20100608',select code form code where code.code = 3,'suil@naver.com');
INSERT INTO DOG VALUES(dog_num_seq,'미륵3','삽살개','투컷',6.5,'20100608',select code form code where code.code = 4,'suil@naver.com');
INSERT INTO DOG VALUES(dog_num_seq,'미륵3','삽살개','투컷',6.5,'20100608',select code form code where code.code = 5,'suil@naver.com');

SELECT C.CODE_NAME, D.DOG_NAME FROM DOG D , CODE C, DOGINFO I WHERE D.DOG_ID = I.DOG_ID AND I.CODE = C.CODE 

--강아지정보 테이블
DROP TABLE DOGINFO 
	CASCADE CONSTRAINTS;

/* 강아지정보 */
CREATE TABLE DOGINFO (
	DOG_ID NUMBER(5) NOT NULL, /* 강아지ID */
	CODE VARCHAR2(20) NOT NULL, /* 코드 */
	CONSTRAINT FK_DOGINFO_DOG FOREIGN KEY(DOG_ID) REFERENCES DOG ON DELETE CASCADE,
	CONSTRAINT FK_DOGINFO_CODE FOREIGN KEY(CODE) REFERENCES CODE ON DELETE CASCADE
);

INSERT INTO DOGINFO VALUES('1','8');
INSERT INTO DOGINFO VALUES('1','9');
INSERT INTO DOGINFO VALUES('1','10');
INSERT INTO DOGINFO VALUES('5','1');

SELECT * FROM DOGINFO

-- 강아지 이미지 테이블 
DROP TABLE DOG_IMAGE 
	CASCADE CONSTRAINTS		
		
CREATE TABLE DOG_IMAGE (
	DOG_IMAGE VARCHAR2(100) NOT NULL, /* 이미지이름(경로) */
	DOG_ID NUMBER(5) NOT NULL, /* 강아지ID */
	CONSTRAINT FK_DOG_IMAGE_DOG FOREIGN KEY(DOG_ID) REFERENCES DOG ON DELETE CASCADE
);

INSERT INTO DOG_IMAGE VALUES('SDFLKJSDFL','1');
INSERT INTO DOG_IMAGE VALUES('SDLFKJLVKJSD','1');
INSERT INTO DOG_IMAGE VALUES('QWEOUWEORE3TER','1');
INSERT INTO DOG_IMAGE VALUES('이미지 경로1 ','2');
INSERT INTO DOG_IMAGE VALUES('이미지 경로2 ','2');
INSERT INTO DOG_IMAGE VALUES('이미지 경로3 ','2');
INSERT INTO DOG_IMAGE VALUES('이미지 경로4 ','2');

SELECT DOG_IMAGE.DOG_ID, DOG_IMAGE.DOG_IMAGE  FROM DOG_IMAGE

-- 시터 테이블
DROP TABLE SITTER 
	CASCADE CONSTRAINTS;

CREATE TABLE SITTER (
	EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	SCHOOL VARCHAR2(50) NOT NULL, /* 학교이름 */
	CERTIFICATION VARCHAR2(100) NOT NULL, /* 증명서/면허증 */
	SERVICE_ADDRESS CLOB NOT NULL, /* 서비스가능지역 */
	SITTER_RATE NUMBER(2, 1), /* 평점 */
	CONSTRAINT PK_SITTER PRIMARY KEY(EMAIL),
	CONSTRAINT FK_SITTER_MEMBER FOREIGN KEY(EMAIL) REFERENCES MEMBER ON DELETE CASCADE
);

INSERT INTO SITTER VALUES('suil@naver.com','가천대학교','이미지경로1','서울,경기',3.6);
INSERT INTO SITTER VALUES('suil1@naver.com','대전대학교','이미지경로2','서울,천안',3.1);

SELECT * FROM SITTER
SELECT * FROM MEMBER

-- 스킬 테이블
DROP TABLE SKILL 
	CASCADE CONSTRAINTS;

/* 스킬 */
CREATE TABLE SKILL (
	EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	CODE_SKILL VARCHAR2(20) NOT NULL, /* 코드 */
	CONSTRAINT FK_SKILL_MEMBER FOREIGN KEY(EMAIL) REFERENCES SITTER ON DELETE CASCADE,
	CONSTRAINT FK_SKILL_CODE FOREIGN KEY(CODE_SKILL) REFERENCES CODE ON DELETE CASCADE
);

INSERT INTO SKILL VALUES('suil@naver.com',1);
INSERT INTO SKILL VALUES('suil@naver.com',2);
INSERT INTO SKILL VALUES('suil1@naver.com',3);
INSERT INTO SKILL VALUES('suil1@naver.com',4);

SELECT M.MEMBER_NAME,C.CODE_NAME 
FROM SITTER S, MEMBER M, SKILL L, CODE C 
WHERE S.EMAIL = 'suil1@naver.com' AND M.EMAIL = S.EMAIL 
AND S.EMAIL = L.EMAIL AND L.CODE_SKILL = C.CODE;

SELECT * FROM SITTER

-- 리뷰 테이블
DROP TABLE REVIEW 
	CASCADE CONSTRAINTS;

/* 리뷰 */
CREATE TABLE REVIEW (
	REVIEW_ID NUMBER(10) PRIMARY KEY, /* 리뷰ID */
	REVIEW_RATE NUMBER(1), /* 별점 */
	REVIEW_CONTENTS CLOB NOT NULL, /* 내용 */
	EMAIL VARCHAR2(100) NOT NULL, /* 견주_이메일 */
	EMAIL2 VARCHAR2(100) NOT NULL, /* 시터_이메일 */
	CONSTRAINT FK_REVIEW_MEMBER FOREIGN KEY(EMAIL) REFERENCES member ON DELETE CASCADE,
	CONSTRAINT FK_REVIEW_SITTER FOREIGN KEY(EMAIL2) REFERENCES member ON DELETE CASCADE
);

INSERT INTO REVIEW VALUES (1,3.5,'좋아요1','suil3@naver.com','suil@naver.com');
INSERT INTO REVIEW VALUES (2,3.5,'좋아요1','suil3@naver.com','suil1@naver.com');

SELECT * FROM MEMBER

-- 예약 테이블
DROP TABLE RESERVATION 
	CASCADE CONSTRAINTS;

/* 예약 */
CREATE TABLE RESERVATION (
	RES_ID NUMBER(10) PRIMARY KEY, /* 예약ID */
	RES_TYPE NUMBER(1) NOT NULL, /* 의뢰종류 */
	RES_SDATE DATE NOT NULL, /* 시작날짜 */
	RES_EDATE DATE NOT NULL, /* 종료날짜 */
	RES_CONTENTS CLOB NOT NULL, /* 의뢰내용 */
	EMAIL VARCHAR2(100) NOT NULL, /* 견주_이메일 */
	EMAIL2 VARCHAR2(100) NOT NULL, /* 시터_이메일 */
	CONSTRAINT FK_RESERVATION_MEMBER FOREIGN KEY(EMAIL) REFERENCES MEMBER ON DELETE CASCADE,
	CONSTRAINT FK_RESERVATION_SITTER FOREIGN KEY(EMAIL2) REFERENCES MEMBER ON DELETE CASCADE
);

insert into RESERVATION values(1,0,'2010/07/01','2010/07/02','집에서 맡기기','suil2@naver.com','suil@naver.com');
insert into RESERVATION values(2,1,'2010/07/01','2010/07/02','집에서 맡기기','suil2@naver.com','suil@naver.com');
insert into RESERVATION values(3,0,'2010/07/01','2010/07/02','집에서 맡기기','suil3@naver.com','suil1@naver.com');
insert into RESERVATION values(4,1,'2010/07/01','2010/07/02','집에서 맡기기','suil3@naver.com','suil1@naver.com');
	
select * from RESERVATION

/* 매출 */
DROP TABLE SALES 
	CASCADE CONSTRAINTS;

/* 매출 */
CREATE TABLE SALES (
	RES_ID NUMBER(10) NOT NULL, /* 예약ID */
	TOTAL NUMBER(15) NOT NULL, /* 총액 */
	PAY NUMBER(15), /* 시터 수입 */
	COMMISSION NUMBER(15) NOT NULL, /* 수수료 */
	SALES_DATE DATE NOT NULL, /* 결제날짜 */
	CONSTRAINT FK_SALES_RESERVATION FOREIGN KEY(RES_ID) REFERENCES RESERVATION ON DELETE CASCADE
);

insert into SALES values(1 ,100000 ,90000 ,10000, '2017/07/03');
insert into SALES values(2,100000,90000,10000,'2017/07/04');
insert into SALES values(3,100000,90000,10000,'2017/07/05');
insert into SALES values(4,100000,90000,10000,'2017/07/06');

select * from sales

-- 서비스 요구사항 테이블
DROP TABLE DEMAND 
	CASCADE CONSTRAINTS;

/* 서비스 요구사항 */
CREATE TABLE DEMAND (
	RES_ID NUMBER(10) NOT NULL, /* 예약ID */
	CODE VARCHAR2(20) NOT NULL, /* 코드 */
	CONSTRAINT FK_DEMAND_RESERVATION FOREIGN KEY(RES_ID) REFERENCES RESERVATION ON DELETE CASCADE,
	CONSTRAINT FK_DEMAND_CODE FOREIGN KEY(CODE) REFERENCES CODE ON DELETE CASCADE
);

insert into DEMAND values (1,1); 
insert into DEMAND values (1,2); 
insert into DEMAND values (1,3); 
insert into DEMAND values (1,4); 

select * from code

-- 돌봄일지 테이블
DROP TABLE CARE 
	CASCADE CONSTRAINTS;

/* 돌봄일지 */
CREATE TABLE CARE (
	CARE_ID NUMBER(10) PRIMARY KEY, /* 돌봄일지ID */
	CARE_CONTENTS CLOB NOT NULL, /* 내용 */
	RES_ID NUMBER(10) NOT NULL, /* 예약ID */
	CARE_DATE DATE NOT NULL, /* 작성일 */
	CONSTRAINT FK_CARE_RESERVATION FOREIGN KEY(RES_ID) REFERENCES RESERVATION ON DELETE CASCADE
);

insert into care values(1,'강아지가 너무 귀여워용',1,'2017/08/09')
insert into care values(2,'강아지가 너무 이뻐용',2,'2017/08/09')
insert into care values(3,'강아지가 너무 아름다워요',3,'2017/08/09')
insert into care values(4,'강아지가 너무 사랑스러워용',4,'2017/08/09')

-- 돌봄일지 이미지 테이블
DROP TABLE CARE_IMAGE 
	CASCADE CONSTRAINTS;

/* 돌봄일지 이미지 */
CREATE TABLE CARE_IMAGE (
	CARE_IMAGE VARCHAR2(30) NOT NULL, /* 이미지경로 */
	CARE_ID NUMBER(10) NOT NULL, /* 돌봄일지ID */
	CONSTRAINT FK_CARE_IMAGE_CARE FOREIGN KEY(CARE_ID) REFERENCES CARE ON DELETE CASCADE
);

insert into CARE_IMAGE values('돌봄이미지1',1);
insert into CARE_IMAGE values('돌봄이미지1',2);
insert into CARE_IMAGE values('돌봄이미지1',3);
