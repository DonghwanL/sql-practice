-- 테이블 생성
-- primary key 또는 unique 제약 조건을 만들면, 자동으로 인덱스와 제약 조건이 생김
create table dept(
    deptno number primary key,
    dname varchar2(30),
    sales number
);

insert into dept values(10, '영업', 1000);
insert into dept values(20, '판매', 1000);
insert into dept values(30, '구매', 1000);

commit;

create table employees01(
    sabun number,
    name varchar2(30),
    job varchar2(30),
    deptno number 
);

-- employees01 테이블의 deptno 컬럼에 입력 가능한 값은 10, 20, 30
alter table employees01
add constraint bbb
foreign key(deptno)
references dept(deptno);

-- 사번과 이름 컬럼의 제약 조건이 없으므로 insert 가능
insert into employees01 values(null, null, '의사', 10);
insert into employees01 values(1, '김유신', '판사', 20);

-- parent key가 없을 경우 오류 발생 (50번 부서 없음)
insert into employees01 values(2, '이순신', '검사', 50);

-- unique와 not null 제약 조건
-- unique는 데이터가 입력 되었을 때 중복 불가 (null 가능), not null은 필수 사항
create table employees02(
    sabun number unique,
    name varchar2(30) not null,
    job varchar2(30),
    deptno number 
);

-- name 컬럼이 not null (오류 발생)
insert into employees02 values(null, null, '판사', 10);

-- 4번째 insert unique constraint violated (중복)
insert into employees02 values(null, '신사임당', '판사', 10);
insert into employees02 values(null, '강감찬', '판사', 10);
insert into employees02 values(1, '강감찬', '검사', 10);
insert into employees02 values(1, '이순신', '검사', 10);
insert into employees02 values(2, '을지문덕', '검사', 10);

commit;

-- primary key (unique + not null)
create table employees03(
    sabun number primary key,
    name varchar2(30) not null,
    job varchar2(30),
    deptno number 
);

insert into employees03 values(null, '을지문덕', '검사', 10);
insert into employees03 values(1, '을지문덕', '검사', 10);
insert into employees03 values(1, '을지문덕', '검사', 10);
insert into employees03 values(2, '을지문덕', '검사', 10);

commit;

-- check 제약 조건
create table employees04(
    sabun number primary key,
    name varchar2(30) not null,
    gender varchar2(1) check(gender in('m', 'f')),
    salary number check(salary >= 100)
);

insert into employees04 values(1, '김유신', 'm', 300);
insert into employees04 values(2, '김춘추', 'm', 50);
insert into employees04 values(3, '강감찬', 's', 300);
insert into employees04 values(4, '신사임당', 'f', 300);

commit;

-- USER_CONSTRAINTS (&는 치환 변수)
select t.table_name, t.constraint_name, t.constraint_type, t.status, 
c.column_name, t.search_condition
from user_constraints t, user_cons_columns c
where t.table_name = c.table_name
and t.constraint_name = c.constraint_name
and t.table_name = upper('&table_name');

-- 특정 테이블의 기본 키는 최소 0개, 최대 1개
-- 하나의 컬럼으로 기본 키를 만드는 것 (단일 PK), 2개 이상의 키를 이용하여 만드는 것 (복합 PK)
-- 품목 이름 (name), 분기 (quarter), 수량 (qty)
create table sales(
    name varchar2(20),
    quarter number,
    qty number,
    constraint sales_composite primary key(name, quarter)
);

insert into sales values('사과', 1, 10);
insert into sales values('사과', 2, 20);
insert into sales values('사과', 3, 50);
insert into sales values('사과', 4, 30);

select * from sales;

-- 다음 데이터는 인서트가 불가
insert into sales values('사과', 1, 10);
commit;

desc user_cons_columns;
select * from user_cons_columns where table_name = 'SALES';

-- 제약 조건의 이름 변경
alter table employees rename constraint sys_c007010 to employees_id_pk;
alter table employees rename constraint sys_C007009 to employees_password_nn;
alter table employees rename constraint sys_C007008 to employees_name_nn;

-- 제약 조건의 이름을 명시적으로 지정
create table emp07(
    empno number constraint emp07_empno_pk primary key,
    ename varchar2(10) constraint emp07_ename_nn not null,
    job varchar2(9) constraint emp07_job_uk unique,
    deptno number constraint emp07_deptno_fk references dept(deptno)
);