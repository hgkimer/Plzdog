------------------------------
--create

--회원 
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

-- 권한
CREATE TABLE AUTHORITY (
	EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	AUTHORITY VARCHAR2(20) NOT NULL, /* 권한 */
	CONSTRAINT PK_AUTHORITY PRIMARY KEY(EMAIL,AUTHORITY),
	CONSTRAINT FK_AUTHORITY_MEMBER FOREIGN KEY(EMAIL) REFERENCES MEMBER ON DELETE CASCADE
);

--코드
CREATE TABLE CODE (
	CODE VARCHAR2(20) PRIMARY KEY, /* 코드 */
	CODE_NAME VARCHAR2(100) NOT NULL, /* 코드이름 */
	CATEGORY VARCHAR2(100) NOT NULL /* 카테고리 */
);

--강아지
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

/* 강아지정보 */
CREATE TABLE DOGINFO (
	DOG_ID NUMBER(5) NOT NULL, /* 강아지ID */
	CODE VARCHAR2(20) NOT NULL, /* 코드 */
	CONSTRAINT FK_DOGINFO_DOG FOREIGN KEY(DOG_ID) REFERENCES DOG ON DELETE CASCADE,
	CONSTRAINT FK_DOGINFO_CODE FOREIGN KEY(CODE) REFERENCES CODE ON DELETE CASCADE
);

CREATE TABLE DOG_IMAGE (
	DOG_IMAGE VARCHAR2(100) NOT NULL, /* 이미지이름(경로) */
	DOG_ID NUMBER(5) NOT NULL, /* 강아지ID */
	CONSTRAINT FK_DOG_IMAGE_DOG FOREIGN KEY(DOG_ID) REFERENCES DOG ON DELETE CASCADE
);

--시터
CREATE TABLE SITTER (
	EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	SCHOOL VARCHAR2(50) NOT NULL, /* 학교이름 */
	CERTIFICATION VARCHAR2(100) NOT NULL, /* 증명서/면허증 */
	SERVICE_ADDRESS CLOB NOT NULL, /* 서비스가능지역 */
	SITTER_RATE NUMBER(2, 1), /* 평점 */
	CONSTRAINT PK_SITTER PRIMARY KEY(EMAIL),
	CONSTRAINT FK_SITTER_MEMBER FOREIGN KEY(EMAIL) REFERENCES MEMBER ON DELETE CASCADE
);

/* 스킬 */
CREATE TABLE SKILL (
	EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	CODE_SKILL VARCHAR2(20) NOT NULL, /* 코드 */
	CONSTRAINT FK_SKILL_MEMBER FOREIGN KEY(EMAIL) REFERENCES SITTER ON DELETE CASCADE,
	CONSTRAINT FK_SKILL_CODE FOREIGN KEY(CODE_SKILL) REFERENCES CODE ON DELETE CASCADE
);

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
	
/* 매출 */
CREATE TABLE SALES (
	RES_ID NUMBER(10) NOT NULL, /* 예약ID */
	TOTAL NUMBER(15) NOT NULL, /* 총액 */
	PAY NUMBER(15), /* 시터 수입 */
	COMMISSION NUMBER(15) NOT NULL, /* 수수료 */
	SALES_DATE DATE NOT NULL, /* 결제날짜 */
	CONSTRAINT FK_SALES_RESERVATION FOREIGN KEY(RES_ID) REFERENCES RESERVATION ON DELETE CASCADE
);

/* 서비스 요구사항 */
CREATE TABLE DEMAND (
	RES_ID NUMBER(10) NOT NULL, /* 예약ID */
	CODE VARCHAR2(20) NOT NULL, /* 코드 */
	CONSTRAINT FK_DEMAND_RESERVATION FOREIGN KEY(RES_ID) REFERENCES RESERVATION ON DELETE CASCADE,
	CONSTRAINT FK_DEMAND_CODE FOREIGN KEY(CODE) REFERENCES CODE ON DELETE CASCADE
);

/* 돌봄일지 */
CREATE TABLE CARE (
	CARE_ID NUMBER(10) PRIMARY KEY, /* 돌봄일지ID */
	CARE_CONTENTS CLOB NOT NULL, /* 내용 */
	RES_ID NUMBER(10) NOT NULL, /* 예약ID */
	CARE_DATE DATE NOT NULL, /* 작성일 */
	CONSTRAINT FK_CARE_RESERVATION FOREIGN KEY(RES_ID) REFERENCES RESERVATION ON DELETE CASCADE
);

