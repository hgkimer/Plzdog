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
select * from res_detail;
select * from waiting;
delete from reservation 
insert into AUTHORITY values('zxc','ROLE_SITTER');

-----------------------------------------
--시터용 값 insert------------------------

--insert into AUTHORITY values('sitter@naver.com','ROLE_ADMIN');

insert into AUTHORITY values('admin@naver.com','ROLE_ADMIN');

insert into AUTHORITY values('admin1@naver.com','ROLE_SITTER');

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
insert into RESERVATION values(RESERVATION_id_seq.NEXTVAL,1,'2010/07/01','2010/07/02','집에서 맡기기',30000,res-1,'yoon@naver.com','soo1@naver.com');

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

select * from RESERVATION

select * from CARE

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
				c.code,
				c.code_name,
				c.category,
				d.dog_name,
				d.species,
				d.gender,
				d.weight,
				d.birth,
				i.dog_image
		from	member m, dog d, dog_image i, sitter s, skill k, code c
		where	s.email = m.email 
		and		s.email = d.email
		and	    d.dog_id = i.dog_id 
		and		s.email = k.email(+)
		and		k.code_skill = c.code
		and 	m.email = 'yoon@naver.com'
		
		select	r.res_id,
			r.res_status,
			r.res_sdate,
			r.res_edate,
			r.price,
			r.email,
			r.email_sitter
		from	reservation r
		where r.email_sitter ='soo1@naver.com'
		
		select	r.res_id,
				r.res_status,
				r.res_sdate,
				r.res_edate,
				r.price,
				r.email,
				r.email_sitter,
				d.dog_id,
				d.dog_name,
				d.species,
				d.gender,
				d.birth,
				i.dog_image
		from	reservation r, res_detail t, dog_image i, dog d
		where r.email = d.email 
		and r.email_sitter ='soo1@naver.com'
		and t.res_id = r.res_id
		and t.dog_id = d.dog_id 
		and d.dog_id = i.dog_id(+)
		
		select	m.email,
				m.member_name,
				m.password,
				m.main_address,
				m.sub_address,
				m.zipcode,
				m.member_image,
				m.phonenum,
				m.member_enable,
				a.authority,
				s.school,
				s.certification,
				s.service_address,
				s.sitter_rate,
				s.VISIT_PRICE,
				s.give_price,
				c.code,
				c.code_name,
				c.category,
				d.dog_name,
				d.species,
				d.gender,
				d.weight,
				d.birth,
				i.dog_image
		from	member m, authority a, dog d, DOGINFO f, dog_image i, sitter s, skill k, code c
		where	s.email = m.email
		and		m.email = d.email(+)
		and		m.email = a.email
		and		s.email = k.email
		and		k.code_skill = c.code
		and	    d.dog_id = i.dog_id(+)
		and		d.dog_id = f.dog_id
		and		f.code_dog = c.code
		and     m.member_enable = '1'
		and  	s.email = 'soo1@naver.com' 

/* 강사님이 해주신 것 */		
select	m.email, m.member_name, m.password, m.main_address, m.sub_address, m.zipcode,
		m.member_image, m.phonenum, m.member_enable,
		s.school, s.certification, s.service_address, s.sitter_rate, s.VISIT_PRICE, s.give_price,
		c.code, c.code_name, c.category, 
		d.dog_name, d.species, d.gender, d.weight, d.birth,
		dc.code, dc.code_name, dc.category,
		dim.dog_image,
		a.authority
from  	member m, sitter s, skill sk, code c, dog d, doginfo di, code dc, dog_image dim, authority a
where 	m.email = s.email
and		s.email = sk.email
and		sk.code_skill = c.code
and		m.email = d.email
and		d.dog_id = di.dog_id(+)
and		di.code_dog = dc.code(+)
and		d.dog_id = dim.dog_id(+)
and 	m.member_enable = '1'
and 	m.email = a.email		
and  	m.email = 'soo1@naver.com'

select	m.email, m.member_name, m.password, m.main_address, m.sub_address, m.zipcode,
		m.member_image, m.phonenum, m.member_enable,
		s.school, s.certification, s.service_address, s.sitter_rate, s.VISIT_PRICE, s.give_price,
		c.code, c.code_name, c.category, 
		d.dog_name, d.species, d.gender, d.weight, d.birth,
		dc.code, dc.code_name, dc.category,
		dim.dog_image,
		a.authority
