-- [DDL PART] *************************************************

-- Tourlist 테이블 생성 
create table Tourlists(
    id varchar2(30) primary key,
    name varchar2(30) not null,
    gender varchar2(10) not null,
    age number not null,
    tplace varchar2(20) not null,
    price number,
    grade varchar2(20),
    bstate varchar2(20),
    bdate varchar2(40)
);

-- 데이터 추가
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('kangjh', '강정훈', '남성', 32, '미국', 420, '우수', '완료', '2020/03/15');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('soong1','송예나', '여성', 23, '독일', 310, '일반', '완료', '2020/09/30');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('ji3618', '지현우', '남성', 37, '홍콩', 180, 'VIP', '완료', '2020/05/03');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('sdhkk', '송득형', '남성', 51, '페루', 390, 'VIP', '완료', '2019/11/20');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('wonju', '연원주', '여성', 35, '핀란드', 298, '우수', '완료', '2020/02/17');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('jusubi', '김지섭', '남성', 28, '스페인', 270, '일반', '완료', '2020/04/18');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('parkhay', '박하영', '여성', 42, '영국', 320, '우수', '완료', '2020/09/07');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('hongs', '홍진우', '남성', 24, '중국', 115, '일반', '완료', '2020/10/11');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('leegzz', '이경협', '남성', 40, '일본', 92, 'VIP', '완료', '2020/10/29');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('miha98', '전민하', '여성', 26, '러시아', 200, '일반', '완료', 2020/06/12);

select * from tourlists;
desc tourlist;
commit;

-- CTAS 기법을 활용한 비어있는 임시 테이블 생성하기
create table Tourlist01
as
select * from Tourlist01 where 1=2;

-- 컬럼 이름 변경 및 수정
alter table tourlists rename column price to amount;

-- 해당 컬럼의 길이 늘이기
desc tourlists;
alter table tourlists modify (gender varchar2(20));

-- [commit]
commit;


-- [DML PART] *************************************************

-- [UpDate] 

-- (1) 데이터 insert 단계에서 잘못 입력한 날짜를 수정 합니다.
update tourlists set bdate = '2020/06/12' where name = '전민하';

-- (2) 모든 예약자의 여행지를 '스위스'로 변경 합니다.
update tourlists set tplace = '스위스';

-- (3) 모든 예약자의 예약금을 10% 인상 합니다.
update tourlists set amount = 1.1 * amount;

-- (4) '김지섭' 고객의 여행지를 '세부'로 변경 합니다.
update tourlists set tplace = '세부' where name = '김지섭';

-- (5) '박하영' 고객의 이름을 '박정현'으로 변경 합니다.
update tourlists set name = '박정현' where name = '박하영';

-- (6) '연원주', '홍진우', '송예나' 고객의 예약상태를 '예약취소'로 변경 합니다.
update tourlists set bstate = '예약취소' where name in ('연원주', '홍진우', '송예나');

-- (7) 일반 등급 예약자 중 예약금이 100이상인 예약자는 등급을 '우수'로 변경 합니다.
update tourlists set grade = '우수' where grade = '일반' and amount >= 100;

-- (8) 우수 등급 예약자 중 예약금이 300이상인 에약자는 등급을 'VIP'로 변경 합니다.
update tourlists set grade = 'VIP' where grade = '우수' and amount >= 300;

-- (9) VIP 등급은 8%의 할인이 적용 됩니다.
update tourlists set amount = amount - amount * 0.08 where grade = 'VIP';

-- (10) 우수 등급은 5%의 할인이 적용 됩니다.
update tourlists set amount = amount - amount * 0.05 where grade = '우수';

-- [commit]
commit;

-- [rollback]
rollback;


-- [Delete]

-- (1) 모든 예약자를 삭제 합니다.
delete from tourlists;

-- (2) 예약자 '송득형'을 삭제 합니다.
delete from tourlists where name = '송득형';

-- (3) 예약상태가 '예약취소'인 예약 건을 삭제 합니다.
delete from tourlists where bstate = '예약취소';

-- (4) '우수' 등급 중 예약금이 150이하인 예약 건을 삭제 합니다.
delete from tourlists where grade = '우수' and amount <= 150;

-- (5) 여행지가 '세부'가 아닌 예약 건을 삭제 합니다.
delete from tourlists where tplace not in ('세부');

