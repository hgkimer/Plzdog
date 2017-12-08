------------------------------
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
	
-- 시터 대기자 테이블
DROP TABLE WAITING
	CASCADE CONSTRAINTS;
	
-- 예약 상세 테이블
DROP TABLE RES_DETAIL 
	CASCADE CONSTRAINTS;
		
--------------------------------------------------
--create
--시터 대기자
CREATE TABLE WAITING (
	EMAIL VARCHAR2(100) PRIMARY KEY
);
	
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
	CONSTRAINT FK_AUTHORITY_MEMBER FOREIGN KEY(EMAIL) REFERENCES MEMBER on delete cascade
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
	EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	CONSTRAINT FK_DOG_MEMBER FOREIGN KEY(EMAIL) REFERENCES MEMBER on delete cascade
);

--강아지 정보
CREATE TABLE DOGINFO (
	DOG_ID NUMBER(5) NOT NULL, /* 강아지ID */
	CODE_DOG VARCHAR2(20) NOT NULL, /* 코드 */
	CONSTRAINT PK_DOGINFO PRIMARY KEY(DOG_ID, CODE_DOG),
	CONSTRAINT FK_DOGINFO_DOG FOREIGN KEY(DOG_ID) REFERENCES DOG on delete cascade,
	CONSTRAINT FK_DOGINFO_CODE FOREIGN KEY(CODE_DOG) REFERENCES CODE on delete cascade
);

--강아지 이미지
CREATE TABLE DOG_IMAGE (
	DOG_IMAGE VARCHAR2(100) NOT NULL, /* 이미지이름(경로) */
	DOG_ID NUMBER(5) NOT NULL, /* 강아지ID */
	CONSTRAINT FK_DOG_IMAGE_DOG FOREIGN KEY(DOG_ID) REFERENCES DOG on delete cascade
);

--시터
CREATE TABLE SITTER (
	EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	SCHOOL VARCHAR2(50) NOT NULL, /* 학교이름 */
	CERTIFICATION VARCHAR2(100) NOT NULL, /* 증명서/면허증 */
	SERVICE_ADDRESS CLOB NOT NULL, /* 서비스가능지역 */
	SITTER_RATE NUMBER(2, 1), /* 평점 */
	VISIT_PRICE NUMBER(10) NOT NULL, /* 방문돌봄가격 */
	GIVE_PRICE NUMBER(10) NOT NULL, /* 위탁돌봄가격 */
	CONSTRAINT PK_SITTER PRIMARY KEY(EMAIL),
	CONSTRAINT FK_SITTER_MEMBER FOREIGN KEY(EMAIL) REFERENCES MEMBER on delete cascade
);

/* 스킬 */
CREATE TABLE SKILL (
	EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	CODE_SKILL VARCHAR2(20) NOT NULL, /* 코드 */
	CONSTRAINT PK_SKILL PRIMARY KEY(EMAIL, CODE_SKILL),
	CONSTRAINT FK_SKILL_MEMBER FOREIGN KEY(EMAIL) REFERENCES SITTER on delete cascade,
	CONSTRAINT FK_SKILL_CODE FOREIGN KEY(CODE_SKILL) REFERENCES CODE on delete cascade
);

/* 리뷰 */
CREATE TABLE REVIEW (
	REVIEW_ID NUMBER(10) PRIMARY KEY, /* 리뷰ID */
	REVIEW_RATE NUMBER(1), /* 별점 */
	REVIEW_CONTENTS CLOB NOT NULL, /* 내용 */
	EMAIL VARCHAR2(100) NOT NULL, /* 견주_이메일 */
	EMAIL_SITTER VARCHAR2(100) NOT NULL, /* 시터_이메일 */
	CONSTRAINT FK_REVIEW_MEMBER FOREIGN KEY(EMAIL) REFERENCES member on delete cascade,
	CONSTRAINT FK_REVIEW_SITTER FOREIGN KEY(EMAIL_SITTER) REFERENCES member on delete cascade
);

