-- 게시물 테이블 이름을 boards라고 가정 합니다.
-- [boards 테이블의 column 구성]
-- no(글 번호), writer(작성자), password(비밀번호), subject(글 제목), content(글 내용)
-- readhit(조회 수), regdate(작성 일자)

-- 회원이 탈퇴를 하는 경우, 이전에 작성한 게시물은 남기도록 합니다.
alter table boards
add constraint aaa
foreign key(writer)
references employees(id)
on delete set null;

-- 상품이 지워졌을 때, 매출은?
on delete set null;

-- 주문 테이블과 주문 상세 테이블이 있습니다. 
-- 주문 취소시 주문 상세 테이블은?
on delete cascade;

-- 게시물 테이블 및 관련 시퀀스를 생성 합니다.
create sequence seqboard;

create table boards(
    no number primary key,
    writer varchar2(30),
    password varchar2(50),
    subject varchar2(50),
    content varchar2(50),
    readhit number default 0,
    regate date default sysdate
);

alter table boards
add constraint boards_writer_fk
foreign key(writer)
references employees(id)
on delete set null;

-- 게시물 데이터 등록
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'an', 'abc123', '자바', '너무 어려워', default, '80/12/25');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'an', 'abc123', 'db', '그룹 바이', default, '88/07/17');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'an', 'abc123', 'jsp', '웹 프로그래밍', default, '86/08/15');

insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'queen', 'abc123', 'jdbc', '제이디비씨', default, '90/01/22');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'queen', 'abc123', 'sql', '에스큐엘', default, '93/06/17');

insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'maria', 'abc123', '자바', 'java', default, '00/01/22');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'maria', 'abc123', 'sql', '호호호', default, '08/06/17');

insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, null, 'abc123', 'sql', '호호호', default, '08/06/17');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, null, 'abc123', 'sql', '호호호', default, '08/06/17');

commit;

-- 게시물을 작성한 사람의 이름과 글제목을 출력 (오라클 조인)
select employees.name, boards.subject
from employees, boards
where employees.id = boards.writer;

-- 게시물을 작성한 사람의 이름과 글제목을 출력 (ANSI 조인 - 추천)
select employees.name, boards.subject
from employees join boards
on employees.id = boards.writer;

-- [별칭을 사용하여 조인] 
-- [추가적인 조건은 and 연산자를 사용]
-- 게시물을 작성한 사람의 이름과 글제목을 출력 (오라클 조인)
select e.name, b.subject
from employees e, boards b
where e.id = b.writer
and e.name in('안중근', '조마리아');

-- 게시물을 작성한 사람의 이름과 글제목을 출력 (ANSI 조인 - 추천)
-- 테이블 상세를 보고 Join 여부를 판단
select e.name, b.subject
from employees e join boards b
on e.id = b.writer
and e.name in('안중근', '조마리아');

-- [Non-Equi Join] 
select rownum, id, name, salary from employees;

update employees set salary = 100 * rownum;
commit;
select * from employees;

-- 급여 평가용 테이블 작성
create table grades(
    glevel varchar2(2), 
    lovsal number,
    highsal number
);

alter table grades rename column rowsal to lowsal;

insert into grades values('A', 0, 499);
insert into grades values('B', 500, 999);
insert into grades values('C', 1000, 1499);
insert into grades values('D', 1500, 1999);
insert into grades values('E', 2000, 10000);
commit;

-- 각 사원들의 이름과 급여와 급여 평가 결과를 출력
select e.name, e.salary, g.glevel
from employees e, grades g
where e.salary between g.lowsal and g.highsal;


-- [Outer Join] 
-- 사원의 이름과 게시물 제목과 내용을 조회
-- 단, 게시물을 남기지 않은 사원들도 같이 조회

-- 오라클의 Left Outer Join 
select e.name, b.subject, b.content
from employees e, boards b
where e.id = b.writer(+);

-- ANSI의 Left Outer Join
select e.name, b.subject, b.content
from employees e left outer join boards b
on e.id = b.writer;

-- 사원의 이름과 게시물 제목과 내용을 조회
-- 단, 탈퇴한 이전 사원들의 목록도 같이 조회

-- 오라클의 Right Outer Join 
select e.name, b.subject, b.content
from employees e, boards b
where e.id(+) = b.writer;

-- ANSI의 Right Outer Join
select e.name, b.subject, b.content
from employees e right outer join boards b
on e.id = b.writer;

-- ANSI의 Full Outer Join
select e.name, b.subject, b.content
from employees e full outer join boards b
on e.id = b.writer;


-- [Self Join] 
-- 안중근의 관리자는 김구
-- 사원_테이블.관리자_아이디 = 관리자_테이블.아이디

select emp.name || '의 관리자는 ' || mgr.name || '입니다.' as result
from employees emp inner join employees mgr
on emp.manager = mgr.id;

-- 관리자도 포함되도록 수정
select emp.name || '의 관리자는 ' || nvl(mgr.name, '본인') || '입니다.' as result
from employees emp left outer join employees mgr
on emp.manager = mgr.id;

-- [추가 예제]
-- 각 사원들은 몇 건의 게시물을 남겼는지 확인
select e.name, count(*) as cnt
from employees e inner join boards b
on e.id = b.writer
group by e.name
order by e.name desc;

-- 각 사원들은 몇 건의 게시물을 남겼는지 확인
-- 게시물을 남기지 않은 사원은 0로 출력
select e.name, count(writer) as cnt
from employees e left outer join boards b
on e.id = b.writer
group by e.name
order by e.name desc;