-- (6) 예약자의 나이가 50세 이상인 예약 건을 삭제 합니다.
delete from tourlists where age >= 50;

-- (7) 남성 예약자의 예약 건을 삭제 합니다.
delete from tourlists where gender = '남성';

-- (8) 2019/11/20일 예약 건을 삭제 합니다.
delete from tourlists where bdate = '2019/11/20';

-- (9) 'VIP' 등급의 예약 건을 삭제 합니다.
delete from tourlists where grade = 'VIP';

-- (10) 예약금이 200이상 300이하인 건을 삭제 합니다.
delete from tourlists where amount >= 200 and amount <= 300;

-- [commit]
commit;

-- [rollback]
rollback;


-- 'VIP' 등급 예약자만 VIP 테이블에 입력 합니다.
create table VIP
as
select name, gender, age, grade from tourlists where 1 = 2;

insert into VIP(name, gender, age, grade)
select name, gender, age, grade from tourlists where grade = 'VIP';


-- [DQL PART] *************************************************

-- (1) 모든 예약자를 조회 합니다.
select * from tourlists;

-- (2) 모든 예약자의 이름, 성별, 나이를 조회 합니다.
select name, gender, age from tourlists;

-- (3) 모든 예약자의 이름, 등급, 예약금 + 100을 조회 합니다.
select name, grade, amount + 100 from tourlists;

-- (4) 모든 예약자의 등급을 중복을 제외하고 추출 합니다.
select * from tourlists;
select distinct grade from tourlists;

-- (5) 이름 : , 등급 : , 여행지 : , 예약일자 : 로 출력 합니다.
select '이름 : ' || name || ', 등급 : ' || grade || ', 여행지 : ' || tplace || ', 예약일자 : ' || bdate from tourlists;

-- (6) 이름이 '전민하'인 예약자를 조회 합니다.
select * from tourlists where name = '전민하';

-- (7) 예약금이 250 이상, 350 이하인 예약자를 조회 합니다.
select * from tourlists where amount >= 250 and amount < 350;
select * from tourlists where amount between 250 and 350;

-- (8) 이름이 '김지섭', '홍진우'인 예약자의 예약상태와 예약일자를 조회 합니다.
select name, bstate, bdate from tourlists where name in ('김지섭', '홍진우');

-- (9) 예약자 중 '송'씨만 조회 합니다.
select * from tourlists where name like '송%';

-- (10) 예약자 중 '우'라는 단어가 포함된 사원을 조회 합니다.
select * from tourlists where name like '%우%';

-- (11) 예약일자를 최신 순으로 정렬 합니다.
select * from tourlists order by bdate desc;

-- (12) 예약금이 적은 순으로 정렬 합니다.
select * from tourlists order by amount asc;

-- (13) 예약자명을 '가나다'순으로 정렬 합니다.
select * from tourlists order by name asc;

-- (14) 'VIP' 등급이 먼저 출력되도록 하고, 예약금이 큰 순으로 정렬 합니다.
select * from tourlists order by grade asc, amount desc;

-- (15) 예약자 '연원주'와 '이경협'을 제외한 나머지 인원을 조회 합니다.
select * from tourlists where name not in ('연원주', '이경협');

-- (16) '예약취소'인 예약자를 제외한 나머지 인원을 조회 합니다.
select * from tourlists where bstate not in ('예약취소');

-- (17) 예약금이 입금된 인원만 조회 합니다.
update tourlists set amount = null where name in ('전민하', '박정현', '강정훈');

select * from tourlists where amount is not null;

-- (18) 예약상태가 완료이고, 여행지가 '세부'인 예약자를 조회 합니다.
select * from tourlists where bstate = '완료' and tplace = '세부';

-- (19) 성씨가 '김'씨 이거나, 여성인 예약자를 출력하되, 이름을 내림차순으로 정렬 합니다.
select * from tourlists where name like '김%' or gender in ('여성')
order by name desc;


-- [Function PART] *************************************************

-- [문자열 함수]

-- (1) 이름은 OOO이고, 예약금은 OOO 입니다.
select concat(concat(concat('이름은 ', name), concat('이고, 예약금은 ', amount)), '입니다.')
as result from tourlists;

-- (2) 예약일자를 연도까지만 추출 합니다.
select substr(bdate, 1, 4) from tourlists;

-- (3) 예약일자를 월과 일까지만 추출 합니다.
select substr(bdate, 6, 10) from tourlists;

