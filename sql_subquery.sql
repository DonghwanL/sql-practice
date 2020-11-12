-- �ּ� �޿� ���ϱ�
select min(salary) from employees;

-- �ּ� �޿��� �޴� ����� �̸��� �޿��� �ּҸ� ���
select name, salary, address from employees where salary = 100;

-- ���� ����
select name, salary, address
from employees 
where salary = (select min(salary) from employees);

-- [������ ���� ����]
-- ��պ��� ���� �޿��� �޴� ������� �̸��� �޿��� ���
select name, salary
from employees
where salary >= (select avg(salary) from employees);

-- �������� �̸��� '�豸'�� ������� ���̵�, �̸�, ������ ���̵� ���
select id, name, manager
from employees
where manager = (select id from employees where name = '�豸');

-- �������� �̸��� '�豸'�� ������� ���̵�, �̸�, ������ ���̵� ���
-- ��, '�豸'�� ���� ��� (�߰� ������ and�� or �����ڸ� ����Ͽ� ó��)
select id, name, manager
from employees
where manager = (select id from employees where name = '�豸')
or name = '�豸';

-- '��������'�� �޿����� ���� �޿��� �޴� ������� �̸��� �޿��� ��ȸ
select name, salary
from employees
where salary < (select salary from employees where name = '��������');

-- �����ڰ� '�豸'�̸鼭 ��� �޿����� ���� �޿��� �޴� ����� ���̵�, �̸�, �޿��� ��ȸ
select id, name, salary
from employees
where manager = (select id from employees where name = '�豸')
and salary < (select avg(salary) from employees);

-- [������ ���� ����]
-- �������� �̸��� '�豸'�̰ų� '������'�� ������� ���̵�� �̸��� ������ ���̵� ��ȸ
select id, name, manager
from employees
where manager in (select id from employees where name in('�豸', '������'));

-- �Խù��� ���� ������� �̸��� ���ϰ� ������ ��� 
select name, birth, gender
from employees
where id in (select distinct writer from boards where writer is not null);

-- ��ȥ ������ '��ȥ'�� �ƴ� ������� �̸��� ���ϰ� ������ ���
select name, birth, gender, marriage
from employees
where id not in (select id from employees where marriage in('��ȥ'));

-- �����ڰ� '������'�� ������� ��ȸ (�ִ� 900, �ִ� 1600)
select name, salary
from employees
where manager = 'soon';

-- �����ڰ� '������'�� ��� �߿��� �ּ� �޿��� ���� ���� �޴� ������� ��ȸ
select name, salary from employees
where salary > any (select salary from employees where manager = 'soon');

-- �����ڰ� '������'�� ��� �߿��� �ִ� �޿��� ���� ���� �޴� ������� ��ȸ
select name, salary from employees
where salary < any (select salary from employees where manager = 'soon');

-- �����ڰ� '������'�� ��� �߿��� �ִ� �޿��� ���� ���� �޴� ������� ��ȸ
select name, salary from employees
where salary > all (select salary from employees where manager = 'soon');

-- �����ڰ� '������'�� ��� �߿��� �ּ� �޿��� ���� ���� �޴� ������� ��ȸ
select name, salary from employees
where salary < all (select salary from employees where manager = 'soon');

-- ������ ���� �޿����� �̸��� �޿��� ������ ��ȸ
select gender, min(salary) from employees group by gender;

select name, salary, gender from employees
where (gender, salary) in (select gender, min(salary) from employees group by gender);

-- ��ȥ ������ ���� �޿����� �̸��� �޿��� ��ȥ ���� �÷��� ��ȸ
select name, salary, marriage from employees
where (marriage, salary) in (select marriage, min(salary) from employees group by marriage);

-- ������ �����ڷ� ������ ������� �� �Ұ� (����)
select min(salary) from employees group by gender;

select name, salary 
from employees
where salary = (select min(salary) from employees group by gender);

-- �������� �ʴ� ��� '������'�� ��ȸ�ϸ� ���� ������ ����� = null
-- ����, ������ �߻����� �ʰ� ��ȸ�Ǵ� ����� ����
select name, salary from employees
where id = (select id from employees where name = '������');