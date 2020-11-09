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