-- (4) 예약일자를 일까지만 추출 합니다.
select substr(bdate, -2, 2) from tourlists;

-- (5) 예약자의 이름이 몇글자인지 확인 합니다.
select name, length(name) as 글자_개수 from tourlists;

-- (6) 예약자의 이름에 '정'이 들어 있는지 확인 합니다.
select name, instr(name, '정') from tourlists;

-- (7) 이름에 '우'가 들어간 모든 예약자를 확인 합니다.
select * from tourlists where instr(name, '우') > 0;

-- (8) 예약자 이름에 '우'를 '민'으로 변경 합니다.
select name, replace(name, '우', '민') from tourlists;

-- (9) 예약자의 이름을 거꾸로 변경 합니다.
select name, reverse(name) from tourlists;

-- (10) 예약자의 이름을 내림차순으로 정렬하고 공백에 특수문자를 채웁니다.
select name, rpad(name, 10, '★') from tourlists order by name desc;


-- [숫자형 함수]

-- (1) 예약금을 ceil() 올림, floor() 버림 합니다.
select name, amount, ceil(amount), floor(amount) from tourlists;

-- (2) 예약금을 소수점 둘째자리까지 반올림 합니다.
select name, round(amount, 2) as amount from tourlists;

-- (3) 모든 예약금을 절대 값으로 변경하고 루트를 씌운 결과를 출력 합니다. (소수점 둘째자리 반올림)
select name, round(sqrt(abs(amount)), 2) as amount from tourlists;

-- (4) 모든 예약금을 2제곱 합니다.
select name, power(amount, 2) as amount from tourlists;

-- (5) 예약금의 부호를 확인 합니다. (양수 1, 음수 -1, 0이면 0)
select name, amount, sign(amount) from tourlists;


-- [날짜 관련 함수]

-- (1) 날짜 데이터 포맷을 변경 합니다.
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';

-- (2) 예약일로부터 3개월 전 시간을 구합니다.
select name, add_months(bdate, - 3) as 예약일 from tourlists;

-- (3) 모든 예약 건이 최초 예약일로부터 몇개월이 지났는지 확인 합니다.
select name, round(months_between(sysdate, bdate), 2) as 경과일 from tourlists;

-- (4) '송득형'과 '연원주'의 예약일자를 3개월 후로 변경 합니다.
update tourlists set bdate = add_months(bdate, + 3) where name in ('송득형', '연원주');

-- (5) '예약취소' 상태인 예약 건을 현재 일자로 변경 합니다.
update tourlists set bdate = sysdate where bstate in ('예약취소');


-- [null 관련 함수] 

-- (1) 모든 예약자의 예약금을 조회 합니다. (예약금이 존재하지 않는 경우 150으로 설정)
select name, nvl(amount, 150) as newamount from tourlists;

-- (2) 모든 예약자의 예약금을 조회 합니다. (예약금 입금 여부를 코멘트 합니다)
select name, nvl2(amount, '입금완료', '입금대기') as bookstate from tourlists;

-- (3) 모든 예약자의 에악상태를 조회 합니다. (단, 예약취소인 경우에는 null 값으로 처리)
select name, nullif(bstate, '예약취소') as 예약상태 from tourlists;


-- [Case 구문]

-- (1) 예약자의 이름과 예약금과 파생 결과를 출력 합니다.
-- 예약금이 200 이상이면 '우수', 300 이상이면 'VIP'를 출력 합니다.

select name, amount,
case
when nvl(amount, 150) >= 300 then 'VIP'
when nvl(amount, 150) >= 200 then '우수'
else '일반' end as grade
from tourlists;

-- (2) 예약자의 이름과 나이와 파생 결과를 출력 합니다.
-- 나이가 40대 이상이면 '중년', 30대 이상이면 '청년', 20대인 경우 '학생'으로 분류

select name, age,
case
when age >= 40 then '중년'
when age >= 30 then '청년'
else '학생' end as ageg
from tourlists;


-- [집합 연산]
-- tourlists 테이블에서 'VIP'만 추출하여 테이블 'VIP_TB'를 만듭니다.
-- 데이터 추가) 성별이 여성이거나 예약상태가 완료인 예약자만 추가
create table vip_tb
as
select * from tourlists where grade = 'VIP';

insert into vip_tb
select * from tourlists
where gender = '여성' and bstate = '완료';