/* 예약 */
CREATE TABLE RESERVATION (
	RES_ID NUMBER(10) PRIMARY KEY, /* 예약ID */
	RES_SDATE DATE NOT NULL, /* 시작날짜 */
	RES_EDATE DATE NOT NULL, /* 종료날짜 */
	PRICE NUMBER(10),		 /* 가격 */
	RES_CONTENTS CLOB NOT NULL, /* 의뢰내용 */
	RES_STATUS VARCHAR2(100) NOT NULL, /* 예약상태 */
	EMAIL VARCHAR2(100) NOT NULL, /* 견주_이메일 */
	EMAIL_SITTER VARCHAR2(100), /* 시터_이메일 */
	CONSTRAINT FK_RESERVATION_MEMBER FOREIGN KEY(EMAIL) REFERENCES MEMBER on delete cascade ,
	CONSTRAINT FK_RESERVATION_SITTER FOREIGN KEY(EMAIL_SITTER) REFERENCES MEMBER on delete cascade
);

/* 예약상세 */
CREATE TABLE RES_DETAIL (
	RES_ID NUMBER(10) NOT NULL, /* 예약ID */
	DOG_ID NUMBER(5) NOT NULL, /* 강아지ID */
	CONSTRAINT PK_RESDETAIL PRIMARY KEY(RES_ID, DOG_ID),
	CONSTRAINT FK_RESDETAIL_RESERVATION FOREIGN KEY(RES_ID) REFERENCES RESERVATION on delete cascade,
	CONSTRAINT FK_RESDETAIL_DOG FOREIGN KEY(DOG_ID) REFERENCES DOG on delete cascade
);
	
/* 매출 */
CREATE TABLE SALES (
	RES_ID NUMBER(10) NOT NULL, /* 예약ID */
	TOTAL NUMBER(15) NOT NULL, /* 총액 */
	PAY NUMBER(15), /* 시터 수입 */
	COMMISSION NUMBER(15) NOT NULL, /* 수수료 */
	SALES_DATE DATE NOT NULL, /* 결제날짜 */
	CONSTRAINT FK_SALES_RESERVATION FOREIGN KEY(RES_ID) REFERENCES RESERVATION on delete cascade
);

/* 서비스 요구사항 */
CREATE TABLE DEMAND (
	RES_ID NUMBER(10) not null, /* 예약ID */
	CODE_DEMAND VARCHAR2(20) not null, /* 코드 */
	CONSTRAINT PK_DEMAND PRIMARY KEY(RES_ID, CODE_DEMAND),
	CONSTRAINT FK_DEMAND_RESERVATION FOREIGN KEY(RES_ID) REFERENCES RESERVATION on delete cascade,
	CONSTRAINT FK_DEMAND_CODE FOREIGN KEY(CODE_DEMAND) REFERENCES CODE on delete cascade
);

/* 돌봄일지 */
CREATE TABLE CARE (
	CARE_ID NUMBER(10) PRIMARY KEY, /* 돌봄일지ID */
	CARE_CONTENTS CLOB NOT NULL, /* 내용 */
	RES_ID NUMBER(10) NOT NULL, /* 예약ID */
	CARE_DATE DATE NOT NULL, /* 작성일 */
	CONSTRAINT FK_CARE_RESERVATION FOREIGN KEY(RES_ID) REFERENCES RESERVATION on delete cascade
);

/* 돌봄일지 이미지 */
CREATE TABLE CARE_IMAGE (
	CARE_IMAGE VARCHAR2(100) NOT NULL, /* 이미지경로 */
	CARE_ID NUMBER(10) NOT NULL, /* 돌봄일지ID */
	CONSTRAINT FK_CARE_IMAGE_CARE FOREIGN KEY(CARE_ID) REFERENCES CARE on delete cascade
);
	
--------------------------------------------------
-- 시퀀스

--강아지 시퀀스 생성
drop sequence Dog_id_seq;
create sequence dog_id_seq;	

--예약 시퀀스 생성
drop sequence RESERVATION_id_seq;
create sequence RESERVATION_id_seq;

--돌봄일지 시퀀스 생성
drop sequence CARE_id_seq;
create sequence CARE_id_seq;	

---------------------------------------------------
-- INSERT

