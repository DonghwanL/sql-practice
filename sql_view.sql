
-- oraman ����ڴ� bigbang ����ڿ��� employees ���̺��� �Ϻκ��� ���� �ݴϴ�.
-- ��, ��ü�� �ƴ� ���̵�, �̸�, ����, ���ϸ� ���� �ݴϴ�.

create or replace view view01
as
select id, name, gender, birth from employees;

-- ���� ������ ���̺� �� View ����� Ȯ��
select * from tab;

-- View�� ���̺� ó�� desc�� select ������ ����
-- ���̺��� ��ü�� �ƴ� �κ� ������ ����� ���
desc view01;
select * from view01;

-- ��ü������ �ο� (to Bigbang view01)
grant select on view01 to bigbang;

-- ��ü������ ��� (to Bigbang view01)
revoke select on view01 from bigbang;

-- ������ ���� (����Ŭ�� ��ü���� �����ϱ� ���Ͽ� ���������� �����ϰ� �ִ� ���̺�)
-- ���̺� ��� (user_tables), �� ��� (user_views), ������ ��� (user_sequences)
select * from tab;
select * from seq;

desc user_views;
select view_name, text from user_views order by view_name;

-- ���ο� view ����
create or replace view view02
as
select id, name, birth, address from employees;

create or replace view view03
as
select id, name, password, birth from employees;

select view_name, text from user_views order by view_name;

-- ������ ������ ������ �빮�ڷ� ��ȸ�ؾ� ��� ��ȸ ����
select view_name, text from user_views
where view_name = 'view01'
order by view_name;

select view_name, text from user_views
where view_name = 'VIEW01'
order by view_name;

-- �並 ����Ͽ� ���������� ������ �߰�
-- view02 �̿� (not null ���� ������ �������� �ʾ� ����)
insert into view02 values('sim', '������', sysdate, '����');
desc employees;

-- view03 �̿�
insert into view03 values('sim', '������', 'abc123', sysdate);

-- view04�� �����ϰ� 'bigbang'���� ��ȸ ���� �ο�
create or replace view view04
as
select id, name, birth, gender
from employees
where address = '���'
order by name desc;

grant select on view04 to bigbang;

-- Join�� View �������� ��ȯ
select e.id, e.name, e.salary, b.subject, b.content
from employees e join boards b
on e.id = b.writer;

create or replace view view05
as
select e.id, e.name, e.salary, b.subject, b.content
from employees e join boards b
on e.id = b.writer;

-- ����(where ��)�� �´� ���� ���� �Ұ��� (with check option)
-- '�ֿ�'�� view06�� ���ԵǴ� ������� with check option�� �ش�ǹǷ� ������Ʈ �Ұ�
create or replace view view06
as
select * from employees
where manager = 'yusin'
with check option;

select * from view06;

update view06 set manager = 'soon'
where id = 'an';

update view06 set manager = 'kim09'
where id = 'choi';

-- ����ڿ��� �ܼ��� �����ִ� �뵵, ���� �Ұ� (with read only)
create or replace view view07
as
select * from employees
where manager = 'yusin'
with read only;

select * from view07;

update view07 set name = '��âȣ'
where id = 'an';

update view07 set name = '�ֹ���'
where id = 'choi';

-- [top N ����]
-- �Խù� ���������� Ư�� ������ ������ ������ �����ϱ� ���� ����
-- 2�������� ��ȸ�ϴ� ���� �ۼ�, �� 1�������� 3���� ���

-- ���� ���� �� �������� rownum�� 1 
select rownum, rowid, no, writer, password, subject, content, readhit, regdate
from boards;

-- order by ���� �̿��Ͽ� ���� ����, rownum���� ��ȭ ����
select rownum, rowid, no, writer, password, subject, content, readhit, regdate
from boards
order by no desc;

-- select ������ ���������� ���Ǵ� ���� inline view��� ��
-- rownum�� ���������� ����
select rownum, no, writer, password, subject, content, readhit, regdate
from (select no, writer, password, subject, content, readhit, regdate
        from boards order by no desc);
 
-- <= �����ڴ� �� ����, ������ >=�� inline view������ �������� ����       
select rownum, no, writer, password, subject, content, readhit, regdate
from (select no, writer, password, subject, content, readhit, regdate
        from boards order by no desc)
where rownum <= 3;        

select rownum, no, writer, password, subject, content, readhit, regdate
from (select no, writer, password, subject, content, readhit, regdate
        from boards order by no desc)
where rownum >= 3 and rownum <= 5;  

select no, writer, password, subject, content, readhit, regdate
from (
    select rank() over(order by no desc) as ranking, no, writer, password, subject, 
    content, readhit, regdate
    from boards) 
where ranking between 1 and 3;   
