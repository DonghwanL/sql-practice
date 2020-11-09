-- ���̺� ����
create table employees(
    id varchar2(20) primary key,
    name varchar2(20) not null,
    password varchar2(30) not null,
    gender varchar2(10),
    birth date default sysdate,
    marriage varchar2(30),
    salary number default 100,
    address varchar2(50),
    manager varchar2(50)
);

select * from tab;
desc employees;
select * from employees;

insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('yusin', '������', 'abc1234', '����', '1990/12/25', '��ȥ', 220, '���', null);

insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('choi', '�ֿ�', 'abc1234', '����', '1990/12/25', '��ȥ', 220, '���', 'yusin');

insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('kang', '������', 'abc1234', '����', '1990/12/25', '��ȥ', 220, '����', 'yusin');

commit;

create table emp01
as
select * from employees;

create table emp02
as
select id, name, marriage from employees;

create table emp03
as
select id, birth, salary, address from employees;

-- ���� ���� �ܼ� ������ �����ϱ�
create table emp04
as
select * from employees
where 1 = 2;

-- �޴��� �÷� �߰��ϱ�
alter table employees add (hphone varchar2(15));

-- ���� �÷� �߰��ϱ� (�⺻�� 0)
alter table employees add (age number default 0);
desc employees;

-- ��Ī �÷� �߰��ϱ�(�⺻�� 'ö��')
alter table employees add (nickname varchar2(30) default 'ö��');


-- �ſ� �� ���̵� �켱 �Է��� ���ϴ�. 
insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('yusinyusinyusinyusinyusin', '������', 'abc1234', '����', '1990/12/25', '��ȥ', 220, '���', null);

-- �÷� �����ϱ�
alter table employees modify (id varchar2(30));
commit;
select * from employees;

-- �����Ͱ� �� �ִ� ��� ������Ÿ�� ���� �Ұ�
alter table employees modify (hphone number);
alter table employees modify (nickname number); 

-- �÷��� �̸� ���� �� ����
alter table employees rename column hphone to handphone;
alter table employees rename column manager to mgr;

alter table employees drop column handphone;
alter table employees drop column nickname;

desc employees;

-- ���̺� �̸� ����
rename employees to emp;
select * from emp;
drop table emp;

-- ���̺� ����
create table employees(
    id varchar2(20) primary key,
    name varchar2(20) not null,
    password varchar2(30) not null,
    gender varchar2(10),
    birth date default sysdate,
    marriage varchar2(30),
    salary number default 100,
    address varchar2(50),
    manager varchar2(50)
);

-- �߰� ��� 01 
-- �÷� �̸� ������� �ʰ� �߰��ϴ� ��쿡��
-- ���̺� ������ ����� �÷� ������� ��� �Է��ؾ� �մϴ�.
insert into employees
values('yusin', '������', 'abc1234', '����', '1990/12/25', '��ȥ', 220, '���' ,null);
insert into employees
values('lee', '�̼���', 'abc1234', '����', '1990/12/25', '��ȥ', 220, '����', 'yusin');
insert into employees
values('choi', '�ֿ�', 'abc1234', '����', '1990/12/25', '��ȥ', 155, '����', 'yusin');
insert into employees
values('kang', '������', 'abc1234', '����', '1990/12/25', '��ȥ', null, '���빮', 'yusin');

commit;
select * from employees;

-- �߰� ��� 02 (��õ)
-- �÷� �̸� ����ϴ� ��� ������ Ÿ���� �ݵ�� ���߾�� �մϴ�.

insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('yoon', '������', 'abc1234', '����', '1990/12/25', '��ȥ', 230, '���', 'yusin');
insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('kim9', '�豸', 'abc1234', '����', '1990/12/25', '��ȥ', 280, '����', null);
insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('general', '������', 'abc1234', '����', '1990/12/25', '��ȥ', 385, '���빮', 'kim9');
insert into employees(id, name, password, gender, birth, marriage, salary, address, manager)
values('an', '���߱�', 'abc1234', '����', '1990/12/25', '��ȥ', 360, '���빮', 'kim9');

commit;

-- �߰� ��� 03
-- �ʿ� ���� �÷��� ������� �ʴ� ��쿣 �÷� �̸��� ���� ���� �ʽ��ϴ�.
-- �޿��� å������ �ʴ� ������ (�޿��� �⺻ ���� 100���� �����Ǿ� ����_ ���� ������Ʈ�� ����)

