-- ���̺� ����
-- primary key �Ǵ� unique ���� ������ �����, �ڵ����� �ε����� ���� ������ ����
create table dept(
    deptno number primary key,
    dname varchar2(30),
    sales number
);

insert into dept values(10, '����', 1000);
insert into dept values(20, '�Ǹ�', 1000);
insert into dept values(30, '����', 1000);

commit;

create table employees01(
    sabun number,
    name varchar2(30),
    job varchar2(30),
    deptno number 
);

-- employees01 ���̺��� deptno �÷��� �Է� ������ ���� 10, 20, 30
alter table employees01
add constraint bbb
foreign key(deptno)
references dept(deptno);

-- ����� �̸� �÷��� ���� ������ �����Ƿ� insert ����
insert into employees01 values(null, null, '�ǻ�', 10);
insert into employees01 values(1, '������', '�ǻ�', 20);

-- parent key�� ���� ��� ���� �߻� (50�� �μ� ����)
insert into employees01 values(2, '�̼���', '�˻�', 50);

-- unique�� not null ���� ����
-- unique�� �����Ͱ� �Է� �Ǿ��� �� �ߺ� �Ұ� (null ����), not null�� �ʼ� ����
create table employees02(
    sabun number unique,
    name varchar2(30) not null,
    job varchar2(30),
    deptno number 
);

-- name �÷��� not null (���� �߻�)
insert into employees02 values(null, null, '�ǻ�', 10);

-- 4��° insert unique constraint violated (�ߺ�)
insert into employees02 values(null, '�Ż��Ӵ�', '�ǻ�', 10);
insert into employees02 values(null, '������', '�ǻ�', 10);
insert into employees02 values(1, '������', '�˻�', 10);
insert into employees02 values(1, '�̼���', '�˻�', 10);
insert into employees02 values(2, '��������', '�˻�', 10);

commit;

-- primary key (unique + not null)
create table employees03(
    sabun number primary key,
    name varchar2(30) not null,
    job varchar2(30),
    deptno number 
);

insert into employees03 values(null, '��������', '�˻�', 10);
insert into employees03 values(1, '��������', '�˻�', 10);
insert into employees03 values(1, '��������', '�˻�', 10);
insert into employees03 values(2, '��������', '�˻�', 10);

commit;

-- check ���� ����
create table employees04(
    sabun number primary key,
    name varchar2(30) not null,
    gender varchar2(1) check(gender in('m', 'f')),
    salary number check(salary >= 100)
);

insert into employees04 values(1, '������', 'm', 300);
insert into employees04 values(2, '������', 'm', 50);
insert into employees04 values(3, '������', 's', 300);
insert into employees04 values(4, '�Ż��Ӵ�', 'f', 300);

commit;

-- USER_CONSTRAINTS (&�� ġȯ ����)
select t.table_name, t.constraint_name, t.constraint_type, t.status, 
c.column_name, t.search_condition
from user_constraints t, user_cons_columns c
where t.table_name = c.table_name
and t.constraint_name = c.constraint_name
and t.table_name = upper('&table_name');

-- Ư�� ���̺��� �⺻ Ű�� �ּ� 0��, �ִ� 1��
-- �ϳ��� �÷����� �⺻ Ű�� ����� �� (���� PK), 2�� �̻��� Ű�� �̿��Ͽ� ����� �� (���� PK)
-- ǰ�� �̸� (name), �б� (quarter), ���� (qty)
create table sales(
    name varchar2(20),
    quarter number,
    qty number,
    constraint sales_composite primary key(name, quarter)
);

insert into sales values('���', 1, 10);
insert into sales values('���', 2, 20);
insert into sales values('���', 3, 50);
insert into sales values('���', 4, 30);

select * from sales;

-- ���� �����ʹ� �μ�Ʈ�� �Ұ�
insert into sales values('���', 1, 10);
commit;

desc user_cons_columns;
select * from user_cons_columns where table_name = 'SALES';

-- ���� ������ �̸� ����
alter table employees rename constraint sys_c007010 to employees_id_pk;
alter table employees rename constraint sys_C007009 to employees_password_nn;
alter table employees rename constraint sys_C007008 to employees_name_nn;

-- ���� ������ �̸��� ��������� ����
create table emp07(
    empno number constraint emp07_empno_pk primary key,
    ename varchar2(10) constraint emp07_ename_nn not null,
    job varchar2(9) constraint emp07_job_uk unique,
    deptno number constraint emp07_deptno_fk references dept(deptno)
);