/* 돌봄일지 이미지 */
CREATE TABLE CARE_IMAGE (
	CARE_IMAGE VARCHAR2(30) NOT NULL, /* 이미지경로 */
	CARE_ID NUMBER(10) NOT NULL, /* 돌봄일지ID */
	CONSTRAINT FK_CARE_IMAGE_CARE FOREIGN KEY(CARE_ID) REFERENCES CARE ON DELETE CASCADE
);

--------------------------------------------------
--delete table

-- 회원 테이블
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;
	
-- 권한 테이블
DROP TABLE AUTHORITY 
	CASCADE CONSTRAINTS;	

--코드 테이블
DROP TABLE CODE 
	CASCADE CONSTRAINTS;

-- 강아지 테이블
DROP TABLE DOG 
	CASCADE CONSTRAINTS;

--강아지정보 테이블
DROP TABLE DOGINFO 
	CASCADE CONSTRAINTS;

-- 강아지 이미지 테이블 
DROP TABLE DOG_IMAGE 
	CASCADE CONSTRAINTS;	

-- 시터 테이블
DROP TABLE SITTER 
	CASCADE CONSTRAINTS;

-- 스킬 테이블
DROP TABLE SKILL 
	CASCADE CONSTRAINTS;

-- 리뷰 테이블
DROP TABLE REVIEW 
	CASCADE CONSTRAINTS;

-- 예약 테이블
DROP TABLE RESERVATION 
	CASCADE CONSTRAINTS;

--매출 테이블
DROP TABLE SALES 
	CASCADE CONSTRAINTS;

-- 서비스 요구사항 테이블
DROP TABLE DEMAND 
	CASCADE CONSTRAINTS;

-- 돌봄일지 테이블
DROP TABLE CARE 
	CASCADE CONSTRAINTS;

-- 돌봄일지 이미지 테이블
DROP TABLE CARE_IMAGE 
	CASCADE CONSTRAINTS;
	
--------------------------------------------------
-- 시퀀스

--강아지 시퀀스 생성
drop sequence Dog_num_seq;
create sequence dog_num_seq;	

--예약 시퀀스 생성
drop sequence RESERVATION_num_seq;
create sequence RESERVATION_num_seq;

--돌봄일지 시퀀스 생성
drop sequence CARE_num_seq;
create sequence CARE_num_seq;	

---------------------------------------------------
-- INSERT

-- MEMBER
insert into member values('suil@naver.com','김동수','1111','서울','마포',12345,'image1','010-7123-1223',0);
insert into member values('suil1@naver.com','김상민','1121','서울','마포',12345,'image1','010-7123-1223',0);
insert into member values('suil2@naver.com','김장미','1131','서울','마포',12345,'image1','010-7123-1223',0);
insert into member values('suil3@naver.com','김수미','1141','서울','마포',12345,'image1','010-7123-1223',0);

-- 권한
insert into AUTHORITY values('suil@naver.com','ROLE_USER');
insert into AUTHORITY values('suil@naver.com','ROLE_ADMIN');
insert into AUTHORITY values('suil@naver.com','ROLE_SITTER');
insert into AUTHORITY values('suil1@naver.com','ROLE_USER');
insert into AUTHORITY values('suil2@naver.com','ROLE_USER');
insert into AUTHORITY values('suil3@naver.com','ROLE_USER');

-- 코드 테이블 
insert into code values('code-1','반려동물 경험 유무','시터');
insert into code values('code-2','펫트너 집에서 보살필 수 있어요','시터');
insert into code values('code-3','고객의 집에서 보살필 수 있어요','시터');
insert into code values('code-4','투약가능','시터');
insert into code values('code-5','노령견 케어 가능','시터');
insert into code values('code-6','퍼피 케어 가능','시터');
insert into code values('code-8','환자 모니터링 가능','시터');
INSERT INTO CODE VALUES('code-7','배변활동','강아지');
INSERT INTO CODE VALUES('code-9','심장사상충','강아지');
INSERT INTO CODE VALUES('code-10','당뇨','강아지');
insert into code values('code-11','투약여부','예약');
insert into code values('code-12','도그워킹','예약');
insert into code values('code-13','강아지목욕','예약');

--강아지
INSERT INTO DOG VALUES(dog_num_seq.nextval,'미륵','비숑','암컷',3.5,'20100608','code-1','suil@naver.com');
INSERT INTO DOG VALUES(dog_num_seq.nextval,'미륵1','슈바이처','암컷',4.5,'20100608','code-2','suil@naver.com');
INSERT INTO DOG VALUES(dog_num_seq.nextval,'미륵2','진돗개','수컷',5.5,'20100608','code-3','suil@naver.com');
INSERT INTO DOG VALUES(dog_num_seq.nextval,'미륵3','삽살개','투컷',6.5,'20100608','code-4','suil@naver.com');