-- MEMBER
insert into member values('kim@naver.com','김호규','1111','경기','용인', 52635,'image1','010-7415-6323',1);
insert into member values('lee@naver.com','이효주','1111','서울','광진',12345,'image2','010-8965-5823',1);
insert into member values('yoon@naver.com','윤규석','1111','제주도','서귀포',41523,'image3','010-6412-9223',1);
insert into member values('jang@naver.com','이수일','1111','서울','마포',12345,'image4','010-9123-0223',1);
-- sitter용
insert into member values('soo1@naver.com','강시터','1111','서울','마포',12345,'시터1.jpg','010-1234-0223',1);
insert into member values('soo2@naver.com','허시터','1111','서울','상암',12345,'시터2.jpg','010-2344-0223',1);
insert into member values('soo3@naver.com','김시터','1111','서울','구리',12345,'시터3.jpg','010-2343-0223',1);
insert into member values('soo4@naver.com','이시터','1111','서울','경희대',12345,'시터4.jpg','010-9344-0223',1);
insert into member values('soo5@naver.com','박시터','1111','서울','잠실',12345,'시터5.jpg','010-5454-0223',1);
insert into member values('soo6@naver.com','장시터','1111','서울','천호',12345,'시터6.jpg','010-6765-0223',1);
insert into member values('soo7@naver.com','최시터','1111','서울','강남',12345,'시터7.jpg','010-3323-0223',1);
insert into member values('soo8@naver.com','진시터','1111','서울','원효',12345,'시터8.jpg','010-2311-0223',1);
insert into member values('soo9@naver.com','차시터','1111','서울','올림픽대교',12345,'시터9.jpg','010-3455-0223',1);
insert into member values('soo10@naver.com','오시터','1111','서울','연희동',12345,'시터10.jpg','010-3433-0223',1);

-- 비밀번호 1111 통일
update member set password = '$2a$10$L0NFXewNsSA71F18CWumiOeTdegchXuVtA.tUJk8reEHlFCRLMp2u';