insert into employees(id, name, password, gender, birth, marriage, address, manager)
values('nongae', '��', 'abc1234', '����', '1990/12/25', '��ȥ', '����', 'soon');
insert into employees(id, name, password, gender, birth, marriage, address, manager)
values('queen', '��������', 'abc1234', '����', '1990/12/25', '��ȥ', '���', 'soon');

-- �Ŵ����� �������� �ʴ� ���
insert into employees(id, name, password, gender, birth, marriage, salary, address)
values('soon', '������', 'abc1234', '����', '1990/12/25', '��ȥ', 240, '����');

select * from employees;
commit;

-- �߰� ��� 04
-- �÷� �̸��� ���Ƿ� ����ϴ� ���
insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('shin', 215, 'kim9', '���빮', '�Ż��Ӵ�', 'abc1234', '����', '1990/12/25', '��ȥ');
insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('hwang', 155, 'kim9', '���', 'Ȳ����', 'abc1234', '����', '1990/12/25', '��ȥ');
insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('myoung', 340, 'soon', '����', '��Ȳ��', 'abc1234', '����', '1990/12/25', '��ȥ');
insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('maria', 390, 'soon', '���빮', '��������', 'abc1234', '����', '1990/12/25', '��ȥ');
insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('princess', 185, 'soon', '����', '��������', 'abc1234', '����', '1990/12/25', '��ȥ');

select * from employees;
commit;

-- �÷� 1�� ����
-- ��� ������� �޿��� 100���� �����մϴ�.
update employees set salary = 100;

-- ��� ������� ��й�ȣ�� 'qwert'�� �����մϴ�.
update employees set password = 'qwert';

-- ��� ������� ������ ���� ��¥�� �����ϼ���.
update employees set birth = sysdate;


-- �÷� ���� �� ����
-- ��� ������� �޿��� 500����, ��й�ȣ�� 'acb1234'�� �����մϴ�.
update employees set salary = 500, password = 'abc1234';

-- where�� ���
-- '���߱�'�� �޿��� 400���� �����մϴ�.
update employees set salary = 400 where id = 'an';

-- '������'�� ��ȥ���θ� '��ȥ'���� �����մϴ�.
update employees set marriage = '��ȥ' where id = 'yoon';

-- �������� �޿��� 10% �λ��մϴ�. (��, null�� ������ �ص� ����� null)
update employees set salary = 1.1 * salary; 

-- '������'�� �޿��� 100 �����մϴ�.
update employees set salary = salary - 100 where id = 'general';

-- Ȳ����'�� �޿��� 50 ���ϰ�, �ּҸ� '����'�� �����մϴ�.
update employees set salary = salary + 50, address = '����' where id = 'hwang';

-- '�ֿ�'�� '�ֺν�'���� ������ �߰�, '���빮'���� �̻� �߽��ϴ�.
update employees set name = '�ֺν�', address = '���빮' where id = 'choi';

-- �����ڰ� '�豸'�� ������� �޿��� 600���� �����մϴ�.
update employees set salary = 600 where manager = 'kim9';

-- �޿��� 200������ ������� �޿��� 300���� �����մϴ�.
update employees set salary = 300 where salary <= 200;

-- �����ڰ� '������'�̰� �޿��� 250�̻��� ����鿡 ���Ͽ� �޿��� 700������ �����մϴ�.
update employees set salary = 700 where manager = 'yusin' and salary >= 250;

-- '�豸'�̰ų� 'Ȳ����'�̸� �޿��� 450���� �����մϴ�.
update employees set salary = 450 where id = 'kim9' or id = 'hwang';

-- '�豸'�̰ų� 'Ȳ����'�̸� �޿��� 1000���� �����ϵ�, in Ű���带 ����մϴ�.
update employees set salary = 1000 where id in ('kim9', 'hwang');

-- �����ڰ� '������'�̰ų�, '������'�� ������� �޿��� 555�� �����մϴ�. (in Ű���� ���)
update employees set salary = 555 where manager in ('yusin', 'soon');

-- ��ȥ ���ΰ� '��ȥ'�Ǵ� '��ȥ'�� �ƴ� ������� �޿��� 777�� �����մϴ�. (in Ű���� ���)
update employees set salary = 777 where marriage not in ('��ȥ', '��ȥ');

select * from employees;

-- �۾��� ������� �ѹ� �մϴ�.
rollback;

