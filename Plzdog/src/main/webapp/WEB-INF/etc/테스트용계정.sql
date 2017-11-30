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


insert into AUTHORITY values('hgkimer@naver.com','ROLE_ADMIN');
insert into AUTHORITY values('hgkimer@naver.com','ROLE_SITTER');

INSERT INTO DOG VALUES(dog_id_seq.nextval,'멍멍이','비숑','암컷',3.5,'20100608', 'hgkimer@naver.com');

INSERT INTO DOGINFO VALUES(5 ,'code-7');
INSERT INTO DOGINFO VALUES(5, 'code-9');
INSERT INTO DOGINFO VALUES(5,'code-10');

INSERT INTO DOG_IMAGE VALUES('이미지 경로1 ','5');
INSERT INTO DOG_IMAGE VALUES('이미지 경로2 ','5');
INSERT INTO DOG_IMAGE VALUES('이미지 경로3 ','5');
INSERT INTO DOG_IMAGE VALUES('이미지 경로4 ','5');

INSERT INTO SITTER VALUES('hgkimer@naver.com','단국대','이미지경로1','서울,경기',3.6);

INSERT INTO SKILL VALUES('hgkimer@naver.com','code-1');
INSERT INTO SKILL VALUES('hgkimer@naver.com','code-2');

INSERT INTO REVIEW VALUES (4,3.5,'좋아요1','yoon@naver.com','hgkimer@naver.com');

insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,0,'2010/07/01','2010/07/02','집에서 맡기기','yoon@naver.com','hgkimer@naver.com');
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,1,'2010/07/01','2010/07/02','집에서 맡기기','yoon@naver.com','hgkimer@naver.com');

insert into DEMAND values (5,'code-11'); 
insert into DEMAND values (6,'code-11'); 

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

