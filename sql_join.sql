-- �Խù� ���̺� �̸��� boards��� ���� �մϴ�.
-- [boards ���̺��� column ����]
-- no(�� ��ȣ), writer(�ۼ���), password(��й�ȣ), subject(�� ����), content(�� ����)
-- readhit(��ȸ ��), regdate(�ۼ� ����)

-- ȸ���� Ż�� �ϴ� ���, ������ �ۼ��� �Խù��� ���⵵�� �մϴ�.
alter table boards
add constraint aaa
foreign key(writer)
references employees(id)
on delete set null;

-- ��ǰ�� �������� ��, ������?
on delete set null;

-- �ֹ� ���̺�� �ֹ� �� ���̺��� �ֽ��ϴ�. 
-- �ֹ� ��ҽ� �ֹ� �� ���̺���?
on delete cascade;

-- �Խù� ���̺� �� ���� �������� ���� �մϴ�.
create sequence seqboard;

create table boards(
    no number primary key,
    writer varchar2(30),
    password varchar2(50),
    subject varchar2(50),
    content varchar2(50),
    readhit number default 0,
    regate date default sysdate
);

alter table boards
add constraint boards_writer_fk
foreign key(writer)
references employees(id)
on delete set null;

-- �Խù� ������ ���
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'an', 'abc123', '�ڹ�', '�ʹ� �����', default, '80/12/25');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'an', 'abc123', 'db', '�׷� ����', default, '88/07/17');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'an', 'abc123', 'jsp', '�� ���α׷���', default, '86/08/15');

insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'queen', 'abc123', 'jdbc', '���̵��', default, '90/01/22');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'queen', 'abc123', 'sql', '����ť��', default, '93/06/17');

insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'maria', 'abc123', '�ڹ�', 'java', default, '00/01/22');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'maria', 'abc123', 'sql', 'ȣȣȣ', default, '08/06/17');

insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, null, 'abc123', 'sql', 'ȣȣȣ', default, '08/06/17');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, null, 'abc123', 'sql', 'ȣȣȣ', default, '08/06/17');

commit;

-- �Խù��� �ۼ��� ����� �̸��� �������� ��� (����Ŭ ����)
select employees.name, boards.subject
from employees, boards
where employees.id = boards.writer;

-- �Խù��� �ۼ��� ����� �̸��� �������� ��� (ANSI ���� - ��õ)
select employees.name, boards.subject
from employees join boards
on employees.id = boards.writer;

-- [��Ī�� ����Ͽ� ����] 
-- [�߰����� ������ and �����ڸ� ���]
-- �Խù��� �ۼ��� ����� �̸��� �������� ��� (����Ŭ ����)
select e.name, b.subject
from employees e, boards b
where e.id = b.writer
and e.name in('���߱�', '��������');

-- �Խù��� �ۼ��� ����� �̸��� �������� ��� (ANSI ���� - ��õ)
-- ���̺� �󼼸� ���� Join ���θ� �Ǵ�
select e.name, b.subject
from employees e join boards b
on e.id = b.writer
and e.name in('���߱�', '��������');

-- [Non-Equi Join] 
select rownum, id, name, salary from employees;

update employees set salary = 100 * rownum;
commit;
select * from employees;

-- �޿� �򰡿� ���̺� �ۼ�
create table grades(
    glevel varchar2(2), 
    lovsal number,
    highsal number
);

alter table grades rename column rowsal to lowsal;

insert into grades values('A', 0, 499);
insert into grades values('B', 500, 999);
insert into grades values('C', 1000, 1499);
insert into grades values('D', 1500, 1999);
insert into grades values('E', 2000, 10000);
commit;

-- �� ������� �̸��� �޿��� �޿� �� ����� ���
select e.name, e.salary, g.glevel
from employees e, grades g
where e.salary between g.lowsal and g.highsal;


-- [Outer Join] 
-- ����� �̸��� �Խù� ����� ������ ��ȸ
-- ��, �Խù��� ������ ���� ����鵵 ���� ��ȸ

-- ����Ŭ�� Left Outer Join 
select e.name, b.subject, b.content
from employees e, boards b
where e.id = b.writer(+);

-- ANSI�� Left Outer Join
select e.name, b.subject, b.content
from employees e left outer join boards b
on e.id = b.writer;

-- ����� �̸��� �Խù� ����� ������ ��ȸ
-- ��, Ż���� ���� ������� ��ϵ� ���� ��ȸ

-- ����Ŭ�� Right Outer Join 
select e.name, b.subject, b.content
from employees e, boards b
where e.id(+) = b.writer;

-- ANSI�� Right Outer Join
select e.name, b.subject, b.content
from employees e right outer join boards b
on e.id = b.writer;

-- ANSI�� Full Outer Join
select e.name, b.subject, b.content
from employees e full outer join boards b
on e.id = b.writer;


-- [Self Join] 
-- ���߱��� �����ڴ� �豸
-- ���_���̺�.������_���̵� = ������_���̺�.���̵�

select emp.name || '�� �����ڴ� ' || mgr.name || '�Դϴ�.' as result
from employees emp inner join employees mgr
on emp.manager = mgr.id;

-- �����ڵ� ���Եǵ��� ����
select emp.name || '�� �����ڴ� ' || nvl(mgr.name, '����') || '�Դϴ�.' as result
from employees emp left outer join employees mgr
on emp.manager = mgr.id;

-- [�߰� ����]
-- �� ������� �� ���� �Խù��� ������� Ȯ��
select e.name, count(*) as cnt
from employees e inner join boards b
on e.id = b.writer
group by e.name
order by e.name desc;

-- �� ������� �� ���� �Խù��� ������� Ȯ��
-- �Խù��� ������ ���� ����� 0�� ���
select e.name, count(writer) as cnt
from employees e left outer join boards b
on e.id = b.writer
group by e.name
order by e.name desc;