-- �����ϱ�
-- ��� ����� �����մϴ�.
delete from employees;

-- ��� '���߱�'�� �����մϴ�.
delete from employees where id = 'an';

-- �����ڰ� '������'�� ����� �����մϴ�.
delete from employees where manager = 'yusin';

-- �����ڰ� '������'�̰ų� '������'�� ����� �����մϴ�.
delete from employees where manager in ('yusin', 'soon');

-- �����ڰ� '������'�� ��� �߿��� �޿��� 220 �̻��� ����� �����մϴ�.
delete from employees where manager = 'yusin' and salary >= 220;

-- �޿��� 200�̸��̰ų� 300�̻��� ����� �����մϴ�.
delete from employees where salary < 200 or salary >= 300;

-- �ּҰ� '����'�̰ų� '���'�� ����� �����մϴ�.
delete from employees where address in ('����', '���');

-- �ּҰ� '���빮'�� '����'�� ������ �ٸ� ������ �����ϴ� ����� �����մϴ�.
delete from employees where address not in ('���빮', '����');

select * from employees;

update employees set address = '����' where id = 'general';

-- �۾��� ������� �ѹ� �մϴ�.
rollback;

-- ���ÿ� ���̺� ����
create table emp05
as
select id, name, salary, gender from employees where 1 = 2;

select * from emp05;

-- insert ... select �������� '����'�� emp05 ���̺� �Է��մϴ�.
insert into emp05(id, name, salary, gender)
select id, name, salary, gender from employees where gender = '����';

-- ������ '����'�� ������� �̸�/�޿�/�ּҸ� �ű����̺� emp06�� �߰��մϴ�. (insert ... select ���� ���)

create table emp06
as
select name, salary, address from employees where 1 = 2;
select * from emp06;

insert into emp06(name, salary, address)
select name, salary, address from employees where gender = '����';

commit;

-- ��� ����� ��ȸ �մϴ�.
-- *�� all columns�� �ǹ� �մϴ�.

select * from employees;

-- ��� ������� ���̵�, �̸�, �޿��� ��ȸ �մϴ�.
-- �������� �÷����� �޸��� ����ϸ� �˴ϴ�.
select id, name, salary from employees;

-- ��� ������� �̸�, �޿�, ���̵� ������� ��ȸ �մϴ�.
select name, salary, id from employees;

-- ��� ������� �̸�, �޿�, 100�߰��� �޿��� ��ȸ �մϴ�.
select name, salary, 100 + salary from employees;

-- ��� ������� �̸�, �޿�, ������ ��ȸ �մϴ�.
-- ��, ������ �޿��� 12���� �����մϴ�.
select name, salary, 12 * salary from employees;

-- ��� ������� �̸���, �޿��� 10% �λ�� �ݾװ� ������ ��� �մϴ�.
select name, salary, 1.1 * salary, 12 * salary from employees;
select name, salary, 1.1 * salary as newsalary, 12 * salary "ann sal" from employees;

-- distinct Ű����� �ߺ��� �����Ϳ� ���ؼ� �ϳ��� ����
select gender from employees;
select distinct gender from employees;

-- ȫ�浿�� �޿��� 100�� �Դϴ�.
select name || '�� �޿��� ' || salary || '���Դϴ�.' from employees;

-- �̸� : ȫ�浿, ���� : ����, �޿� : 100
select '�̸� : ' || name || ', ���� : ' || gender || ', �޿� : ' || salary from employees;

-- �޿� å���� �� �� ����� ��� �մϴ�.
select * from employees where salary is null;

-- ������ ����� ��� �մϴ�. (manager �÷��� null)
select * from employees where manager is null;

-- null �������� ���� ��� Ȯ��
-- ��� ������� �̸��� �޿� �� ������ ��ȸ �մϴ�.
select name, salary, 12 * salary from employees;

-- id�� 'an'�� ����� ��ȸ �մϴ�.
select * from employees where id = 'an';

-- �޿��� 230 �̻��� ����� ��ȸ �մϴ�.
select * from employees where salary >= 230;

-- ���ڵ鸸 ��ȸ �մϴ�.
select * from employees where gender = '����';

-- �޿��� 220 �̻��̰�, 400 ������ ����� ��ȸ �մϴ�.
select * from employees where salary >= 220 and salary <= 400;

select * from employees
where salary between 220 and 400;

select * from employees
where name between '��' and '��';