-- 권한
-- 관리자
insert into AUTHORITY values('kim@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('kim@naver.com','ROLE_ADMIN');
insert into AUTHORITY values('kim@naver.com','ROLE_SITTER');
-- 시터
insert into AUTHORITY values('soo1@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('soo1@naver.com','ROLE_SITTER');
insert into AUTHORITY values('soo2@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('soo2@naver.com','ROLE_SITTER');
insert into AUTHORITY values('soo3@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('soo3@naver.com','ROLE_SITTER');
insert into AUTHORITY values('soo4@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('soo4@naver.com','ROLE_SITTER');
insert into AUTHORITY values('soo5@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('soo5@naver.com','ROLE_SITTER');
insert into AUTHORITY values('soo6@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('soo6@naver.com','ROLE_SITTER');
insert into AUTHORITY values('soo7@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('soo7@naver.com','ROLE_SITTER');
insert into AUTHORITY values('soo8@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('soo8@naver.com','ROLE_SITTER');
insert into AUTHORITY values('soo9@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('soo9@naver.com','ROLE_SITTER');
insert into AUTHORITY values('soo10@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('soo10@naver.com','ROLE_SITTER');

-- 회원
insert into AUTHORITY values('jang@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('lee@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('yoon@naver.com','ROLE_MEMBER');

-- 코드 테이블 ---------------------------------------------------------------------
-------코드 테이블 값들 삭제
delete from code;
-- 전체 코드 등록
--------시터의 스킬(= 견주 요구사항)-------------------------------------------
insert into code values('sitter-1','반려동물 경험 유무','시터');
insert into code values('sitter-2','펫트너 집에서 보살필 수 있어요','시터');
insert into code values('sitter-3','고객의 집에서 보살필 수 있어요','시터');
insert into code values('sitter-4','투약가능','시터');
insert into code values('sitter-5','노령견 케어 가능','시터');
insert into code values('sitter-6','퍼피 케어 가능','시터');
insert into code values('sitter-7','환자 모니터링 가능','시터');
--------시터의 환경-----------------------------------------------------------
insert into code values('sitterEn-1','아파트','시터환경');
insert into code values('sitterEn-2','주택','시터환경');
insert into code values('sitterEn-3','마당유무','시터환경');
insert into code values('sitterEn-4','흡연유무','시터환경');
--------강아지 정보-----------------------------------------------------------
INSERT INTO CODE VALUES('dog-1','유기견 출신','강아지');
INSERT INTO CODE VALUES('dog-2','접종여부','강아지');
INSERT INTO CODE VALUES('dog-3','심장사상충 예방 여부','강아지');
INSERT INTO CODE VALUES('dog-4','외부기생충 구제 여부','강아지');
INSERT INTO CODE VALUES('dog-5','배변훈련','강아지');
INSERT INTO CODE VALUES('dog-6','다른 강아지들과 잘 지내나요?','강아지');
--------예약 상태-------------------------------------------------------------
-- 담당 시터 없이 바로 예약을 등록한 상태
insert into code values('res-1','예약대기','예약');
-- 예약 등록 후, 시터의 견적이 들어와 승인 요청을 기다리는 상태
insert into code values('res-2','견주의 승인 대기','예약');
-- 견주가 시터 자신에게 직접 예약을 등록하고, 시터 자신의 승인 요청을 기다리는 상태
insert into code values('res-3','시터의 승인 대기','예약');
-- 견주나 시터가 승인을 완료(res-2 나 res-3 상태에서 승인 버튼을 눌렀을 때)한 상태
insert into code values('res-4','결제완료','예약');
-------서비스 종류------------------------------------------------------------
insert into code values('service-1', '방문돌봄', '서비스');
insert into code values('service-2', '위탁돌봄', '서비스');
----------------------------------------------------------------------------------

--강아지
INSERT INTO DOG VALUES(dog_id_seq.nextval,'미륵','비숑','암컷',3.5,'20100608', 'kim@naver.com'); 
INSERT INTO DOG VALUES(dog_id_seq.nextval,'리코','슈바이처','암컷',4.5,'20100711', 'jang@naver.com'); 
INSERT INTO DOG VALUES(dog_id_seq.nextval,'가지','진돗개','수컷',5.5,'20100812', 'jang@naver.com'); 
INSERT INTO DOG VALUES(dog_id_seq.nextval,'토마토','진돗개','수컷',5.5,'20100913', 'jang@naver.com');
INSERT INTO DOG VALUES(dog_id_seq.nextval,'가자미','진돗개','수컷',5.5,'20101014', 'lee@naver.com');  
INSERT INTO DOG VALUES(dog_id_seq.nextval,'순이','진돗개','수컷',5.5,'20101115', 'lee@naver.com'); 
INSERT INTO DOG VALUES(dog_id_seq.nextval,'순둥이','진돗개','수컷',5.5,'20101216', 'lee@naver.com');  
INSERT INTO DOG VALUES(dog_id_seq.nextval,'까미','삽살개','투컷',6.5,'20100117', 'yoon@naver.com');  
INSERT INTO DOG VALUES(dog_id_seq.nextval,'순둥이','진돗개','수컷',5.5,'20100218', 'yoon@naver.com'); 
INSERT INTO DOG VALUES(dog_id_seq.nextval,'순둥이','진돗개','수컷',5.5,'20100319', 'yoon@naver.com'); 

insert into DOG values(dog_id_seq.nextval,'순둥이1','진돗개','수컷',5.5,'20100319', 'soo1@naver.com'); 
insert into DOG values(dog_id_seq.nextval,'순둥이2','진돗개','수컷',5.5,'20100319', 'soo1@naver.com'); 
insert into DOG values(dog_id_seq.nextval,'순둥이3','진돗개','수컷',5.5,'20100319', 'soo1@naver.com'); 

-- 강아지정보
INSERT INTO DOGINFO VALUES(1 ,'dog-1');
INSERT INTO DOGINFO VALUES(1 ,'dog-2');
INSERT INTO DOGINFO VALUES(1 ,'dog-3');
INSERT INTO DOGINFO VALUES(2 ,'dog-4');
INSERT INTO DOGINFO VALUES(2 ,'dog-5');
INSERT INTO DOGINFO VALUES(2 ,'dog-6');
INSERT INTO DOGINFO VALUES(3 ,'dog-1');
INSERT INTO DOGINFO VALUES(3 ,'dog-2');
INSERT INTO DOGINFO VALUES(3 ,'dog-3');
INSERT INTO DOGINFO VALUES(4 ,'dog-4');
INSERT INTO DOGINFO VALUES(4 ,'dog-5');
INSERT INTO DOGINFO VALUES(4 ,'dog-6');
INSERT INTO DOGINFO VALUES(5 ,'dog-1');
INSERT INTO DOGINFO VALUES(5 ,'dog-2');
INSERT INTO DOGINFO VALUES(5 ,'dog-3');
INSERT INTO DOGINFO VALUES(6 ,'dog-4');
INSERT INTO DOGINFO VALUES(6 ,'dog-5');
INSERT INTO DOGINFO VALUES(6 ,'dog-6');
INSERT INTO DOGINFO VALUES(7 ,'dog-1');
INSERT INTO DOGINFO VALUES(7 ,'dog-2');
INSERT INTO DOGINFO VALUES(7 ,'dog-3');
INSERT INTO DOGINFO VALUES(8 ,'dog-4');
INSERT INTO DOGINFO VALUES(8 ,'dog-5');
INSERT INTO DOGINFO VALUES(8 ,'dog-6');
INSERT INTO DOGINFO VALUES(9 ,'dog-1');
INSERT INTO DOGINFO VALUES(9 ,'dog-2');
INSERT INTO DOGINFO VALUES(9 ,'dog-3');
INSERT INTO DOGINFO VALUES(10 ,'dog-4');
INSERT INTO DOGINFO VALUES(10 ,'dog-5');
INSERT INTO DOGINFO VALUES(10 ,'dog-6');
INSERT INTO DOGINFO VALUES(11 ,'dog-6');
INSERT INTO DOGINFO VALUES(11 ,'dog-4');
INSERT INTO DOGINFO VALUES(11 ,'dog-3');



--강아지 이미지
INSERT INTO DOG_IMAGE VALUES('1.jpg','1');
INSERT INTO DOG_IMAGE VALUES('2.jpg','2');
INSERT INTO DOG_IMAGE VALUES('3.jpg','3');
INSERT INTO DOG_IMAGE VALUES('4.jpg','4');
INSERT INTO DOG_IMAGE VALUES('5.jpg','5');
INSERT INTO DOG_IMAGE VALUES('6.jpg','6');
INSERT INTO DOG_IMAGE VALUES('7.jpg','7');
INSERT INTO DOG_IMAGE VALUES('8.jpg','8');
INSERT INTO DOG_IMAGE VALUES('9.jpg','9');
INSERT INTO DOG_IMAGE VALUES('10.jpg','10');
INSERT INTO DOG_IMAGE VALUES('10.jpg','11');
INSERT INTO DOG_IMAGE VALUES('10.jpg','12');
INSERT INTO DOG_IMAGE VALUES('10.jpg','13');

--시터
INSERT INTO SITTER VALUES('soo1@naver.com','가천대학교','이미지경로1','서울,경기',3.6,35000,30000);
INSERT INTO SITTER VALUES('soo2@naver.com','대전대학교','이미지경로2','서울,천안',3.1,35000,30000);
INSERT INTO SITTER VALUES('soo3@naver.com','가천대학교','이미지경로1','서울,경기',3.6,35000,30000);
INSERT INTO SITTER VALUES('soo4@naver.com','대전대학교','이미지경로2','서울,천안',3.1,35000,30000);
INSERT INTO SITTER VALUES('soo5@naver.com','가천대학교','이미지경로1','서울,경기',3.6,35000,30000);
INSERT INTO SITTER VALUES('soo6@naver.com','대전대학교','이미지경로2','서울,천안',3.1,35000,30000);
INSERT INTO SITTER VALUES('soo7@naver.com','가천대학교','이미지경로1','서울,경기',3.6,35000,30000);
INSERT INTO SITTER VALUES('soo8@naver.com','대전대학교','이미지경로2','서울,천안',3.1,35000,30000);
INSERT INTO SITTER VALUES('soo9@naver.com','가천대학교','이미지경로1','서울,경기',3.6,35000,30000);
INSERT INTO SITTER VALUES('soo10@naver.com','대전대학교','이미지경로2','서울,천안',3.1,35000,30000);

--스킬
INSERT INTO SKILL VALUES('soo1@naver.com','sitter-1');
INSERT INTO SKILL VALUES('soo1@naver.com','sitter-2');
INSERT INTO SKILL VALUES('soo1@naver.com','sitter-3');
INSERT INTO SKILL VALUES('soo1@naver.com','sitterEn-1');
INSERT INTO SKILL VALUES('soo1@naver.com','sitterEn-2');
INSERT INTO SKILL VALUES('soo1@naver.com','sitterEn-3');

INSERT INTO SKILL VALUES('soo2@naver.com','sitter-4');
INSERT INTO SKILL VALUES('soo2@naver.com','sitter-5');
INSERT INTO SKILL VALUES('soo2@naver.com','sitter-6');
INSERT INTO SKILL VALUES('soo2@naver.com','sitterEn-1');
INSERT INTO SKILL VALUES('soo2@naver.com','sitterEn-2');
INSERT INTO SKILL VALUES('soo2@naver.com','sitterEn-3');

INSERT INTO SKILL VALUES('soo3@naver.com','sitter-1');
INSERT INTO SKILL VALUES('soo3@naver.com','sitter-2');
INSERT INTO SKILL VALUES('soo3@naver.com','sitter-3');
INSERT INTO SKILL VALUES('soo3@naver.com','sitter-4');
INSERT INTO SKILL VALUES('soo3@naver.com','sitterEn-1');
INSERT INTO SKILL VALUES('soo3@naver.com','sitterEn-2');
INSERT INTO SKILL VALUES('soo3@naver.com','sitterEn-3');

INSERT INTO SKILL VALUES('soo4@naver.com','sitter-4');
INSERT INTO SKILL VALUES('soo4@naver.com','sitter-5');
INSERT INTO SKILL VALUES('soo4@naver.com','sitter-6');
INSERT INTO SKILL VALUES('soo4@naver.com','sitterEn-1');
INSERT INTO SKILL VALUES('soo4@naver.com','sitterEn-2');
INSERT INTO SKILL VALUES('soo4@naver.com','sitterEn-3');

insert into skill values('soo1@naver.com','res-1');
insert into SKILL values('soo1@naver.com','service-1');
insert into SKILL values('soo1@naver.com','service-2');
insert into SKILL values('soo2@naver.com','service-1');
insert into SKILL values('soo2@naver.com','service-2');
insert into SKILL values('soo3@naver.com','service-1');
insert into SKILL values('soo3@naver.com','service-2');
insert into SKILL values('soo4@naver.com','service-1');
insert into SKILL values('soo5@naver.com','service-1');
insert into SKILL values('soo6@naver.com','service-1');
insert into SKILL values('soo7@naver.com','service-2');
insert into SKILL values('soo8@naver.com','service-2');
insert into SKILL values('soo9@naver.com','service-2');
insert into SKILL values('soo10@naver.com','service-2');


--리뷰
INSERT INTO REVIEW VALUES (1,3.5,'좋아요1','yoon@naver.com','kim@naver.com');
INSERT INTO REVIEW VALUES (2,3.5,'좋아요1','lee@naver.com','soo1@naver.com');

--예약
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,'2010/07/01','2010/07/02',10000,'의뢰내용1','res-1','lee@naver.com','soo1@naver.com');
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,'2010/07/01','2010/07/02',20000,'의뢰내용2','res-1','lee@naver.com','soo2@naver.com');
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,'2010/07/01','2010/07/02',30000,'의뢰내용3','res-1','lee@naver.com','soo3@naver.com');
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,'2010/07/01','2010/07/02',40000,'의뢰내용4','res-1','jang@naver.com','soo4@naver.com');
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,'2010/07/01','2010/07/02',50000,'의뢰내용5','res-1','jang@naver.com','soo5@naver.com');
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,'2010/07/01','2010/07/02',60000,'의뢰내용6','res-1','jang@naver.com','soo6@naver.com');
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,'2010/07/01','2010/07/02',70000,'의뢰내용7','res-1','yoon@naver.com','soo7@naver.com');
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,'2010/07/01','2010/07/02',80000,'의뢰내용8','res-1','yoon@naver.com','soo8@naver.com');
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,'2010/07/01','2010/07/02',90000,'의뢰내용9','res-1','yoon@naver.com','soo9@naver.com');

insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,'2010/07/01','2010/07/02',90000,'의뢰내용10','res-1','yoon@naver.com','soo9@naver.com');

insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,'2010/07/01','2010/07/02',90000,'의뢰내용11','res-1','yoon@naver.com','soo1@naver.com');

insert into DEMAND values (1,'sitter-1'); 
insert into DEMAND values (2,'sitter-2'); 
insert into DEMAND values (3,'sitter-3');
insert into DEMAND values (3,'sitter-1');
insert into DEMAND values (3,'sitter-2');
insert into Demand values (4,'sitter-4');
insert into demand values (5,'sitter-1');
insert into demand values (11,'sitter-1');
insert into demand values (11,'sitter-2');


insert into res_detail values('10','10');
insert into res_detail values('11','9');
-- yoon : dogId = 8,9,10
insert into res_detail values('11','8');
insert into res_detail values('11','10');

-- 예약 상세
-- jang의 dogID : 2,3,4 , lee : 5,6,7 , yoon : 8,9,10
-- lee의 Res : 1,2,3 , jang : 4,5,6 , yoon : 7,8,9
insert into RES_DETAIL values('1','5');
insert into RES_DETAIL values('1','6');
insert into RES_DETAIL values('1','7');
insert into RES_DETAIL values('2','5');
insert into RES_DETAIL values('2','6');
insert into RES_DETAIL values('2','7');

insert into RES_DETAIL values('4','2');
insert into RES_DETAIL values('4','3');
insert into RES_DETAIL values('4','4');
insert into RES_DETAIL values('5','2');
insert into RES_DETAIL values('5','3');
insert into RES_DETAIL values('5','4');

insert into RES_DETAIL values('7','8');
insert into RES_DETAIL values('7','9');
insert into RES_DETAIL values('7','10');
insert into RES_DETAIL values('8','8');
insert into RES_DETAIL values('8','9');
insert into RES_DETAIL values('8','10');

--매출
insert into SALES values(1,100000 ,90000 ,10000, '2017/07/03');
insert into SALES values(2,100000,90000,10000,'2017/07/04');
insert into SALES values(3,100000,90000,10000,'2017/07/05');
insert into SALES values(4,100000,90000,10000,'2017/07/06');

--돌봄일지
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 귀여워용',1,'2017/08/09');
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 이뻐용',2,'2017/08/09');
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 아름다워요',3,'2017/08/09');
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 사랑스러워용',4,'2017/08/09');
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 사랑스러워용',4,'2017/08/09');
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 사랑스러워용',4,'2017/08/09');
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 작아요',3,'2017/08/09');
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 작아요1',3,'2017/08/09');
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 작아요2',4,'2017/08/09');
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 작아요3',4,'2017/08/09');

--돌봄일지 이미지
insert into CARE_IMAGE values('돌봄이미지1',1);
insert into CARE_IMAGE values('돌봄이미지4',1);
insert into CARE_IMAGE values('돌봄이미지2',2);
insert into CARE_IMAGE values('돌봄이미지3',3);
insert into CARE_IMAGE values('돌봄이미지5',3);
insert into CARE_IMAGE values('돌봄이미지6',4);
insert into CARE_IMAGE values('돌봄이미지7',4);
insert into CARE_IMAGE values('돌봄이미지7',4);
insert into CARE_IMAGE values('돌봄이미지7',4);
-----------------------------------------------
--select
-- 예약 간단 조회
select * from RESERVATION;
select	r.res_id,
		r.res_status,
		r.res_sdate,
		r.res_edate,
		i.dog_image,
		d.dog_name,
		d.species,
		d.gender,
		d.weight,
		d.birth
from	reservation r, dog_image i, dog d
where 	r.email = d.email and r.email_sitter = 'kim@naver.com' and d.dog_id = i.dog_id(+);


update dog_image set dog_image = '2.jpg' where dog_id = 13

--시터 대기명단에 등록

-- 회원에 해당하는 code의 이름을 조회
select m.email, m.member_name, c.code, c.code_name 
from member m , sitter s, skill k , code c 
where s.email = m.email and s.email = k.email and k.code_skill = c.code and s.email = 'suil@naver.com';

-- 회원이 신청한 예약을 조회
select m.member_name , s.member_name
from member m, member s, RESERVATION r
where m.email = r.email and s.email = r.email2 and m.email = 'suil2@naver.com';

-- 회원이 신청한 예약한 요구를 조회
select m.member_name, c.code_name from member m, demand d, RESERVATION r, code c
where m.email = r.email and r.res_id = d.res_id and d.code = c.code and m.email = 'suil3@naver.com';

-- 회원에서 강아지 이름과 강아지 이미지 조회
select m.member_name , d.dog_name , i.dog_image
from member m, dog d, DOG_IMAGE i where m.email = d.email and d.dog_id = i.dog_id 
and m.email ='suil@naver.com' and d.dog_name = '미륵';

-- 회원에서 학교명과 스킬 조회
select m.email, m.member_name, s.school, c.code_name from member m, sitter s, skill sk, code c
where m.email = s.email and sk.email = s.email and code_skill = code;

-- 회원에서 강아지 정보 조회   
select m.email, m.member_name, d.dog_name, di.dog_image from member m, dog d, dog_image di
where m.email = d.email and di.dog_id = d.dog_id;

-- 회원에서 리뷰 조회
select m.email, m.member_name, r.review_contents from member m, review r, sitter s
where m.email = s.email and m.email = r.email2 and s.email = 'suil@naver.com';

-- 회원에서 강아지 

select * from AUTHORITY;
select * from code;
select * from DOG;
select * from DEMAND;
select * from DOGINFO;
select * from DOG_IMAGE;
select * from SITTER;
select * from SKILL;
select * from REVIEW;
select * from RESERVATION;
select * from SALES;
select * from care;
select * from CARE_IMAGE;
select * from member;
select * from res_detail;
select * from waiting;
------------------------------------test
select m.email, m.member_name, s.school, c.code_name from member m, sitter s, skill sk, code c
where m.email = s.email and sk.email = s.email and code_skill = code;

select m.email, m.member_name, d.dog_name, di.dog_image from member m, dog d, dog_image di
where m.email = d.email and di.dog_id = d.dog_id;

select m.email, m.member_name, r.review_contents from member m, review r, sitter s
where m.email = s.email and m.email = r.email_sitter and s.email = 'soo@naver.com';

select m.email, m.member_name, r.res_status, c.care_contents, ci.care_image, cd.code_name, s.email, s.member_name, sl.total
from member m, reservation r, care c, care_image ci, code cd, demand d, member s, sales sl
where r.res_id = c.res_id and r.email = m.email and ci.care_id = c.care_id and r.res_id = d.res_id and d.code_demand = cd.code 
and r.email_sitter = s.email and sl.res_id = r.res_id;

select	m.email,
		m.member_name,
		m.main_address,
		m.sub_address,
		m.zipcode,
		m.member_image,
		m.phonenum,
		s.school,
		s.certification,
		s.service_address,
		s.sitter_rate,
		c.code_name,
		d.dog_name,
		d.species,
		d.gender,
		d.weight,
		d.birth
from	member m, dog d, sitter s, skill k, code c
where s.email = m.email and s.email = d.email and k.code_skill = c.code and s.email = k.email(+);

-- n번 돌봄일지와 돌봄이미지 조회
select	c.care_id, c.care_contents, c.res_id, c.care_date, i.care_image
from	care c, care_image i
where	c.care_id = 7 and c.care_id = i.care_id(+);

-- 강아지와 강아지 이미지 조회
select	d.dog_id, d.dog_name, d.species, d.gender, d.weight, d.birth, i.dog_image, c.code_dog
from	dog d, dog_image i, doginfo c
where 	d.email = 'soo@naver.com' and  d.dog_id = i.dog_id(+) and d.dog_id = c.dog_id;


-- 펫시터의 정보를 조회
select			m.email,
				m.member_name, 
				m.main_address, 
				m.sub_address, 
				m.zipcode, 
				m.member_image, 
				m.phonenum,
				s.school,
				s.certification,
				s.service_address,
				s.sitter_rate,
				c.code,
				c.code_name,
				c.category
		from	member m, sitter s, skill k, code c
		where	m.email = s.email
		and 	s.email = k.email
		and     k.code_skill = c.code;
		
		--<!-- 예약상태를 조회(reservation-> demand -> code) -->
		select  
				r.res_id,
			    r.email,
			    r.email_sitter,
			    c.code,
			    c.code_name,
			    c.category
		from    reservation r, demand d, code c
		where   r.res_id = d.res_id
		and 	d.code_demand = c.code;
		
		--<!--Email로 해당 예약의 시터의 급여를 조회 -->
		select  r.res_id,
			    r.res_status,
			    r.res_sdate,
			    r.res_edate,
			    r.res_contents,
			    r.email,
			    r.email_sitter,
			    s.total,
			    s.pay,
			    s.commission,
			    s.sales_date
		from    reservation r, sales s
		where   r.res_id = s.res_id
		and 	r.email_sitter = 'kim@naver.com';
		
		-- <!--Email로 해당 예약의 상태를 조회 -->
		select  r.res_id,
			    r.res_status,
			    r.res_sdate,
			    r.res_edate,
			    r.res_contents,
			    r.email,
			    r.email_sitter,
			    c.code,
			    c.code_name,
			    c.category
		from    reservation r, demand d, code c
		where   r.res_id = d.res_id
		and     d.code_demand = c.code
		and 	r.email = 'yoon@naver.com';
		
		-- 해당 예약의 돌봄일지를 조회
		select  r.res_id,
			    r.res_status,
			    r.res_sdate,
			    r.res_edate,
			    r.res_contents,
			    r.email,
			    r.email_sitter,
			    c.care_id,
			    c.care_contents,
			    c.care_date,
			    i.care_image
		from    reservation r, care c, care_image i
		where   r.res_id = c.res_id
		and		c.care_id = i.care_id(+)
		and	    r.email = 'lee@naver.com';
		
		-- 해당 예약의 급여를 조회
		select  r.res_id,
			    r.res_status,
			    r.res_sdate,
			    r.res_edate,
			    r.res_contents,
			    r.email,
			    r.email_sitter,
			    s.total,
			    s.pay,
			    s.commission,
			    s.sales_date
		from    reservation r, sales s
		where   r.res_id = s.res_id
		and     r.res_id = 2;
		
		
		
		
		

		
		