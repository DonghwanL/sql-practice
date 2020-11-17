-- [문제 1]
-- [관리자]
-- ['dori' 계정 생성 후 테이블 생성]
create user dori identified by dori123 account unlock;
alter user dori default tablespace users;
grant create session, create table to dori;

-- [갑돌이]
-- [테이블 생성]
create table members(
    id varchar2(10) primary key,
    name varchar2(30) not null,
    address varchar2(15),
    hobby varchar2(30) check(hobby in('당구', '퀄트', '맞고')),
    salary number check(salary >= 100)
);

create table boards(
    writer varchar2(10),
    subject varchar2(30),
    password number,
    content varchar2(50),
    readhit number default 0
);


-- [테이블에 데이터 추가]
insert into members values('hong', '홍길동', '마포 공덕', '당구', 100);
insert into members values('park', '박영희', '용산 도원', '퀄트', 200);
insert into members values('kim', '김철수', '강남 역삼', '맞고', 300);
insert into members values('choi', '최재우', '세종시', '맞고', 300);

select * from members;

insert into boards values('hong', 'jsp어려워', 1234, '정말 어려워요', 0);
insert into boards values('hong', '어떤 글', 1234, '정말 쉬워요', 5);
insert into boards values('hong', '열공합시다', 1234, '멍멍멍', 2);
insert into boards values('park', '어떤 글', 1234, '하하하하하하', default);
insert into boards values('park', '열공합시다', 1234, '히히히히', 5);

select * from boards;
commit;

-- [참조 무결성 제약 조건 만들기]
alter table boards
add constraint asdf
foreign key(writer)
references members(id);

-- [문제 2]
-- [관리자]
-- ['soon' 계정 생성 및 권한 부여]
create user soon identified by soon123 account unlock;
alter user soon default tablespace users;
grant create session, create table, create view to soon;

-- [갑순이]
-- [테이블 생성]
create table BranchA(
   id number, 
   name varchar2(50),
   publisher varchar2(50),
   price number
);

create table BranchB(
   id number, 
   name varchar2(50),
   publisher varchar2(50),
   price number
);

-- [시퀀스 생성 및 테이블에 데이터 추가]
create sequence seqbranch;

insert into BranchA values(seqbranch.nextval, '야구의 역사', '데일리 스포츠', 1000);
insert into BranchA values(seqbranch.nextval, '월간 축구', '가나 출판사', 2000);
insert into BranchA values(seqbranch.nextval, '스포츠의 이해', '대한 출판사', 3000);

select * from BranchA;

insert into BranchB values(seqbranch.nextval, '야구의 역사', '데일리 스포츠', 1000);
insert into BranchB values(seqbranch.nextval, '당구 교본', '대한 출판사', 4000);
insert into BranchB values(seqbranch.nextval, '호신술', '데일리 스포츠', 5000);

commit;
select * from BranchB;

-- [문제 3]
-- [합집합 결과를 조회하여 신규 테이블 'MyBranch'를 생성, 중복된 데이터는 한 개로 표현]
-- [갑순이]
create or replace view view01
as
select * from BranchA union select * from BranchB

grant select on view01 to dori;

-- [갑돌이]
select * from soon.view01;

create table MyBranch
as
select distinct name, publisher, price from soon.view01;

select * from MyBranch;

-- [문제 4]
-- [갑돌이]
-- [주소 입력을 위한 address 컬럼 크기 변경]
alter table members modify(address varchar2(100));
update members set address = '서울시 마포구 공덕동 마포 래미안 프루지오 111동 222호'
where id = 'park';

-- [새로운 취미 입력을 위한 제약 조건 변경]
alter table members drop constraint members_hobby_ck;
alter table members add constraint members_hobby_ck check(hobby in('당구', '퀄트', '맞고', '조깅'));

alter table members drop constraint members_salary_ck;
alter table members add constraint members_salary_ck check(salary >= 500);

insert into members values('lee', '이순신', '서대문 신촌', '조깅', 500);
insert into members values('shin', '신사임당', '서대문 신촌', '조깅', 30);

commit;

-- [문제 5]
-- [갑돌이]
-- [members 테이블의 제약 조건 이름 변경]
alter table members rename constraint sys_c007132 to members_name_nn;
alter table members rename constraint sys_C007133 to members_hobby_ck;
alter table members rename constraint sys_c007134 to members_salary_ck;
alter table members rename constraint sys_c007135 to members_id_pk;

commit;

-- [문제 6] 
-- [최소 급여를 받는 사원의 이름과 급여와 주소를 출력]
-- [갑돌이]
create or replace view minview
as
select name, salary, address from members
where salary = (select min(salary) from members);

select * from minview;

grant select on minview to soon;

-- [갑순이]
select * from dori.minview;

-- [게시물을 남기지 않은 사원들의 이름과 주소를 출력]
-- [갑돌이]
create or replace view noboard
as
select m.name, m.address 
from members m left outer join boards b
on m.id = b.writer
and m.id not in('hong', 'park');

select * from noboard;
grant select on noboard to soon;

-- [갑순이]
select * from dori.noboard;

-- [문제 7]
-- 롤 newrole 생성, view 생성, role 생성 권한을 부여 -> '갑순이'
-- [관리자]

create role newrole;
grant create view, create role to newrole;

grant newrole to soon;

-- [갑순이]

create role soonrole;
grant select on BranchA to soonrole;
grant insert on BranchA to soonrole;

grant soonrole to dori;

-- [갑돌이]
select * from soon.BranchA;