select * from vip_tb;

-- tourlists 테이블에서 '우수'만 추출하여 테이블 'GRATE_TB'를 만듭니다.
-- 데이터 추가) 성별이 남성이거나 예약상태가 취소인 예약자만 추가
create table great_tb
as
select * from tourlists where grade = '우수';

insert into great_tb
select * from tourlists
where gender = '남성' and bstate = '예약취소';

select * from great_tb;
commit;

-- (1) Union 
select name, gender, age, grade, bstate from vip_tb
union
select name, gender, age, grade, bstate from great_tb;

-- (2) Union All
select * from vip_tb union all select * from great_tb;

-- (3) Intersect
select name, gender, age, grade, bstate from vip_tb
intersect
select name, gender, age, grade, bstate from great_tb;
 
-- (4) Minus
select name, gender, age, grade from vip_tb
minus
select name, gender, age, grade from great_tb
order by name desc;

select name, gender, age, grade from great_tb
minus
select name, gender, age, grade from vip_tb
order by name desc;


-- [Group 함수]

-- (1) 모든 예약자의 수를 구합니다.
select count(*) from tourlists;

-- (2) 입금액이 null인 행 수를 구합니다.
select count(*) - count(amount) from tourlists;

-- (3) 'GRADE' 컬럼에 몇 가지 유형의 데이터가 있는지 확인 합니다.
select count(distinct grade) from tourlists;

-- (4) 예약금의 총액을 구합니다.
select sum(amount) from tourlists;

-- (5) 여행지별 예약자가 각각 몇 명인지를 확인 합니다.
select tplace, count(*) as cnt
from tourlists
group by tplace;

-- (6) 남녀가 각각 몇 명인지를 확인 합니다.
select gender, count(*) as cnt
from tourlists
group by gender;

-- (7) 예약 상태와 최소 예약금, 최대 예약금을 조회 합니다.
-- 단, 에약금이 null인 경우 150으로 설정
select bstate, min(nvl(amount, 150)) as "최소 예약금", max(nvl(amount, 150)) as "최대 예약금"
from tourlists
group by bstate
order by bstate;

-- (8) 예약이 완료된 건의 모든 예약금의 평균을 구합니다. 
-- 단, 여행지가 세부인 경우 제외, 예약금이 null인 경우 150으로 설정
select bstate as "예약 상태", round(avg(nvl(amount, 150)),2) as "평균"
from tourlists
where tplace not in ('세부') and bstate = '완료'
group by bstate
order by bstate;

-- (9) 성별, 등급 별로 각각 몇 명인지 조회하되, 2명 이상만 조회되도록 합니다.
select gender, grade, count(*) as cnt
from tourlists
group by gender, grade
having count(*) >= 2
order by gender, grade;

-- (10) 예약일 중 최신 예약건을 구합니다.
-- 단, 2020년 7월 이전 예약 건은 제외
select name, gender, grade, max(bdate) as "최신 예약건"
from tourlists
group by name, gender, grade, bdate
having max(bdate) >= '2020/07/01' 
order by bdate;


-- [JOIN PART] *************************************************

-- 게시물 테이블 및 관련 시퀀스를 생성 합니다. 
create sequence seq_board_t;

create table t_boards(
    no number primary key,
    writer varchar2(30),
    subject varchar2(50),
    content varchar2(50),
    readhit number default 0,
    regdate date default sysdate
);

alter table t_boards
add constraint t_boards_writer_fk
foreign key(writer)
references tourlists(id)
on delete set null;

-- 게시물 데이터를 등록 합니다.
insert into t_boards(no, writer, subject, content, readhit, regdate)
values(seqboard.nextval, 'parkhay', '예약 건 변경 문의', '여행지를 변경하고 싶습니다', default, '2020/09/13');
insert into t_boards(no, writer, subject, content, readhit, regdate)
values(seqboard.nextval, 'parkhay', '예약 건 변경이 안되었어요', '전화로 상담 요청', default, '2020/09/15');

insert into t_boards(no, writer, subject, content, readhit, regdate)
values(seqboard.nextval, 'wonju', '예약 건 취소 하겠습니다~', '취소 문의', default, '2020/10/01');
insert into t_boards(no, writer, subject, content, readhit, regdate)
values(seqboard.nextval, 'wonju', '취소 건 환불', '환불계좌는 632183122212', default, '2020/10/03');