from  	member m, sitter s, skill sk, code c, dog d, doginfo di, code dc, dog_image dim, authority a
where 	m.email = s.email
and		s.email = sk.email(+)
and		sk.code_skill = c.code(+)
and		m.email = d.email(+)
and		d.dog_id = di.dog_id(+)
and		di.code_dog = dc.code(+)
and		d.dog_id = dim.dog_id(+)
and 	m.member_enable = '1'
and 	m.email = a.email		
		
update member set password = '$2a$10$L0NFXewNsSA71F18CWumiOeTdegchXuVtA.tUJk8reEHlFCRLMp2u'

update reservation set res_status = 'res-5' where res_id = '13';
update reservation set res_status = 'res-5' where res_id = '11';
update reservation set res_status = 'res-5' where res_id = '1';

update member set member_enable = 1 where email='kim@naver.com';

select * from care_image

select * from reservation

select	m.email, m.member_name, m.password, m.main_address, m.sub_address, m.zipcode,
				m.member_image, m.phonenum, m.member_enable,
				s.school, s.certification, s.service_address, s.sitter_rate, s.VISIT_PRICE, s.give_price,
				c.code_name sitter_skill, 
				d.dog_name, d.species, d.gender, d.weight, d.birth,
				dc.code_name dog_code,
				dim.dog_image,
				a.authority
		from  	member m, sitter s, skill sk, code c, dog d, doginfo di, code dc, dog_image dim, authority a
		where 	m.email = s.email
				and		s.email = sk.email
				and		sk.code_skill = c.code
				and		m.email = d.email
				and		d.dog_id = di.dog_id(+)
				and		di.code_dog = dc.code(+)
				and		d.dog_id = dim.dog_id(+)
				and 	m.member_enable = '1'
				and 	m.email = a.email	
		and  	m.email = 'soo1@naver.com'
order by d.dog_name		
		

select	m.email, m.member_name, m.password, m.main_address, m.sub_address, m.zipcode,
		m.member_image, m.phonenum, m.member_enable,
		s.school, s.certification, s.service_address, s.sitter_rate, s.VISIT_PRICE, s.give_price,
		c.code, c.code_name, c.category,
		a.authority
		from  member m, sitter s, skill sk, code c, authority a
		where 	m.email = s.email
		and		s.email = sk.email(+)
		and		sk.code_skill = c.code(+)
		and 	m.member_enable = '1'
		and 	m.email = a.email	
		and  	m.email = 'soo1@naver.com'
		
   select  d.dog_name, d.species, d.gender, d.weight, d.birth,
		   dc.code, dc.code_name, dc.category,
		   dim.dog_image
    from   dog d, doginfo di, code dc, dog_image dim
			where   di.code_dog = dc.code(+)
			and		d.dog_id = dim.dog_id(+)
			and 	d.dog_id = di.dog_id(+)
        	and  	d.email = 'soo1@naver.com'
			and d.dog_id = '11'
		
 select  d.dog_id, d.dog_name, d.species, d.gender, d.weight, d.birth,
				di.dog_image
				
   		from   	dog d, dog_image di, dogInfo dinfo, code c
		where   d.dog_id = di.dog_id(+)
		and		d.dog_id = dinfo.dog_id(+)
		and		dinfo.code_dog = c.code(+)
        	and  	d.email = 'soo1@naver.com'
			and d.dog_id = '11'
		
select	r.res_id,
				r.res_sdate,
				r.res_edate,
				r.price,
				r.res_status,
				r.email,
				r.email_sitter,
				d.dog_id,
				d.dog_name,
				d.species,
				d.gender,
				d.birth,
				i.dog_image
from	reservation r, res_detail t, dog_image i, dog d
where r.email = d.email 
and r.email_sitter = 'soo1@naver.com'
and t.res_id = r.res_id
and t.dog_id = d.dog_id 
and d.dog_id = i.dog_id(+)

select			r.res_id,
				r.res_status,
				r.res_sdate,
				r.res_edate,
				r.price,
				r.email,
				r.email_sitter,
				s.member_name,
				s.member_image
from			reservation r, member s
				res join demand -code by Email
