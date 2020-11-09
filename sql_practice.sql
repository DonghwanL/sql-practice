-- 테이블 생성
create table employees(
    id varchar2(20) primary key,
    name varchar2(20) not null,
    password varchar2(30) not null,
    gender varchar2(10),
    birth date default sysdate,
    marriage varchar2(30),
    salary number default 100,
    address varchar2(50),
    manager varchar2(50)
);

select * from tab;
desc employees;
select * from employees;

insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('yusin', '김유신', 'abc1234', '남자', '1990/12/25', '결혼', 220, '용산', null);

insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('choi', '최영', 'abc1234', '남자', '1990/12/25', '결혼', 220, '용산', 'yusin');

insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('kang', '강감찬', 'abc1234', '남자', '1990/12/25', '결혼', 220, '마포', 'yusin');

commit;

create table emp01
as
select * from employees;

create table emp02
as
select id, name, marriage from employees;

create table emp03
as
select id, birth, salary, address from employees;

-- 내용 없이 단순 구조만 복사하기
create table emp04
as
select * from employees
where 1 = 2;

-- 휴대폰 컬럼 추가하기
alter table employees add (hphone varchar2(15));

-- 나이 컬럼 추가하기 (기본값 0)
alter table employees add (age number default 0);
desc employees;

-- 별칭 컬럼 추가하기(기본값 '철수')
alter table employees add (nickname varchar2(30) default '철수');


-- 매우 긴 아이디를 우선 입력해 봅니다. 
insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('yusinyusinyusinyusinyusin', '김유신', 'abc1234', '남자', '1990/12/25', '결혼', 220, '용산', null);

-- 컬럼 수정하기
alter table employees modify (id varchar2(30));
commit;
select * from employees;

-- 데이터가 들어가 있는 경우 데이터타입 변경 불가
alter table employees modify (hphone number);
alter table employees modify (nickname number); 

-- 컬럼의 이름 변경 및 삭제
alter table employees rename column hphone to handphone;
alter table employees rename column manager to mgr;

alter table employees drop column handphone;
alter table employees drop column nickname;

desc employees;

-- 테이블 이름 변경
rename employees to emp;
select * from emp;
drop table emp;

-- 테이블 생성
create table employees(
    id varchar2(20) primary key,
    name varchar2(20) not null,
    password varchar2(30) not null,
    gender varchar2(10),
    birth date default sysdate,
    marriage varchar2(30),
    salary number default 100,
    address varchar2(50),
    manager varchar2(50)
);

-- 추가 방법 01 
-- 컬럼 이름 명시하지 않고 추가하는 경우에는
-- 테이블 생성시 명시한 컬럼 순서대로 모두 입력해야 합니다.
insert into employees
values('yusin', '김유신', 'abc1234', '남자', '1990/12/25', '결혼', 220, '용산' ,null);
insert into employees
values('lee', '이순신', 'abc1234', '남자', '1990/12/25', '이혼', 220, '마포', 'yusin');
insert into employees
values('choi', '최영', 'abc1234', '남자', '1990/12/25', '결혼', 155, '강남', 'yusin');
insert into employees
values('kang', '강감찬', 'abc1234', '남자', '1990/12/25', '이혼', null, '서대문', 'yusin');

commit;
select * from employees;

-- 추가 방법 02 (추천)
-- 컬럼 이름 명시하는 경우 개수와 타입을 반드시 맞추어야 합니다.

insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('yoon', '윤봉길', 'abc1234', '남자', '1990/12/25', '미혼', 230, '용산', 'yusin');
insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('kim9', '김구', 'abc1234', '남자', '1990/12/25', '결혼', 280, '강남', null);
insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('general', '김좌진', 'abc1234', '남자', '1990/12/25', '이혼', 385, '서대문', 'kim9');
insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('an', '안중근', 'abc1234', '남자', '1990/12/25', '결혼', 360, '서대문', 'kim9');

commit;

-- 추가 방법 03
-- 필요 없는 컬럼을 명시하지 않는 경우엔 컬럼 이름과 값을 넣지 않습니다.
-- 급여가 책정되지 않는 직원들 (급여는 기본 값이 100으로 설정되어 있음_ 차후 업데이트시 수정)

