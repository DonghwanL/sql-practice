-- [DUAL TABLE] 
select * from dual;

select 4 * 3 + 2 from dual;
select 4 * (3 + 2) from dual;
select 4 * 4 * 4 from dual;

select power(2, 10) from dual;

select upper('abc123') from dual;

-- [문자 함수]
-- 아이디와 이름을 출력 합니다.
select id, upper(id), lower(id), initcap(id), name from employees;

-- concat 함수 사용 (문자열 결합 = concatenation)
select concat('아이디 : ', name) as result from employees;

-- 이름은 홍길동이고, 급여는 100 입니다.
select concat(concat(concat('이름은 ', name), concat('이고, 급여는 ', salary)), '원 입니다.') 
as result from employees;

-- substr() - 1 Base : 문자열을 부분 추출 합니다.
-- 4번째부터 끝까지 추출
select substr(password, 3) from employees;

-- 1번째부터 3번째까지 추출 
select substr(password, 1, 3) from employees;

-- 뒤에서 5번째부터 2개만 추출
select substr(password, -5, 2) from employees;

update employees set password = 'abc1234' where id = 'yusin';
commit;

-- 사원의 아이디와 이름이 각각 몇 글자인지 확인 합니다.
select id, length(id), name, length(name) from employees;

-- 사원의 아이디에 'o'가 들어 있는지 확인 합니다.
select id, name, instr(id, 'o') from employees;

-- 사원의 아이디에 'o'가 들어 있는 모든 사원들을 조회 합니다.
select * from employees where instr(id, 'o') > 0;

-- 정렬 후 공백에 특수문자 채우기 (패딩 함수)
select id, lpad(id, 10, '*') from employees;
select id, rpad(id, 10, '*') from employees;

-- 사원의 아이디에 'o'를 'x로' 변경 합니다. (치환 함수)
select id, replace(id, 'o', 'x') from employees;

-- 좌측, 우측 공백 및 특정 문자 제거 (트림 함수)
select trim('   abc   123  ') from dual;
select rtrim('xxxabc123xxx', 'x') from dual;
select ltrim('xxxabc123xxx', 'x') from dual;

-- 사원의 아이디와 뒤집어진 id를 조회 합니다.
select id, reverse(id) from employees;

-- [숫자 함수]
-- 다음과 같이 데이터를 변경하고, 진행 합니다.
update employees set salary = 1.1 * salary;
update employees set salary = -123.4567 where id in ('queen', 'nongae');
commit;

-- abs 함수는 절대 값을 구합니다.
select id, name, salary, abs(salary) from employees;

-- ceil() 함수는 올림, floor() 함수는 버림 기능 입니다.
select id, name, salary, ceil(salary), floor(salary) from employees;

-- round() 함수는 반올림, trunc() 함수는 절삭 기능 입니다.
select id, name, salary, round(salary), trunc(salary) from employees;

-- round() 함수의 다양한 기법
-- 양수 또는 0인 경우 소수점 오른쪽 지정 자리수까지 반올림 합니다.
-- 음수인 경우 소수점 왼쪽의 지정 자리에서 반올림 합니다.
select salary, round(salary), round(salary, 1), round(salary, -1) from employees;

-- trunc() 함수는 round() 함수와 동일한 방식으로 작용하되, 무조건 절삭 합니다.
select salary, trunc(salary), trunc(salary, 1), trunc(salary, -1) from employees;

-- sqrt() 함수는 root를 구해주는 함수 입니다.
select sqrt(5) from dual;
select round(sqrt(5), 3) from dual;

-- 모든 급여에 대하여 절대값으로 변경하고, 루트를 씌운 결과를 출력 합니다.
select name, round(sqrt(abs(salary)), 3) from employees;

-- mod(n, m) 함수는 n은 m으로 나눈 나머지를 구해 줍니다.
select mod(14, 5) from dual;
select mod(1700, 500) from dual;

-- 급여가 10의 배수인지 확인 합니다.
where mod(salary, 10) = 0; 

-- id 길이가 5의 배수인 사원들만 출력 합니다.
select * from employees where mod(length(id), 5) = 0;

-- power(a, b) 함수는 a의 b제곱을 수행 합니다.
select power(2, 3) from dual;

-- sign(n) 함수는 숫자 n의 부호를 출력 합니다.
select name, salary, sign(salary) from employees;


-- [날짜 함수]
alter session set nls_date_format = 'YYYY-MM-DD HH:MI:SS';
alter session set nls_date_format = 'YYYY/MM/DD HH';

select sysdate from dual;

-- 하루 뒤의 시각을 구합니다.
select sysdate + 1 from dual; 

-- 하루 전의 시각을 구합니다.
select sysdate - 1 from dual;

-- 현지 시각과 2시간 이후의 시간, 5초전의 시각을 구합니다.
select sysdate, sysdate + 2 / 24, sysdate - 5 / 24 / 60 / 60 from dual;

-- 사원들의 이름과 생일과 현재까지 살아온 일수를 조회 합니다.
select name, birth, round(sysdate - birth, 3) from employees;

-- 두달 사이의 월수를 반환 합니다.
select months_between(sysdate, '2020/01/01') from dual;

-- 모든 사원들의 이름과 생일과 몇개월 살아왔는지 조회 합니다.
select name, birth, round(months_between(sysdate, birth), 3) from employees;

-- 지금부터 3개월 뒤, 5개월 전의 시간을 구합니다.
select sysdate, add_months(sysdate, 3), add_months(sysdate, -5) from dual;