where 			res_status = 'res_2'

		select	r.res_id,
				r.res_sdate,
				r.res_edate,
				r.res_contents,
				r.price,
				r.res_status,
				r.email,
				r.email_sitter,
				c.code_name,
				c.code,
				c.category
		from	reservation r, demand d, code c
		where r.res_id = 11
		and r.res_id = d.res_id 
		and d.code_demand = c.code(+)
		
		
		select  r.res_id,
				r.res_sdate,
				r.res_edate,
				r.price,
				r.res_status,
				r.email,
				r.email_sitter,
				m.email,
				m.member_name,
				m.main_address,
				m.sub_address,
				m.password,
				m.zipcode,
				m.member_image,
				m.phonenum,
				m.member_enable
		from	reservation r, member m
		where r.RES_STATUS = 'res-1'
		and	  r.email_sitter is null
		
		select * from dog
		
		insert into RESERVATION values(34,'2010/07/01','2010/07/02',10000,'의뢰내용1','res-1','dbsrb0322@naver.com',null);
		insert into res_detail values(34,21);
		insert into res_detail values(34,22);
		
		
		insert into RESERVATION values(35,'2010/07/01','2010/07/02',10000,'의뢰내용1','res-1','dbsrb0322@naver.com',null);
		insert into res_detail values(35,21);
		insert into res_detail values(35,22);
		
		
		insert into RESERVATION values(36,'2010/07/01','2010/07/02',10000,'의뢰내용1','res-1','dbsrb0322@naver.com',null);
		insert into res_detail values(36,21);
		insert into res_detail values(36,22);
		
		
		
		select  r.res_id,
				r.res_sdate,
				r.res_edate,
				r.price,
				r.res_status,
				r.email,
				r.email_sitter,
				d.dog_id,
				d.dog_name,
				d.species,
				d.gender,
				d.birth
		from	reservation r, res_detail t, dog d
		where r.email ='dbsrb0322@naver.com'
		and r.res_id = t.res_id
		and t.dog_id = d.dog_id 
		
		select  t.res_id,
				r.res_sdate,
				r.res_edate,
				r.price,
				r.res_status,
				r.res_contents,
				r.email,
				r.email_sitter,
				t.dog_id,
				d.dog_name,
				d.species,
				d.gender,
				d.birth
		from	reservation r, res_detail t, dog d
		where r.email = 'lee@naver.com'
		and r.res_id = t.res_id
		and t.dog_id = d.dog_id
		and	r.res_status = 'res-5'
		
		
		select  r.res_id,     r.res_sdate,     r.res_edate,     r.price,     r.res_status,     r.res_contents,     r.email,     r.email_sitter,     d.dog_id,     d.dog_name,     d.species,     d.gender,     d.birth   from reservation r, res_detail t, dog d      
		where r.email = 'lee@naver.com'   and r.res_id = t.res_id   and t.dog_id = d.dog_id   and r.res_status = 'res-5'   order by res_id
		
		delete from care_image where care_id = 2
		
		select * from care_image
		
		select	m.email,
				m.member_name,
				m.main_address,
				m.sub_address,
				m.password,
				m.zipcode,
				m.member_image,
				m.phonenum,
				m.member_enable,
				a.authority
		from	member m, authority a
		where   m.email = a.email
		order by a.authority asc
		
		select	m.email,
				m.member_name,
				m.main_address,
				m.sub_address,
				m.password,
				m.zipcode,
				m.member_image,
				m.phonenum,
				m.member_enable,
				a.authority,
				d.dog_name,
				d.species,
				d.gender,
				d.weight,
				d.birth,
				i.dog_image
		from	member m, authority a, dog d, DOG_IMAGE i
		where m.email = 'lee@naver.com'
		and	  m.email = a.email
		and   m.email = d.email(+)
		and	  d.dog_id = i.dog_id(+) 
		and   m.member_enable = '1'
		
		select sum(commission) from sales
		
		select sum(total) from sales
		
		select  r.res_id,
				r.res_sdate,
				r.res_edate,
				r.price,
				r.res_status,
				r.res_contents,
				r.email,
				r.email_sitter,
				d.dog_id,
				d.dog_name,
				d.species,
				d.gender,
				d.birth
		from	reservation r, res_detail t, dog d
		where r.res_status in('res-2','res-4')
		and r.res_id = t.res_id
		and t.dog_id = d.dog_id
		and	r.email = 'lee@naver.com'
		order by res_id desc
		
		select  r.res_id,
				r.res_sdate,
				r.res_edate,
				r.price,
				r.res_status,
				r.res_contents,
				r.email,
				r.email_sitter
		from	reservation r
		where res_status in('res-2','res-4')
		order by res_id desc
		