insert into t_boards(no, writer, subject, content, readhit, regdate)
values(seqboard.nextval, 'jusubi', '마일리지 관련해서 질문', '마일리지 문의', default, '2020/05/12');
insert into t_boards(no, writer, subject, content, readhit, regdate)
values(seqboard.nextval, 'jusubi', '등급 상향은 언제 되나요?', '몇일자로 등급 상향이 될까요?', default, '2020/06/13');

commit;

-- [Equi Inner Join]
-- 게시물을 작성한 사람의 이름과 글제목과 내용을 출력 합니다.
select t.name, b.subject, b.content
from tourlists t join t_boards b
on t.id = b.writer;

-- [Non-equi Inner Join]
-- 등급 평가용 테이블을 작성 합니다.
create table t_grades(
    glevel varchar2(30), 
    lowamt number,
    highamt number
);

insert into t_grades values('일반', 0, 100);
insert into t_grades values('우수', 150, 200);
insert into t_grades values('VIP', 250, 400);

commit;

-- 각 예약자의 이름, 등급, 예약금을 출력 합니다.
select t.name, t.grade, g.glevel
from tourlists t, t_grades g
where t.grade between g.lowamt and g.highamt;

-- [Outer Join] 
-- 게시물을 개재한 예약자의 이름과 게시물 제목과 내용을 조회 합니다.
-- 단 게시물을 남기지 않은 예약자도 같이 조회 합니다.
select t.name, b.subject, b.content
from tourlists t left outer join t_boards b
on t.id = b.writer;

-- 게시물을 개재한 예약자의 이름과 게시물 제목과 내용을 조회 합니다.
select t.name, b.subject, b.content
from tourlists t right outer join t_boards b
on t.id = b.writer;

-- 각 예약자들이 몇 건의 게시물을 남겼는지 확인 합니다.
-- 게시물을 남기지 않은 예약자는 0로 출력 합니다. 
select t.name, count(writer) as cnt
from tourlists t left outer join t_boards b
on t.id = b.writer
group by t.name
order by t.name desc;

-- [Self Join]


-- [SUBQUERY PART] *************************************************

-- [단일행 서브쿼리] 

-- (1) 평균보다 많은 예약금을 지불한 예약자의 이름과 예약금을 조회 합니다.
select name, amount
from tourlists
where amount >= (select avg(amount) from tourlists);

-- (2) 예약자 '연원주'보다 적은 예약금인 예약자들의 이름과, 예약금을 조회 합니다.
select name, amount
from tourlists
where amount < (select amount from tourlists where id = 'wonju');

-- (3) 예약상태가 완료이면서 예약일자가 2020/07/01일 이후인 예약자를 조회 합니다.
select name, id, bstate, bdate
from tourlists
where bstate in (select bstate from tourlists where bstate = '완료')
and bdate >= '2020/07/01';

-- [다중행 서브쿼리] 

-- (1) 등급이 VIP인 예약자들의 이름, 아이디, 성별을 조회 합니다.
select name, id, gender, grade
from tourlists
where id in (select id from tourlists where grade = 'VIP');

-- (2) 예약상태가 '예약취소'가 아닌 예약자들의 이름, 아이디, 성별을 조회 합니다.
select name, id, gender
from tourlists
where id not in (select id from tourlists where bstate = '예약취소');

-- (3) 예약상태 별 최저 예약금인 예약자의 이름, 아이디, 성별, 예약금, 에약상태를 출력 합니다.
select name, id, gender, amount, bstate
from tourlists
where (bstate, amount) in (select bstate, min(amount) from tourlists group by bstate);

-- (4) 등급이 '우수'인 예약자 중에서 최소 예약금인 인원보다 예약금이 많은 인원을 조회 합니다.
select name, amount from tourlists
where amount > any (select amount from tourlists where grade = '우수');

-- (5) 등급이 '우수'인 예약자 중에서 최소 예약금인 인원보다 예약금이 적은 인원을 조회 합니다.
select name, amount from tourlists
where amount < all (select amount from tourlists where grade = '우수');


-- [VIEW PART] *************************************************
-- [mango 사용자에게 보여줄 view 테이블 생성]
create or replace view mangov
as
select id, name, age, tplace, grade from tourlists;

select * from mangov;

-- [객체 권한을 부여 (to mango : 정상 조회 확인)]
grant select on mangov to mango;

desc mangov;
select view_name, text from user_views order by view_name;