insert into employees(id, name, password, gender, birth, marriage, address, manager)
values('nongae', '논개', 'abc1234', '여자', '1990/12/25', '미혼', '강남', 'soon');
insert into employees(id, name, password, gender, birth, marriage, address, manager)
values('queen', '선덕여왕', 'abc1234', '여자', '1990/12/25', '결혼', '용산', 'soon');

-- 매니저가 존재하지 않는 경우
insert into employees(id, name, password, gender, birth, marriage, salary, address)
values('soon', '유관순', 'abc1234', '여자', '1990/12/25', '미혼', 240, '마포');

select * from employees;
commit;

-- 추가 방법 04
-- 컬럼 이름을 임의로 명시하는 경우
insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('shin', 215, 'kim9', '서대문', '신사임당', 'abc1234', '여자', '1990/12/25', '미혼');
insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('hwang', 155, 'kim9', '용산', '황진이', 'abc1234', '여자', '1990/12/25', '결혼');
insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('myoung', 340, 'soon', '강남', '명성황후', 'abc1234', '여자', '1990/12/25', '이혼');
insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('maria', 390, 'soon', '서대문', '조마리아', 'abc1234', '여자', '1990/12/25', '이혼');
insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('princess', 185, 'soon', '마포', '덕혜옹주', 'abc1234', '여자', '1990/12/25', '결혼');

select * from employees;
commit;

-- 컬럼 1개 변경
-- 모든 사원들의 급여를 100으로 변경합니다.
update employees set salary = 100;

-- 모든 사원들의 비밀번호를 'qwert'로 변경합니다.
update employees set password = 'qwert';

-- 모든 사원들의 생일을 오늘 날짜로 변경하세요.
update employees set birth = sysdate;


-- 컬럼 여러 개 변경
-- 모든 사원들의 급여를 500으로, 비밀번호를 'acb1234'로 변경합니다.
update employees set salary = 500, password = 'abc1234';

-- where절 사용
-- '안중근'의 급여를 400으로 변경합니다.
update employees set salary = 400 where id = 'an';

-- '윤봉길'의 결혼여부를 '이혼'으로 변경합니다.
update employees set marriage = '이혼' where id = 'yoon';

-- 직원들의 급여를 10% 인상합니다. (단, null은 연산을 해도 결과가 null)
update employees set salary = 1.1 * salary; 

-- '김좌진'의 급여를 100 뺄셈합니다.
update employees set salary = salary - 100 where id = 'general';

-- 황진이'의 급여를 50 더하고, 주소를 '마포'로 변경합니다.
update employees set salary = salary + 50, address = '마포' where id = 'hwang';

-- '최영'이 '최부식'으로 개명을 했고, '서대문'으로 이사 했습니다.
update employees set name = '최부식', address = '서대문' where id = 'choi';

-- 관리자가 '김구'인 사원들의 급여를 600으로 변경합니다.
update employees set salary = 600 where manager = 'kim9';

-- 급여가 200이하인 사원들의 급여를 300으로 변경합니다.
update employees set salary = 300 where salary <= 200;

-- 관리자가 '김유신'이고 급여가 250이상은 사원들에 대하여 급여를 700원으로 변경합니다.
update employees set salary = 700 where manager = 'yusin' and salary >= 250;

-- '김구'이거나 '황진이'이면 급여를 450으로 변경합니다.
update employees set salary = 450 where id = 'kim9' or id = 'hwang';

-- '김구'이거나 '황진이'이면 급여를 1000으로 변경하되, in 키워드를 사용합니다.
update employees set salary = 1000 where id in ('kim9', 'hwang');

-- 관리자가 '김유신'이거나, '유관순'인 사원들의 급여를 555로 변경합니다. (in 키워드 사용)
update employees set salary = 555 where manager in ('yusin', 'soon');

-- 결혼 여부가 '미혼'또는 '이혼'이 아닌 사원들의 급여를 777로 변경합니다. (in 키워드 사용)
update employees set salary = 777 where marriage not in ('미혼', '이혼');