-- 강아지정보
INSERT INTO DOGINFO VALUES('1','code-7');
INSERT INTO DOGINFO VALUES('1','code-9');
INSERT INTO DOGINFO VALUES('1','code-10');

--강아지 이미지
INSERT INTO DOG_IMAGE VALUES('SDFLKJSDFL','1');
INSERT INTO DOG_IMAGE VALUES('SDLFKJLVKJSD','1');
INSERT INTO DOG_IMAGE VALUES('QWEOUWEORE3TER','1');
INSERT INTO DOG_IMAGE VALUES('이미지 경로1 ','2');
INSERT INTO DOG_IMAGE VALUES('이미지 경로2 ','2');
INSERT INTO DOG_IMAGE VALUES('이미지 경로3 ','2');
INSERT INTO DOG_IMAGE VALUES('이미지 경로4 ','2');

--시터
INSERT INTO SITTER VALUES('suil@naver.com','가천대학교','이미지경로1','서울,경기',3.6);
INSERT INTO SITTER VALUES('suil1@naver.com','대전대학교','이미지경로2','서울,천안',3.1);

--스킬
INSERT INTO SKILL VALUES('suil@naver.com','code-1');
INSERT INTO SKILL VALUES('suil@naver.com','code-2');
INSERT INTO SKILL VALUES('suil1@naver.com','code-3');
INSERT INTO SKILL VALUES('suil1@naver.com','code-4');

--리뷰
INSERT INTO REVIEW VALUES (1,3.5,'좋아요1','suil3@naver.com','suil@naver.com');
INSERT INTO REVIEW VALUES (2,3.5,'좋아요1','suil3@naver.com','suil1@naver.com');

--예약
insert into RESERVATION values(RESERVATION_num_seq.NEXTVAL,0,'2010/07/01','2010/07/02','집에서 맡기기','suil2@naver.com','suil@naver.com');
insert into RESERVATION values(RESERVATION_num_seq.NEXTVAL,1,'2010/07/01','2010/07/02','집에서 맡기기','suil2@naver.com','suil@naver.com');
insert into RESERVATION values(RESERVATION_num_seq.NEXTVAL,0,'2010/07/01','2010/07/02','집에서 맡기기','suil3@naver.com','suil1@naver.com');
insert into RESERVATION values(RESERVATION_num_seq.NEXTVAL,1,'2010/07/01','2010/07/02','집에서 맡기기','suil3@naver.com','suil1@naver.com');

--서비스 요구사항
insert into DEMAND values (1,'code-11'); 
insert into DEMAND values (1,'code-12'); 
insert into DEMAND values (1,'code-13'); 
insert into DEMAND values (2,'code-11'); 
insert into DEMAND values (2,'code-12');
insert into DEMAND values (3,'code-11'); 
insert into DEMAND values (3,'code-13'); 


--매출
insert into SALES values(1 ,100000 ,90000 ,10000, '2017/07/03');
insert into SALES values(2,100000,90000,10000,'2017/07/04');
insert into SALES values(3,100000,90000,10000,'2017/07/05');
insert into SALES values(4,100000,90000,10000,'2017/07/06');

--돌봄일지
insert into care values(CARE_num_seq.NEXTVAL,'강아지가 너무 귀여워용',1,'2017/08/09');
insert into care values(CARE_num_seq.NEXTVAL,'강아지가 너무 이뻐용',2,'2017/08/09');
insert into care values(CARE_num_seq.NEXTVAL,'강아지가 너무 아름다워요',3,'2017/08/09');
insert into care values(CARE_num_seq.NEXTVAL,'강아지가 너무 사랑스러워용',4,'2017/08/09');

--돌봄일지 이미지
insert into CARE_IMAGE values('돌봄이미지1',1);
insert into CARE_IMAGE values('돌봄이미지1',2);
insert into CARE_IMAGE values('돌봄이미지1',3);

-----------------------------------------------
--select

select * from member
select * from AUTHORITY
select * from code
select * from DOG
select * from DOGINFO
select * from DOG_IMAGE
select * from SITTER
select * from SKILL
select * from REVIEW
select * from RESERVATION
select * from SALES
select * from care
select * from CARE_IMAGE