-- �޿��� 350 �̻��̰ų�, 210 ������ ����� ��ȸ �մϴ�.
select * from employees where salary >= 350 or salary <= 210;

-- id�� 'an' �Ǵ� 'soon'�� ����� �̸��� �޿��� ��ȸ �մϴ�.
select name, salary from employees 
where id in ('an', 'soon');

-- �޿��� 215�̰ų� 230�� ������� ��ȸ �մϴ�.
select * from employees
where salary in (215, 230);

-- '��'���� ��ȸ �մϴ�.
select * from employees 
where name like '��%';

-- '��'�̶�� �ܾ ���Ե� ����� ��ȸ �մϴ�.
select * from employees 
where name like '%��%';

-- �̸��� 2��° ���ڰ� '��'�� ����ִ� ����� ��ȸ �մϴ�.
select * from employees 
where name like '_��%';

-- �̸��� ���� '��'�� ��� �ִ� ����� ��ȸ �մϴ�.
select * from employees 
where name like '%��';

-- ���� �ǽ��� ���Ͽ� ������ ���� �����͸� ���� �մϴ�.
update employees set birth = sysdate where id in ('an', 'soon');
update employees set birth = null where id in ('queen', 'yusin');
update employees set birth = '1988/10/10' where id in ('kang', 'lee');
commit;

-- �޿��� ���� �������� ��� �մϴ�.
select * from employees order by salary;

-- �̸��� '������' ������ ��� �մϴ�.
select * from employees order by name asc;

-- �̸��� '������' �������� ��� �մϴ�.
select * from employees order by name desc;

-- ���̰� ���� �������� ������ ����, �޿��� ���� ������ �����Ͽ� ��� �մϴ�.
select * from employees order by birth asc, salary asc;

-- '����' ���� ��µǵ��� �ϸ�, �޿��� ���� ������� ���� ��µǵ��� �մϴ�.
select * from employees order by gender desc, salary desc;

-- ������ ���Ͽ� ��������, ��ȥ ���ο� ���Ͽ� ������������ ���� �մϴ�.
select * from employees order by gender asc, marriage desc;

-- alias�� ����� ������ ����
-- �̸��� ������ ����ϵ�, ������ ���� ������ ���� �մϴ�.
select name, 12 * salary as annsal from employees order by annsal desc;

-- �÷� ��ȣ�� �̿��� ������ ����
select name, 12 * salary as annsal from employees order by 2 desc;

-- ������
-- '�豸'�� '������'�� ������ ��� ����� ��� �մϴ�.
select * from employees where id not in ('kim9', 'yusin');

-- '��ȥ'�� ����� ������ ��� ����� ��� �մϴ�.
select * from employees where marriage not in ('��ȥ');

-- �޿��� 200�� 230���̿� ���Ե��� �ʴ� ����� ��� �մϴ�.
-- (���ǻ���) null�� ���꿡 �ݿ��� �ȵ˴ϴ�.
select * from employees where salary not between 220 and 230;

-- ������ '��'���� �ƴ� ��� ������� ��� �մϴ�.
select * from employees where name not like '��%';

-- ���� ������ �Ϸ�� ������� ��� �մϴ�.
select * from employees where salary is not null;

-- �����ڰ� �ƴ� �Ϲ� ��� ����� ��� �մϴ�.
select * from employees where manager is not null;

-- ���� ����
-- '����'�̸鼭, �޿��� 230�̸��� ������� ��� �մϴ�.
select * from employees
where gender = '����' and salary < 230;

-- ��ȥ�� �߿���, '���빮'�� �����ϴ� ������� ��� �մϴ�.
select * from employees 
where marriage = '��ȥ' and address = '���빮';

-- ��ȥ�� �̰ų�, '���' �Ǵ� '����'�� �����ϴ� ������� ��� �ϵ�, �޿� ������ �������� ���� �մϴ�.
select * from employees 
where marriage = '��ȥ' or address in ('���', '����')
order by salary asc;

-- ������ '��'�� �̰ų�, '����'�� ������� ��� �ϵ�, �̸��� ���Ͽ� ������������ ���� �մϴ�.
select * from employees 
where name like '��%' or gender in ('����')
order by name desc;

-- �����ڰ� '�豸'�̸鼭, '���빮'�� �����ϴ� ������� ��� �մϴ�.
select * from employees 
where manager = 'kim9' and address = '���빮';