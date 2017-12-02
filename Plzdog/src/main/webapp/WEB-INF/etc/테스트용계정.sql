-----------------------------------------
--Table당 전체 조회-----------------------
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

insert into AUTHORITY values('zxc','ROLE_SITTER');

-----------------------------------------
--시터용 값 insert------------------------

--insert into AUTHORITY values('sitter@naver.com','ROLE_ADMIN');

--insert into AUTHORITY values('admin@naver.com','ROLE_ADMIN');

insert into AUTHORITY values('sitter@naver.com','ROLE_SITTER');

INSERT INTO DOG VALUES(dog_id_seq.nextval,'멍멍이','비숑','암컷',3.5,'20100608', 'sitter@naver.com');

INSERT INTO DOGINFO VALUES(5,'dog-1');
INSERT INTO DOGINFO VALUES(5,'dog-2');

INSERT INTO DOG_IMAGE VALUES('이미지 경로1 ','5');
INSERT INTO DOG_IMAGE VALUES('이미지 경로2 ','5');
INSERT INTO DOG_IMAGE VALUES('이미지 경로3 ','5');
INSERT INTO DOG_IMAGE VALUES('이미지 경로4 ','5');

INSERT INTO SITTER VALUES('sitter@naver.com','단국대','이미지경로1','서울,경기',3.6);

INSERT INTO SKILL VALUES('sitter@naver.com','sitter-1');
INSERT INTO SKILL VALUES('sitter@naver.com','sitter-2');
INSERT INTO SKILL VALUES('sitter@naver.com','sitter-3');

INSERT INTO REVIEW VALUES (4,3.5,'좋아요1','yoon@naver.com','sitter@naver.com');

insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,0,'2010/07/01','2010/07/02',30000,'집에서 맡기기','yoon@naver.com','sitter@naver.com');
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,1,'2010/07/01','2010/07/02','집에서 맡기기','yoon@naver.com','sitter@naver.com');

insert into DEMAND values (5,'dog-2'); 
insert into DEMAND values (6,'dog-1'); 

insert into SALES values(5,100000 ,90000 ,10000, '2017/07/03');
insert into SALES values(6,100000,90000,10000,'2017/07/04');

insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 귀여워용',5,'2017/08/09');
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 이뻐용',5,'2017/08/09');
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 아름다워요',5,'2017/08/09');
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 사랑스러워용',6,'2017/08/09');
insert into care values(CARE_id_seq.NEXTVAL,'강아지가 너무 사랑스러워용',6,'2017/08/09');

insert into CARE_IMAGE values('돌봄이미지1',5);
insert into CARE_IMAGE values('돌봄이미지4',5);
insert into CARE_IMAGE values('돌봄이미지2',5);
insert into CARE_IMAGE values('돌봄이미지3',6);
insert into CARE_IMAGE values('돌봄이미지5',6);
-----------------------------------------
--견주용 값 insert------------------------
INSERT INTO DOG VALUES(dog_id_seq.nextval,'견주의 개','비숑','암컷',3.5,'20100608', 'dog@naver.com');

INSERT INTO DOGINFO VALUES(6 ,'dog-1');
INSERT INTO DOGINFO VALUES(6, 'dog-2');
INSERT INTO DOGINFO VALUES(6,'dog-3');

INSERT INTO DOG_IMAGE VALUES('이미지 경로1 ','6');
INSERT INTO DOG_IMAGE VALUES('이미지 경로2 ','6');
INSERT INTO DOG_IMAGE VALUES('이미지 경로3 ','6');
INSERT INTO DOG_IMAGE VALUES('이미지 경로4 ','6');

------------------------------------------------------------------


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
		where	s.email = 'sitter@naver.com' 
		and		s.email = m.email 
		and		s.email = d.email 
		and 	k.code_skill = c.code 
		and 	s.email = k.email(+);
		
		select	m.email,
				m.member_name,
				m.main_address,
				m.sub_address,
				m.password,
				m.zipcode,
				m.member_image,
				m.phonenum,
				m.member_enable,
				d.dog_name,
				d.species,
				d.gender,
				d.weight,
				d.birth
		from	member m, dog d
		where m.email = '1211'
		and   m.email = d.email(+)
		and   m.member_enable = '1'
		
		select	r.res_id,
				r.res_type,
				r.res_sdate,
				r.res_edate,
				r.res_contents,
				r.price,
				r.email,
				r.email_sitter,
				c.code_name,
				c.code,
				c.category
		from	reservation r, demand d, code c
		where   r.res_id = d.res_id 
		and     d.code_demand = c.code
		and     r.email_sitter = 'sitter@naver.com'
		
update member set password = '$2a$10$L0NFXewNsSA71F18CWumiOeTdegchXuVtA.tUJk8reEHlFCRLMp2u'
