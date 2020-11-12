-- 최소 급여 구하기
select min(salary) from employees;

-- 최소 급여를 받는 사원의 이름과 급여와 주소를 출력
select name, salary, address from employees where salary = 100;

-- 서브 쿼리
select name, salary, address
from employees 
where salary = (select min(salary) from employees);

-- [단일행 서브 쿼리]
-- 평균보다 많은 급여를 받는 사원들의 이름과 급여를 출력
select name, salary
from employees
where salary >= (select avg(salary) from employees);

-- 관리자의 이름이 '김구'인 사원들의 아이디, 이름, 관리자 아이디를 출력
select id, name, manager
from employees
where manager = (select id from employees where name = '김구');

-- 관리자의 이름이 '김구'인 사원들의 아이디, 이름, 관리자 아이디를 출력
-- 단, '김구'도 같이 출력 (추가 조건은 and나 or 연산자를 사용하여 처리)
select id, name, manager
from employees
where manager = (select id from employees where name = '김구')
or name = '김구';

-- '선덕여왕'의 급여보다 적은 급여를 받는 사원들의 이름과 급여를 조회
select name, salary
from employees
where salary < (select salary from employees where name = '선덕여왕');

-- 관리자가 '김구'이면서 평균 급여보다 적은 급여를 받는 사원의 아이디, 이름, 급여를 조회
select id, name, salary
from employees
where manager = (select id from employees where name = '김구')
and salary < (select avg(salary) from employees);

-- [다중행 서브 쿼리]
-- 관리자의 이름이 '김구'이거나 '유관순'인 사원들의 아이디와 이름과 관리자 아이디를 조회
select id, name, manager
from employees
where manager in (select id from employees where name in('김구', '유관순'));

-- 게시물을 남긴 사원들의 이름과 생일과 성별을 출력 
select name, birth, gender
from employees
where id in (select distinct writer from boards where writer is not null);

-- 결혼 유무가 '이혼'이 아닌 사원들의 이름과 생일과 성별을 출력
select name, birth, gender, marriage
from employees
where id not in (select id from employees where marriage in('이혼'));

-- 관리자가 '유관순'인 사원들을 조회 (최대 900, 최대 1600)
select name, salary
from employees
where manager = 'soon';

-- 관리자가 '유관순'인 사원 중에서 최소 급여자 보다 많이 받는 사원들을 조회
select name, salary from employees
where salary > any (select salary from employees where manager = 'soon');

-- 관리자가 '유관순'인 사원 중에서 최대 급여자 보다 적게 받는 사원들을 조회
select name, salary from employees
where salary < any (select salary from employees where manager = 'soon');

-- 관리자가 '유관순'인 사원 중에서 최대 급여자 보다 많이 받는 사원들을 조회
select name, salary from employees
where salary > all (select salary from employees where manager = 'soon');

-- 관리자가 '유관순'인 사원 중에서 최소 급여자 보다 적게 받는 사원들을 조회
select name, salary from employees
where salary < all (select salary from employees where manager = 'soon');

-- 성별로 최저 급여자의 이름과 급여와 성별을 조회
select gender, min(salary) from employees group by gender;

select name, salary, gender from employees
where (gender, salary) in (select gender, min(salary) from employees group by gender);

-- 결혼 유무별 최저 급여자의 이름과 급여와 결혼 유무 컬럼을 조회
select name, salary, marriage from employees
where (marriage, salary) in (select marriage, min(salary) from employees group by marriage);

-- 단일행 연산자로 다중행 결과물은 비교 불가 (오류)
select min(salary) from employees group by gender;

select name, salary 
from employees
where salary = (select min(salary) from employees group by gender);

-- 존재하지 않는 사원 '심형래'를 조회하면 서브 쿼리의 결과물 = null
-- 따라서, 오류는 발생하지 않고 조회되는 결과는 없음
select name, salary from employees
where id = (select id from employees where name = '심형래');