-- [데이터 사전으로 결과 조회]
select view_name, text from user_views
where view_name = 'MANGOV'
order by view_name;

-- [뷰를 이용한 간접적인 데이터 추가]
create or replace view mangov1
as
select id, name, gender, age, tplace from tourlists;

desc mangov1;

insert into mangov1 values('junghu', '윤정후', '남성', 45, '미국');

select * from mangov1;

-- [view 문장으로 조인]
create or replace view mangov2
as
select t.id, t.name, t.gender, b.subject, b.content
from tourlists t join t_boards b
on t.id = b.writer;

select * from mangov2;

-- [with check option]
create or replace view mangov3
as
select * from tourlists
where grade = 'VIP'
with check option;

select * from mangov3;

-- VIP 등급에 해당되는 예약자는 with check option에 의해서 수정 불가
update mangov3 set grade = '우수'
where id = 'ji3618';

-- [with read only]
create or replace view mangov4
as
select * from tourlists
where grade = 'VIP'
with read only;

select * from mangov4;

-- VIP 등급에 해당되는 예약자는 with read only로 인해 수정 불가
update mangov4 set grade = '일반'
where id = 'sdhkk';

-- [페이징 처리]
select no, writer, subject, content, readhit, regdate
from (
    select rank() over(order by no desc) as ranking, no, writer, subject, content,
    readhit, regdate from t_boards)
where ranking between 1 and 3;


-- [CONSTRAINT PART] *************************************************
-- ['고양이' 정보 테이블 생성 및 데이터 추가]
create table catdesc(
    cno number primary key,
    ctype varchar2(30),
    location varchar2(50)
);

insert into catdesc values(1, '페르시아 고양이', '페르시아');
insert into catdesc values(2, '샴 고양이', '태국');
insert into catdesc values(3, '러시안 블루', '러시아');

select * from catdesc;
commit;

create table catinfo(
    cname varchar2(30) unique,
    cweight number,
    guardian varchar2(40) not null,
    cno number not null
);

-- [무결성 제약조건 생성]
alter table catinfo
add constraint catinfo
foreign key(cno)
references catdesc(cno);

-- [catinfo 테이블_ 데이터 추가]
desc catinfo;

-- cweight 컬럼은 not null 제약 조건이 없어 null 입력 가능
insert into catinfo values('망고', null, '이동환', 1);
insert into catinfo values('칠득', 2.5, '박보검', 3);

-- guardian 컬럼은 not null 제약 조건이 있어 null 입력 불가능
insert into catinfo values('루비', 7.5, null, 2);

-- cno 컬럼에 추가하고자 하는 number가 없음, parent key not found
insert into catinfo values('율무', 7.5, '박보영', 5);

-- cname 컬럼은 unique 제약 조건이 있어 중복이 불가능
insert into catinfo values('망고', 6.4, '이동환', 1);

-- [primary key]
create table catinfo01(
    cname varchar2(30) primary key,
    cweight number,
    guardian varchar2(40) not null,
    cno number
);

-- 정상적인 데이터 추가 
insert into catinfo01 values('치타', null, '권지용', 2);

-- primary key는 반드시 입력 되어야 함. (unique + not null)
insert into catinfo01 values(null, 5.5, '손예진', 3);


-- [check 제약 조건]
create table catinfo02(
    cname varchar2(30) primary key,
    cweight number,
    cgender varchar(5) check(cgender in ('m', 'f')),
    guardian varchar2(40) not null,
    carefee number check(carefee >= 500),
    cno number
);

select * from catinfo02;

-- 정상적인 데이터 추가
insert into catinfo02 values('소망', null, 'm', '한지민', 5000, 1);

-- carefee 컬럼 오류 (제약 조건 위반, carefee 500 이하)
insert into catinfo02 values('봉봉', null, 'm', '지현우', 300, 1);

-- cgender 컬럼 오류 (제약 조건 위반, 지정한 데이터 이외 다른 데이터 입력)
insert into catinfo02 values('마리', null, 'k', '김혜자', 3200, 2);


-- [USER_CONSTRAINTS 조회]
select t.table_name, t.constraint_name, t.constraint_type, t.status, 
c.column_name, t.search_condition
from user_constraints t, user_cons_columns c
where t.table_name = c.table_name
and t.constraint_name = c.constraint_name
and t.table_name = upper('&table_name');
