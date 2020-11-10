-- [DDL PART] *************************************************

-- Tourlist 테이블 생성 
create table Tourlist(
    name varchar2(30) primary key,
    gender varchar2(10) not null,
    age number not null,
    tplace varchar2(20) not null,
    price number,
    grade varchar2(20),
    bstate varchar2(20),
    bdate varchar2(40)
);

-- 데이터 추가
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('강정훈', '남성', 32, '미국', 420, '우수', '완료', '2020/03/15');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('송예나', '여성', 23, '독일', 310, '일반', '완료', '2020/09/30');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('지현우', '남성', 37, '홍콩', 180, 'VIP', '완료', '2020/05/03');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('송득형', '남성', 51, '페루', 390, 'VIP', '완료', '2019/11/20');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('연원주', '여성', 35, '핀란드', 298, '우수', '완료', '2020/02/17');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('김지섭', '남성', 28, '스페인', 270, '일반', '완료', '2020/04/18');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('박하영', '여성', 42, '영국', 320, '우수', '완료', '2020/09/07');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('홍진우', '남성', 24, '중국', 115, '일반', '완료', '2020/10/11');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('이경협', '남성', 40, '일본', 92, 'VIP', '완료', '2020/10/29');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('전민하', '여성', 26, '러시아', 200, '일반', '완료', 2020/06/12);

select * from tourlist;
desc tourlist;
commit;

-- CTAS 기법을 활용한 비어있는 임시 테이블 생성하기
create table Tourlist01
as
select * from Tourlist where 1=2;

-- 컬럼 이름 변경 및 수정
alter table tourlist rename column price to amount;

-- 테이블 이름 변경 및 수정
rename tourlist to tourlists;

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
