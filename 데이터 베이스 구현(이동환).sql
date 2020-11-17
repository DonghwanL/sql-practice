-- [���� 1]
-- [������]
-- ['dori' ���� ���� �� ���̺� ����]
create user dori identified by dori123 account unlock;
alter user dori default tablespace users;
grant create session, create table to dori;

-- [������]
-- [���̺� ����]
create table members(
    id varchar2(10) primary key,
    name varchar2(30) not null,
    address varchar2(15),
    hobby varchar2(30) check(hobby in('�籸', '��Ʈ', '�°�')),
    salary number check(salary >= 100)
);

create table boards(
    writer varchar2(10),
    subject varchar2(30),
    password number,
    content varchar2(50),
    readhit number default 0
);


-- [���̺� ������ �߰�]
insert into members values('hong', 'ȫ�浿', '���� ����', '�籸', 100);
insert into members values('park', '�ڿ���', '��� ����', '��Ʈ', 200);
insert into members values('kim', '��ö��', '���� ����', '�°�', 300);
insert into members values('choi', '�����', '������', '�°�', 300);

select * from members;

insert into boards values('hong', 'jsp�����', 1234, '���� �������', 0);
insert into boards values('hong', '� ��', 1234, '���� ������', 5);
insert into boards values('hong', '�����սô�', 1234, '�۸۸�', 2);
insert into boards values('park', '� ��', 1234, '������������', default);
insert into boards values('park', '�����սô�', 1234, '��������', 5);

select * from boards;
commit;

-- [���� ���Ἲ ���� ���� �����]
alter table boards
add constraint asdf
foreign key(writer)
references members(id);

-- [���� 2]
-- [������]
-- ['soon' ���� ���� �� ���� �ο�]
create user soon identified by soon123 account unlock;
alter user soon default tablespace users;
grant create session, create table, create view to soon;

-- [������]
-- [���̺� ����]
create table BranchA(
   id number, 
   name varchar2(50),
   publisher varchar2(50),
   price number
);

create table BranchB(
   id number, 
   name varchar2(50),
   publisher varchar2(50),
   price number
);

-- [������ ���� �� ���̺� ������ �߰�]
create sequence seqbranch;

insert into BranchA values(seqbranch.nextval, '�߱��� ����', '���ϸ� ������', 1000);
insert into BranchA values(seqbranch.nextval, '���� �౸', '���� ���ǻ�', 2000);
insert into BranchA values(seqbranch.nextval, '�������� ����', '���� ���ǻ�', 3000);

select * from BranchA;

insert into BranchB values(seqbranch.nextval, '�߱��� ����', '���ϸ� ������', 1000);
insert into BranchB values(seqbranch.nextval, '�籸 ����', '���� ���ǻ�', 4000);
insert into BranchB values(seqbranch.nextval, 'ȣ�ż�', '���ϸ� ������', 5000);

commit;
select * from BranchB;

-- [���� 3]
-- [������ ����� ��ȸ�Ͽ� �ű� ���̺� 'MyBranch'�� ����, �ߺ��� �����ʹ� �� ���� ǥ��]
-- [������]
create or replace view view01
as
select * from BranchA union select * from BranchB

grant select on view01 to dori;

-- [������]
select * from soon.view01;

create table MyBranch
as
select distinct name, publisher, price from soon.view01;

select * from MyBranch;

-- [���� 4]
-- [������]
-- [�ּ� �Է��� ���� address �÷� ũ�� ����]
alter table members modify(address varchar2(100));
update members set address = '����� ������ ������ ���� ���̾� �������� 111�� 222ȣ'
where id = 'park';

-- [���ο� ��� �Է��� ���� ���� ���� ����]
alter table members drop constraint members_hobby_ck;
alter table members add constraint members_hobby_ck check(hobby in('�籸', '��Ʈ', '�°�', '����'));

alter table members drop constraint members_salary_ck;
alter table members add constraint members_salary_ck check(salary >= 500);

insert into members values('lee', '�̼���', '���빮 ����', '����', 500);
insert into members values('shin', '�Ż��Ӵ�', '���빮 ����', '����', 30);

commit;

-- [���� 5]
-- [������]
-- [members ���̺��� ���� ���� �̸� ����]
alter table members rename constraint sys_c007132 to members_name_nn;
alter table members rename constraint sys_C007133 to members_hobby_ck;
alter table members rename constraint sys_c007134 to members_salary_ck;
alter table members rename constraint sys_c007135 to members_id_pk;

commit;

-- [���� 6] 
-- [�ּ� �޿��� �޴� ����� �̸��� �޿��� �ּҸ� ���]
-- [������]
create or replace view minview
as
select name, salary, address from members
where salary = (select min(salary) from members);

select * from minview;

grant select on minview to soon;

-- [������]
select * from dori.minview;

-- [�Խù��� ������ ���� ������� �̸��� �ּҸ� ���]
-- [������]
create or replace view noboard
as
select m.name, m.address 
from members m left outer join boards b
on m.id = b.writer
and m.id not in('hong', 'park');

select * from noboard;
grant select on noboard to soon;

-- [������]
select * from dori.noboard;

-- [���� 7]
-- �� newrole ����, view ����, role ���� ������ �ο� -> '������'
-- [������]

create role newrole;
grant create view, create role to newrole;

grant newrole to soon;

-- [������]

create role soonrole;
grant select on BranchA to soonrole;
grant insert on BranchA to soonrole;

grant soonrole to dori;

-- [������]
select * from soon.BranchA;
