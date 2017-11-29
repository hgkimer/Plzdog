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
	RES_TYPE NUMBER(1) NOT NULL, /* 의뢰종류 */
	RES_SDATE DATE NOT NULL, /* 시작날짜 */
	RES_EDATE DATE NOT NULL, /* 종료날짜 */
	RES_CONTENTS CLOB NOT NULL, /* 의뢰내용 */
	EMAIL VARCHAR2(100) NOT NULL, /* 견주_이메일 */
	EMAIL_SITTER VARCHAR2(100) NOT NULL, /* 시터_이메일 */
	CONSTRAINT FK_RESERVATION_MEMBER FOREIGN KEY(EMAIL) REFERENCES MEMBER on delete cascade ,
	CONSTRAINT FK_RESERVATION_SITTER FOREIGN KEY(EMAIL_SITTER) REFERENCES MEMBER on delete cascade
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
	CARE_IMAGE VARCHAR2(30) NOT NULL, /* 이미지경로 */
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
insert into member values('kim@naver.com','김호규','1111','경기','용인', 52635,'image1','010-7415-6323',0);
insert into member values('lee@naver.com','이효주','1121','서울','광진',12345,'image2','010-8965-5823',0);
insert into member values('yoon@naver.com','윤규석','1131','제주도','서귀포',41523,'image3','010-6412-9223',0);
insert into member values('soo@naver.com','이수일','1141','서울','마포',12345,'image4','010-9123-0223',0);

-- 권한
insert into AUTHORITY values('kim@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('kim@naver.com','ROLE_ADMIN');
insert into AUTHORITY values('kim@naver.com','ROLE_SITTER');
insert into AUTHORITY values('soo@naver.com','ROLE_SITTER');
insert into AUTHORITY values('lee@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('soo@naver.com','ROLE_MEMBER');
insert into AUTHORITY values('yoon@naver.com','ROLE_USER');

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
insert into code values('code-11','예약대기','예약');
insert into code values('code-12','예약확정','예약');
insert into code values('code-13','결제완료','예약');

--강아지
INSERT INTO DOG VALUES(dog_id_seq.nextval,'미륵','비숑','암컷',3.5,'20100608', 'kim@naver.com');
INSERT INTO DOG VALUES(dog_id_seq.nextval,'리코','슈바이처','암컷',4.5,'20100608', 'soo@naver.com');
INSERT INTO DOG VALUES(dog_id_seq.nextval,'순둥이','진돗개','수컷',5.5,'20100608', 'lee@naver.com');
INSERT INTO DOG VALUES(dog_id_seq.nextval,'까미','삽살개','투컷',6.5,'20100608', 'lee@naver.com');

-- 강아지정보
INSERT INTO DOGINFO VALUES(4 ,'code-7');
INSERT INTO DOGINFO VALUES(4, 'code-9');
INSERT INTO DOGINFO VALUES(4,'code-10');

--강아지 이미지
INSERT INTO DOG_IMAGE VALUES('SDFLKJSDFL','1');
INSERT INTO DOG_IMAGE VALUES('SDLFKJLVKJSD','1');
INSERT INTO DOG_IMAGE VALUES('QWEOUWEORE3TER','1');
INSERT INTO DOG_IMAGE VALUES('이미지 경로1 ','2');
INSERT INTO DOG_IMAGE VALUES('이미지 경로2 ','2');
INSERT INTO DOG_IMAGE VALUES('이미지 경로3 ','2');
INSERT INTO DOG_IMAGE VALUES('이미지 경로4 ','2');

--시터
INSERT INTO SITTER VALUES('kim@naver.com','가천대학교','이미지경로1','서울,경기',3.6);
INSERT INTO SITTER VALUES('soo@naver.com','대전대학교','이미지경로2','서울,천안',3.1);

--스킬
INSERT INTO SKILL VALUES('kim@naver.com','code-1');
INSERT INTO SKILL VALUES('kim@naver.com','code-2');
INSERT INTO SKILL VALUES('soo@naver.com','code-3');
INSERT INTO SKILL VALUES('soo@naver.com','code-4');

--리뷰
INSERT INTO REVIEW VALUES (1,3.5,'좋아요1','yoon@naver.com','kim@naver.com');
INSERT INTO REVIEW VALUES (2,3.5,'좋아요1','lee@naver.com','soo@naver.com');

--예약
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,0,'2010/07/01','2010/07/02','집에서 맡기기','yoon@naver.com','kim@naver.com');
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,1,'2010/07/01','2010/07/02','집에서 맡기기','yoon@naver.com','soo@naver.com');
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,0,'2010/07/01','2010/07/02','집에서 맡기기','lee@naver.com','kim@naver.com');
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,1,'2010/07/01','2010/07/02','집에서 맡기기','lee@naver.com','soo@naver.com');

--서비스 요구사항

insert into DEMAND values (1,'code-11'); 
insert into DEMAND values (2,'code-11'); 
insert into DEMAND values (3,'code-11');
insert into DEMAND values (3,'code-1');
insert into DEMAND values (3,'code-2');
insert into DEMAND values (3,'code-3');
insert into Demand values (4,'code-12');

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
-- 시터에 등록된 review를 조회

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

------------------------------------test
select m.email, m.member_name, s.school, c.code_name from member m, sitter s, skill sk, code c
where m.email = s.email and sk.email = s.email and code_skill = code;

select m.email, m.member_name, d.dog_name, di.dog_image from member m, dog d, dog_image di
where m.email = d.email and di.dog_id = d.dog_id;

select m.email, m.member_name, r.review_contents from member m, review r, sitter s
where m.email = s.email and m.email = r.email_sitter and s.email = 'soo@naver.com';

select m.email, m.member_name, r.res_type, c.care_contents, ci.care_image, cd.code_name, s.email, s.member_name, sl.total
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
			    r.res_type,
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
			    r.res_type,
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
			    r.res_type,
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
			    r.res_type,
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
<<<<<<< HEAD
		and     r.res_id = 2;
		
		
		
		
		
		
		
		
		
		
		
=======
		and     r.res_id = 2
		
		delete from member where email = 'kim@naver.com';
>>>>>>> branch 'master' of https://github.com/hgkimer/Plzdog.git