select * from employees;

-- 작업한 내용들을 롤백 합니다.
rollback;

-- 삭제하기
-- 모든 사원을 삭제합니다.
delete from employees;

-- 사원 '안중근'을 삭제합니다.
delete from employees where id = 'an';

-- 관리자가 '김유신'인 사원을 삭제합니다.
delete from employees where manager = 'yusin';

-- 관리자가 '김유신'이거나 '유관순'인 사원을 삭제합니다.
delete from employees where manager in ('yusin', 'soon');

-- 관리자가 '김유신'인 사원 중에서 급여가 220 이상인 사원을 삭제합니다.
delete from employees where manager = 'yusin' and salary >= 220;

-- 급여가 200미만이거나 300이상은 사원을 삭제합니다.
delete from employees where salary < 200 or salary >= 300;

-- 주소가 '마포'이거나 '용산'인 사원을 삭제합니다.
delete from employees where address in ('마포', '용산');

-- 주소가 '서대문'과 '강남'을 제외한 다른 지역에 거주하는 사원을 삭제합니다.
delete from employees where address not in ('서대문', '강남');

select * from employees;

update employees set address = '마포' where id = 'general';

-- 작업한 내용들을 롤백 합니다.
rollback;

-- 샘플용 테이블 생성
create table emp05
as
select id, name, salary, gender from employees where 1 = 2;

select * from emp05;

-- insert ... select 구문으로 '남자'만 emp05 테이블에 입력합니다.
insert into emp05(id, name, salary, gender)
select id, name, salary, gender from employees where gender = '남자';

-- 성별이 '여자'인 사람들의 이름/급여/주소를 신규테이블 emp06에 추가합니다. (insert ... select 구문 사용)

create table emp06
as
select name, salary, address from employees where 1 = 2;
select * from emp06;

insert into emp06(name, salary, address)
select name, salary, address from employees where gender = '여자';

commit;

-- 모든 사원을 조회 합니다.
-- *은 all columns를 의미 합니다.

select * from employees;

-- 모든 사원들의 아이디, 이름, 급여만 조회 합니다.
-- 여러개의 컬럼들은 콤마를 사용하면 됩니다.
select id, name, salary from employees;

-- 모든 사원들의 이름, 급여, 아이디 순서대로 조회 합니다.
select name, salary, id from employees;

-- 모든 사원들의 이름, 급여, 100추가된 급여를 조회 합니다.
select name, salary, 100 + salary from employees;

-- 모든 사원들의 이름, 급여, 연봉을 조회 합니다.
-- 단, 연봉은 급여의 12배라고 가정합니다.
select name, salary, 12 * salary from employees;

-- 모든 사원들의 이름과, 급여와 10% 인상된 금액과 연봉을 출력 합니다.
select name, salary, 1.1 * salary, 12 * salary from employees;
select name, salary, 1.1 * salary as newsalary, 12 * salary "ann sal" from employees;

-- distinct 키워드는 중복된 데이터에 한해서 하나만 추출
select gender from employees;
select distinct gender from employees;

-- 홍길동의 급여는 100원 입니다.
select name || '의 급여는 ' || salary || '원입니다.' from employees;

-- 이름 : 홍길동, 성별 : 남자, 급여 : 100
select '이름 : ' || name || ', 성별 : ' || gender || ', 급여 : ' || salary from employees;

-- 급여 책정이 안 된 사원을 출력 합니다.
select * from employees where salary is null;

-- 관리자 목록을 출력 합니다. (manager 컬럼이 null)
select * from employees where manager is null;

-- null 데이터의 연산 결과 확인
-- 모든 사원들의 이름과 급여 및 연봉을 조회 합니다.
select name, salary, 12 * salary from employees;

-- id가 'an'인 사원을 조회 합니다.
select * from employees where id = 'an';

-- 급여가 230 이상인 사원을 조회 합니다.
select * from employees where salary >= 230;

-- 남자들만 조회 합니다.
select * from employees where gender = '남자';

-- 급여가 220 이상이고, 400 이하인 사원을 조회 합니다.
select * from employees where salary >= 220 and salary <= 400;