-- '김구'와 '김좌진'의 생일을  5개월 이전으로 변경 합니다.
update employees set birth = add_months(birth, -5) where id in ('kim9', 'general');

-- '황진이'와 '조마리아'의 생일을 74일 이전으로 변경 합니다.
update employees set birth = birth - 74 where id in ('hwang', 'maria');

commit;

-- 이번주 금요일은 몇 일인지 확인 합니다.
select next_day(sysdate, '금') from dual;

-- 이번주의 마지막 날짜는 몇 일인지 확인 합니다.
select last_day(sysdate) from dual;

-- 월 및 연도 반올림 및 절삭 하기
select round(sysdate, 'month') from dual;
select round(sysdate, 'year') from dual;

select trunc(sysdate, 'month') from dual;
select trunc(sysdate, 'year') from dual;


-- [변환 함수]

select sysdate, to_char(sysdate, 'yyyy-mm-dd') from dual;

-- 사원들의 이름과 생일을 출력 합니다. (생일은 '월/일' 형식)
select name, to_char(birth, 'mm/dd') from employees;

-- 사원들의 이름과 생일을 출력 합니다. (생일은 yyyy年mm月dd日 형식)
-- 형식 요소에 존재하지 않는 항목은 반드시 쌍따옴표로 둘러 써야 합니다.
select name, to_char(birth, 'yyyy"年" mm"月" dd"日"') as "생일 정보" from employees;

-- 암시적 형변환
select 'abc' || 123 from dual;
select 100 + '100' from dual;

-- 명시적 형변환
select 'abc' || to_char(123) from dual;
select 100 + to_number('100') from dual;

-- 형식 요소로 포맷팅
select 
to_char(12345, '$999,999.00') as salary01,
to_char(12345, '$000,000.00') as salary02,
to_char(12345, 'L999,999.00') as salary03,
to_char(12345, '000,000.00') as salary04
from dual;


-- [일반 함수]
-- 일반 함수 실습을 위한 사전 준비
update employees set salary = 200.0 where id = 'nongae';
update employees set salary = 300.0 where id = 'queen';
commit;

select nvl('가나다', '하하') from dual;
select nvl(null, '하하') from dual;

-- 모든 사원들의 이름과 급여를 조회 합니다. 
-- (단, 급여가 존재하지 않는 사원은 기본 값으로 100이라고 가정)
select name, nvl(salary, 100) as newsalary from employees;

-- 모든 사원들의 이름과 관리자 아이디를 조회 합니다. 
-- (단, 관리자인 사원들은 기본 값으로 '관리자'으로 출력 합니다.)
select name, nvl(manager, '관리자') as newmanager from employees;

-- 모든 사원들의 이름과 급여와 연봉을 조회 합니다. 
-- (단, 급여가 존재하지 않는 사원들은 기본 값으로 100이라고 가정)
select name, nvl(salary, 100) as newsalary, 12 * nvl(salary, 100) as annsal from employees;

-- 모든 사원들의 이름과 급여를 조회 합니다. 
-- 그리고, 급여의 존재 여부에 대하여 코멘트를 작성 합니다.
select name, nvl2(salary, '급여 존재', '급여가 null') from employees;

-- 모든 사원들의 이름과 결혼 여부와 상태를 조회 합니다. 
-- 단, 상태는 결혼 여부가 '미혼'인 사원들은 null 값으로 처리 합니다.
select name, marriage, nullif(marriage, '미혼') as result from employees;

-- COALESCE (다중 if)
select name, coalesce(manager, to_char(salary), '모두 null') as result from employees;



-- [Case 구문]
-- manager 컬럼을 이용하여 관리자 정보를 출력 합니다.

select id, name, manager,
case manager
when 'yusin' then '김유신'
when 'soon' then '유관순'
when 'kim9' then '김구'
else '관리자' end as result
from employees;

-- 사원들의 이름과 급여와 파생 결과를 출력 합니다.
-- 파생 결과는 관리자가 'yusin'이면 급여의 10% 인상액
-- 'soon'이면 급여의 20%의 인상액, 'kim9'이면 급여의 30% 인상액, 나머지는 급여를 출력 합니다.
-- 단, 급여가 null이면 기본 값으로 100을 출력 합니다.

select name, salary, manager,
case manager
when 'yusin' then 1.1 * nvl(salary, 100)
when 'soon' then 1.2 * nvl(salary, 100)
when 'kim9' then 1.3 * nvl(salary, 100)
else nvl(salary, 100) end as newsalary
from employees;

-- 사원들의 이름과 급여와 파생 결과를 출력 합니다.
-- 급여가 200 미만이면 'low', 240 미만이면 'middle', 240 이상이면 'high'를 출력 합니다.

select name, salary,
case
when nvl(salary, 100) < 200 then 'low'
when nvl(salary, 100) < 240 then 'middle'
else 'high' end as result
from employees;

-- 사원들의 이름과 생일과 분기를 출력 합니다.
-- 단, 다음 문장을 참조 하도록 하고 case 구문을 사용 합니다.
select to_char(sysdate, 'Q') from dual;

select name, to_char(nvl(birth, sysdate), 'yyyy/mm/dd') as birth,
case to_number(to_char(birth, 'Q'))
when 1 then '1사분기'
when 2 then '2사분기'
when 3 then '3사분기'
else '4사분기' end as quarter
from employees;

