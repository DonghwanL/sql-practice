
-- oraman 사용자는 bigbang 사용자에게 employees 테이블의 일부분을 보여 줍니다.
-- 단, 전체가 아닌 아이디, 이름, 성별, 생일만 보여 줍니다.

create or replace view view01
as
select id, name, gender, birth from employees;

-- 현재 보유한 테이블 및 View 목록을 확인
select * from tab;

-- View도 테이블 처럼 desc와 select 구문이 가능
-- 테이블의 전체가 아닌 부분 집합의 결과가 출력
desc view01;
select * from view01;

-- 객체권한을 부여 (to Bigbang view01)
grant select on view01 to bigbang;

-- 객체권한을 취소 (to Bigbang view01)
revoke select on view01 from bigbang;

-- 데이터 사전 (오라클이 객체들을 관리하기 위하여 내부적으로 저장하고 있는 테이블)
-- 테이블 목록 (user_tables), 뷰 목록 (user_views), 시퀀스 목록 (user_sequences)
select * from tab;
select * from seq;

desc user_views;
select view_name, text from user_views order by view_name;

-- 새로운 view 생성
create or replace view view02
as
select id, name, birth, address from employees;

create or replace view view03
as
select id, name, password, birth from employees;

select view_name, text from user_views order by view_name;

-- 데이터 사전의 내용은 대문자로 조회해야 결과 조회 가능
select view_name, text from user_views
where view_name = 'view01'
order by view_name;

select view_name, text from user_views
where view_name = 'VIEW01'
order by view_name;

-- 뷰를 사용하여 간접적으로 데이터 추가
-- view02 이용 (not null 제약 조건을 충족하지 않아 오류)
insert into view02 values('sim', '심형래', sysdate, '마포');
desc employees;

-- view03 이용
insert into view03 values('sim', '심형래', 'abc123', sysdate);

-- view04를 생성하고 'bigbang'에게 조회 권한 부여
create or replace view view04
as
select id, name, birth, gender
from employees
where address = '용산'
order by name desc;

grant select on view04 to bigbang;

-- Join을 View 문장으로 변환
select e.id, e.name, e.salary, b.subject, b.content
from employees e join boards b
on e.id = b.writer;

create or replace view view05
as
select e.id, e.name, e.salary, b.subject, b.content
from employees e join boards b
on e.id = b.writer;

-- 조건(where 절)에 맞는 행은 수정 불가능 (with check option)
-- '최영'은 view06에 포함되는 사원으로 with check option에 해당되므로 업데이트 불가
create or replace view view06
as
select * from employees
where manager = 'yusin'
with check option;

select * from view06;

update view06 set manager = 'soon'
where id = 'an';

update view06 set manager = 'kim09'
where id = 'choi';

-- 사용자에게 단순히 보여주는 용도, 수정 불가 (with read only)
create or replace view view07
as
select * from employees
where manager = 'yusin'
with read only;

select * from view07;

update view07 set name = '안창호'
where id = 'an';

update view07 set name = '최무룡'
where id = 'choi';

-- [top N 구문]
-- 게시물 페이지에서 특정 페이지 범위의 내용을 추출하기 위한 구문
-- 2페이지를 조회하는 구문 작성, 단 1페이지에 3개씩 출력

-- 가장 먼저 들어간 데이터의 rownum은 1 
select rownum, rowid, no, writer, password, subject, content, readhit, regdate
from boards;

-- order by 절을 이용하여 순서 변경, rownum에도 변화 없음
select rownum, rowid, no, writer, password, subject, content, readhit, regdate
from boards
order by no desc;

-- select 구문이 연속적으로 사용되는 것을 inline view라고 함
-- rownum을 인위적으로 변경
select rownum, no, writer, password, subject, content, readhit, regdate
from (select no, writer, password, subject, content, readhit, regdate
        from boards order by no desc);
 
-- <= 연산자는 잘 동작, 하지만 >=는 inline view에서는 동작하지 않음       
select rownum, no, writer, password, subject, content, readhit, regdate
from (select no, writer, password, subject, content, readhit, regdate
        from boards order by no desc)
where rownum <= 3;        

select rownum, no, writer, password, subject, content, readhit, regdate
from (select no, writer, password, subject, content, readhit, regdate
        from boards order by no desc)
where rownum >= 3 and rownum <= 5;  

select no, writer, password, subject, content, readhit, regdate
from (
    select rank() over(order by no desc) as ranking, no, writer, password, subject, 
    content, readhit, regdate
    from boards) 
where ranking between 1 and 3;   
