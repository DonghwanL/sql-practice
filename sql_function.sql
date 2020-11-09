-- [DUAL TABLE] 
select * from dual;

select 4 * 3 + 2 from dual;
select 4 * (3 + 2) from dual;
select 4 * 4 * 4 from dual;

select power(2, 10) from dual;

select upper('abc123') from dual;

-- [���� �Լ�]
-- ���̵�� �̸��� ��� �մϴ�.
select id, upper(id), lower(id), initcap(id), name from employees;

-- concat �Լ� ��� (���ڿ� ���� = concatenation)
select concat('���̵� : ', name) as result from employees;

-- �̸��� ȫ�浿�̰�, �޿��� 100 �Դϴ�.
select concat(concat(concat('�̸��� ', name), concat('�̰�, �޿��� ', salary)), '�� �Դϴ�.') 
as result from employees;

-- substr() - 1 Base : ���ڿ��� �κ� ���� �մϴ�.
-- 4��°���� ������ ����
select substr(password, 3) from employees;

-- 1��°���� 3��°���� ���� 
select substr(password, 1, 3) from employees;

-- �ڿ��� 5��°���� 2���� ����
select substr(password, -5, 2) from employees;

update employees set password = 'abc1234' where id = 'yusin';
commit;

-- ����� ���̵�� �̸��� ���� �� �������� Ȯ�� �մϴ�.
select id, length(id), name, length(name) from employees;

-- ����� ���̵� 'o'�� ��� �ִ��� Ȯ�� �մϴ�.
select id, name, instr(id, 'o') from employees;

-- ����� ���̵� 'o'�� ��� �ִ� ��� ������� ��ȸ �մϴ�.
select * from employees where instr(id, 'o') > 0;

-- ���� �� ���鿡 Ư������ ä��� (�е� �Լ�)
select id, lpad(id, 10, '*') from employees;
select id, rpad(id, 10, '*') from employees;

-- ����� ���̵� 'o'�� 'x��' ���� �մϴ�. (ġȯ �Լ�)
select id, replace(id, 'o', 'x') from employees;

-- ����, ���� ���� �� Ư�� ���� ���� (Ʈ�� �Լ�)
select trim('   abc   123  ') from dual;
select rtrim('xxxabc123xxx', 'x') from dual;
select ltrim('xxxabc123xxx', 'x') from dual;

-- ����� ���̵�� �������� id�� ��ȸ �մϴ�.
select id, reverse(id) from employees;

-- [���� �Լ�]
-- ������ ���� �����͸� �����ϰ�, ���� �մϴ�.
update employees set salary = 1.1 * salary;
update employees set salary = -123.4567 where id in ('queen', 'nongae');
commit;

-- abs �Լ��� ���� ���� ���մϴ�.
select id, name, salary, abs(salary) from employees;

-- ceil() �Լ��� �ø�, floor() �Լ��� ���� ��� �Դϴ�.
select id, name, salary, ceil(salary), floor(salary) from employees;

-- round() �Լ��� �ݿø�, trunc() �Լ��� ���� ��� �Դϴ�.
select id, name, salary, round(salary), trunc(salary) from employees;

-- round() �Լ��� �پ��� ���
-- ��� �Ǵ� 0�� ��� �Ҽ��� ������ ���� �ڸ������� �ݿø� �մϴ�.
-- ������ ��� �Ҽ��� ������ ���� �ڸ����� �ݿø� �մϴ�.
select salary, round(salary), round(salary, 1), round(salary, -1) from employees;

-- trunc() �Լ��� round() �Լ��� ������ ������� �ۿ��ϵ�, ������ ���� �մϴ�.
select salary, trunc(salary), trunc(salary, 1), trunc(salary, -1) from employees;

-- sqrt() �Լ��� root�� �����ִ� �Լ� �Դϴ�.
select sqrt(5) from dual;
select round(sqrt(5), 3) from dual;

-- ��� �޿��� ���Ͽ� ���밪���� �����ϰ�, ��Ʈ�� ���� ����� ��� �մϴ�.
select name, round(sqrt(abs(salary)), 3) from employees;

-- mod(n, m) �Լ��� n�� m���� ���� �������� ���� �ݴϴ�.
select mod(14, 5) from dual;
select mod(1700, 500) from dual;

-- �޿��� 10�� ������� Ȯ�� �մϴ�.
where mod(salary, 10) = 0; 

-- id ���̰� 5�� ����� ����鸸 ��� �մϴ�.
select * from employees where mod(length(id), 5) = 0;

-- power(a, b) �Լ��� a�� b������ ���� �մϴ�.