select * from employees
where salary between 220 and 400;

select * from employees
where name between '사' and '자';

-- 급여가 350 이상이거나, 210 이하인 사원을 조회 합니다.
select * from employees where salary >= 350 or salary <= 210;

-- id가 'an' 또는 'soon'인 사원의 이름과 급여를 조회 합니다.
select name, salary from employees 
where id in ('an', 'soon');

-- 급여가 215이거나 230인 사원들을 조회 합니다.
select * from employees
where salary in (215, 230);

-- '김'씨만 조회 합니다.
select * from employees 
where name like '김%';

-- '신'이라는 단어가 포함된 사원을 조회 합니다.
select * from employees 
where name like '%신%';

-- 이름의 2번째 글자가 '순'이 들어있는 사원을 조회 합니다.
select * from employees 
where name like '_순%';

-- 이름의 끝에 '후'가 들어 있는 사원을 조회 합니다.
select * from employees 
where name like '%후';

-- 정렬 실습을 위하여 다음과 같이 데이터를 수정 합니다.
update employees set birth = sysdate where id in ('an', 'soon');
update employees set birth = null where id in ('queen', 'yusin');
update employees set birth = '1988/10/10' where id in ('kang', 'lee');
commit;

-- 급여가 적은 순서부터 출력 합니다.
select * from employees order by salary;

-- 이름을 '가나다' 순으로 출력 합니다.
select * from employees order by name asc;

-- 이름을 '가나다' 역순으로 출력 합니다.
select * from employees order by name desc;

-- 나이가 많은 순서부터 정렬한 다음, 급여가 적은 순으로 정렬하여 출력 합니다.
select * from employees order by birth asc, salary asc;

-- '여자' 먼저 출력되도록 하며, 급여가 많은 사람들이 먼저 출력되도록 합니다.
select * from employees order by gender desc, salary desc;

-- 성별에 대하여 오름차순, 결혼 여부에 대하여 내림차순으로 정렬 합니다.
select * from employees order by gender asc, marriage desc;

-- alias를 사용한 데이터 정렬
-- 이름과 연봉을 출력하되, 연봉이 높은 순으로 정렬 합니다.
select name, 12 * salary as annsal from employees order by annsal desc;

-- 컬럼 번호를 이용한 데이터 정렬
select name, 12 * salary as annsal from employees order by 2 desc;

-- 부정어
-- '김구'와 '김유신'을 제외한 모든 사원을 출력 합니다.
select * from employees where id not in ('kim9', 'yusin');

-- '이혼'한 사람을 제외한 모든 사원을 출력 합니다.
select * from employees where marriage not in ('이혼');

-- 급여가 200과 230사이에 포함되지 않는 사원을 출력 합니다.
-- (주의사항) null은 연산에 반영이 안됩니다.
select * from employees where salary not between 220 and 230;

-- 성씨가 '김'씨가 아닌 모든 사원들을 출력 합니다.
select * from employees where name not like '김%';

-- 연봉 협상이 완료된 사원들을 출력 합니다.
select * from employees where salary is not null;

-- 관리자가 아닌 일반 사원 목록을 출력 합니다.
select * from employees where manager is not null;

-- 복합 문제
-- '남자'이면서, 급여가 230미만인 사원들을 출력 합니다.
select * from employees
where gender = '남자' and salary < 230;

-- 기혼자 중에서, '서대문'에 거주하는 사원들을 출력 합니다.
select * from employees 
where marriage = '결혼' and address = '서대문';

-- 기혼자 이거나, '용산' 또는 '마포'에 거주하는 사원들을 출력 하되, 급여 순으로 오름차순 정렬 합니다.
select * from employees 
where marriage = '결혼' or address in ('용산', '마포')
order by salary asc;

-- 성씨가 '김'씨 이거나, '여자'인 사원들을 출력 하되, 이름에 대하여 내림차순으로 정렬 합니다.
select * from employees 
where name like '김%' or gender in ('여자')
order by name desc;

-- 관리자가 '김구'이면서, '서대문'에 거주하는 사원들을 출력 합니다.
select * from employees 
where manager = 'kim9' and address = '서대문';