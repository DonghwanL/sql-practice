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
select power(2, 3) from dual;

-- sign(n) �Լ��� ���� n�� ��ȣ�� ��� �մϴ�.
select name, salary, sign(salary) from employees;


-- [��¥ �Լ�]
alter session set nls_date_format = 'YYYY-MM-DD HH:MI:SS';
alter session set nls_date_format = 'YYYY/MM/DD HH';

select sysdate from dual;

-- �Ϸ� ���� �ð��� ���մϴ�.
select sysdate + 1 from dual; 

-- �Ϸ� ���� �ð��� ���մϴ�.
select sysdate - 1 from dual;

-- ���� �ð��� 2�ð� ������ �ð�, 5������ �ð��� ���մϴ�.
select sysdate, sysdate + 2 / 24, sysdate - 5 / 24 / 60 / 60 from dual;

-- ������� �̸��� ���ϰ� ������� ��ƿ� �ϼ��� ��ȸ �մϴ�.
select name, birth, round(sysdate - birth, 3) from employees;

-- �δ� ������ ������ ��ȯ �մϴ�.
select months_between(sysdate, '2020/01/01') from dual;

-- ��� ������� �̸��� ���ϰ� ��� ��ƿԴ��� ��ȸ �մϴ�.
select name, birth, round(months_between(sysdate, birth), 3) from employees;

-- ���ݺ��� 3���� ��, 5���� ���� �ð��� ���մϴ�.
select sysdate, add_months(sysdate, 3), add_months(sysdate, -5) from dual;

-- '�豸'�� '������'�� ������  5���� �������� ���� �մϴ�.
update employees set birth = add_months(birth, -5) where id in ('kim9', 'general');

-- 'Ȳ����'�� '��������'�� ������ 74�� �������� ���� �մϴ�.
update employees set birth = birth - 74 where id in ('hwang', 'maria');

commit;

-- �̹��� �ݿ����� �� ������ Ȯ�� �մϴ�.
select next_day(sysdate, '��') from dual;

-- �̹����� ������ ��¥�� �� ������ Ȯ�� �մϴ�.
select last_day(sysdate) from dual;

-- �� �� ���� �ݿø� �� ���� �ϱ�
select round(sysdate, 'month') from dual;
select round(sysdate, 'year') from dual;

select trunc(sysdate, 'month') from dual;
select trunc(sysdate, 'year') from dual;


-- [��ȯ �Լ�]

select sysdate, to_char(sysdate, 'yyyy-mm-dd') from dual;

-- ������� �̸��� ������ ��� �մϴ�. (������ '��/��' ����)
select name, to_char(birth, 'mm/dd') from employees;

-- ������� �̸��� ������ ��� �մϴ�. (������ yyyyҴmm��dd�� ����)
-- ���� ��ҿ� �������� �ʴ� �׸��� �ݵ�� �ֵ���ǥ�� �ѷ� ��� �մϴ�.
select name, to_char(birth, 'yyyy"Ҵ" mm"��" dd"��"') as "���� ����" from employees;

-- �Ͻ��� ����ȯ
select 'abc' || 123 from dual;
select 100 + '100' from dual;

-- ����� ����ȯ
select 'abc' || to_char(123) from dual;
select 100 + to_number('100') from dual;

-- ���� ��ҷ� ������
select 
to_char(12345, '$999,999.00') as salary01,
to_char(12345, '$000,000.00') as salary02,
to_char(12345, 'L999,999.00') as salary03,
to_char(12345, '000,000.00') as salary04
from dual;


-- [�Ϲ� �Լ�]
-- �Ϲ� �Լ� �ǽ��� ���� ���� �غ�
update employees set salary = 200.0 where id = 'nongae';
update employees set salary = 300.0 where id = 'queen';
commit;

select nvl('������', '����') from dual;
select nvl(null, '����') from dual;

-- ��� ������� �̸��� �޿��� ��ȸ �մϴ�. 
-- (��, �޿��� �������� �ʴ� ����� �⺻ ������ 100�̶�� ����)
select name, nvl(salary, 100) as newsalary from employees;

-- ��� ������� �̸��� ������ ���̵� ��ȸ �մϴ�. 
-- (��, �������� ������� �⺻ ������ '������'���� ��� �մϴ�.)
select name, nvl(manager, '������') as newmanager from employees;

-- ��� ������� �̸��� �޿��� ������ ��ȸ �մϴ�. 
-- (��, �޿��� �������� �ʴ� ������� �⺻ ������ 100�̶�� ����)
select name, nvl(salary, 100) as newsalary, 12 * nvl(salary, 100) as annsal from employees;

-- ��� ������� �̸��� �޿��� ��ȸ �մϴ�. 
-- �׸���, �޿��� ���� ���ο� ���Ͽ� �ڸ�Ʈ�� �ۼ� �մϴ�.
select name, nvl2(salary, '�޿� ����', '�޿��� null') from employees;

-- ��� ������� �̸��� ��ȥ ���ο� ���¸� ��ȸ �մϴ�. 
-- ��, ���´� ��ȥ ���ΰ� '��ȥ'�� ������� null ������ ó�� �մϴ�.
select name, marriage, nullif(marriage, '��ȥ') as result from employees;

-- COALESCE (���� if)
select name, coalesce(manager, to_char(salary), '��� null') as result from employees;



-- [Case ����]
-- manager �÷��� �̿��Ͽ� ������ ������ ��� �մϴ�.

select id, name, manager,
case manager
when 'yusin' then '������'
when 'soon' then '������'
when 'kim9' then '�豸'
else '������' end as result
from employees;

-- ������� �̸��� �޿��� �Ļ� ����� ��� �մϴ�.
-- �Ļ� ����� �����ڰ� 'yusin'�̸� �޿��� 10% �λ��
-- 'soon'�̸� �޿��� 20%�� �λ��, 'kim9'�̸� �޿��� 30% �λ��, �������� �޿��� ��� �մϴ�.
-- ��, �޿��� null�̸� �⺻ ������ 100�� ��� �մϴ�.

select name, salary, manager,
case manager
when 'yusin' then 1.1 * nvl(salary, 100)
when 'soon' then 1.2 * nvl(salary, 100)
when 'kim9' then 1.3 * nvl(salary, 100)
else nvl(salary, 100) end as newsalary
from employees;

-- ������� �̸��� �޿��� �Ļ� ����� ��� �մϴ�.
-- �޿��� 200 �̸��̸� 'low', 240 �̸��̸� 'middle', 240 �̻��̸� 'high'�� ��� �մϴ�.

select name, salary,
case
when nvl(salary, 100) < 200 then 'low'
when nvl(salary, 100) < 240 then 'middle'
else 'high' end as result
from employees;

-- ������� �̸��� ���ϰ� �б⸦ ��� �մϴ�.
-- ��, ���� ������ ���� �ϵ��� �ϰ� case ������ ��� �մϴ�.
select to_char(sysdate, 'Q') from dual;

select name, to_char(nvl(birth, sysdate), 'yyyy/mm/dd') as birth,
case to_number(to_char(birth, 'Q'))
when 1 then '1��б�'
when 2 then '2��б�'
when 3 then '3��б�'
else '4��б�' end as quarter
from employees;

