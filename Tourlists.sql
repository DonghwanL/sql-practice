-- [DDL PART] *************************************************

-- Tourlist ���̺� ���� 
create table Tourlists(
    id varchar2(30) primary key,
    name varchar2(30) not null,
    gender varchar2(10) not null,
    age number not null,
    tplace varchar2(20) not null,
    price number,
    grade varchar2(20),
    bstate varchar2(20),
    bdate varchar2(40)
);

-- ������ �߰�
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('kangjh', '������', '����', 32, '�̱�', 420, '���', '�Ϸ�', '2020/03/15');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('soong1','�ۿ���', '����', 23, '����', 310, '�Ϲ�', '�Ϸ�', '2020/09/30');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('ji3618', '������', '����', 37, 'ȫ��', 180, 'VIP', '�Ϸ�', '2020/05/03');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('sdhkk', '�۵���', '����', 51, '���', 390, 'VIP', '�Ϸ�', '2019/11/20');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('wonju', '������', '����', 35, '�ɶ���', 298, '���', '�Ϸ�', '2020/02/17');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('jusubi', '������', '����', 28, '������', 270, '�Ϲ�', '�Ϸ�', '2020/04/18');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('parkhay', '���Ͽ�', '����', 42, '����', 320, '���', '�Ϸ�', '2020/09/07');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('hongs', 'ȫ����', '����', 24, '�߱�', 115, '�Ϲ�', '�Ϸ�', '2020/10/11');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('leegzz', '�̰���', '����', 40, '�Ϻ�', 92, 'VIP', '�Ϸ�', '2020/10/29');
insert into Tourlists(id, name, gender, age, tplace, price, grade, bstate, bdate)
values('miha98', '������', '����', 26, '���þ�', 200, '�Ϲ�', '�Ϸ�', 2020/06/12);

select * from tourlists;
desc tourlist;
commit;

-- CTAS ����� Ȱ���� ����ִ� �ӽ� ���̺� �����ϱ�
create table Tourlist01
as
select * from Tourlist01 where 1=2;

-- �÷� �̸� ���� �� ����
alter table tourlists rename column price to amount;

-- �ش� �÷��� ���� ���̱�
desc tourlists;
alter table tourlists modify (gender varchar2(20));

-- [commit]
commit;


-- [DML PART] *************************************************

-- [UpDate] 

-- (1) ������ insert �ܰ迡�� �߸� �Է��� ��¥�� ���� �մϴ�.
update tourlists set bdate = '2020/06/12' where name = '������';

-- (2) ��� �������� �������� '������'�� ���� �մϴ�.
update tourlists set tplace = '������';

-- (3) ��� �������� ������� 10% �λ� �մϴ�.
update tourlists set amount = 1.1 * amount;

-- (4) '������' ���� �������� '����'�� ���� �մϴ�.
update tourlists set tplace = '����' where name = '������';

-- (5) '���Ͽ�' ���� �̸��� '������'���� ���� �մϴ�.
update tourlists set name = '������' where name = '���Ͽ�';

-- (6) '������', 'ȫ����', '�ۿ���' ���� ������¸� '�������'�� ���� �մϴ�.
update tourlists set bstate = '�������' where name in ('������', 'ȫ����', '�ۿ���');

-- (7) �Ϲ� ��� ������ �� ������� 100�̻��� �����ڴ� ����� '���'�� ���� �մϴ�.
update tourlists set grade = '���' where grade = '�Ϲ�' and amount >= 100;

-- (8) ��� ��� ������ �� ������� 300�̻��� �����ڴ� ����� 'VIP'�� ���� �մϴ�.
update tourlists set grade = 'VIP' where grade = '���' and amount >= 300;

-- (9) VIP ����� 8%�� ������ ���� �˴ϴ�.
update tourlists set amount = amount - amount * 0.08 where grade = 'VIP';

-- (10) ��� ����� 5%�� ������ ���� �˴ϴ�.
update tourlists set amount = amount - amount * 0.05 where grade = '���';

-- [commit]
commit;

-- [rollback]
rollback;


-- [Delete]

-- (1) ��� �����ڸ� ���� �մϴ�.
delete from tourlists;

-- (2) ������ '�۵���'�� ���� �մϴ�.
delete from tourlists where name = '�۵���';

-- (3) ������°� '�������'�� ���� ���� ���� �մϴ�.
delete from tourlists where bstate = '�������';

-- (4) '���' ��� �� ������� 150������ ���� ���� ���� �մϴ�.
delete from tourlists where grade = '���' and amount <= 150;

-- (5) �������� '����'�� �ƴ� ���� ���� ���� �մϴ�.
delete from tourlists where tplace not in ('����');

-- (6) �������� ���̰� 50�� �̻��� ���� ���� ���� �մϴ�.
delete from tourlists where age >= 50;

-- (7) ���� �������� ���� ���� ���� �մϴ�.
delete from tourlists where gender = '����';

-- (8) 2019/11/20�� ���� ���� ���� �մϴ�.
delete from tourlists where bdate = '2019/11/20';

-- (9) 'VIP' ����� ���� ���� ���� �մϴ�.
delete from tourlists where grade = 'VIP';

-- (10) ������� 200�̻� 300������ ���� ���� �մϴ�.
delete from tourlists where amount >= 200 and amount <= 300;

-- [commit]
commit;

-- [rollback]
rollback;


-- 'VIP' ��� �����ڸ� VIP ���̺� �Է� �մϴ�.
create table VIP
as
select name, gender, age, grade from tourlists where 1 = 2;

insert into VIP(name, gender, age, grade)
select name, gender, age, grade from tourlists where grade = 'VIP';


-- [DQL PART] *************************************************

-- (1) ��� �����ڸ� ��ȸ �մϴ�.
select * from tourlists;

-- (2) ��� �������� �̸�, ����, ���̸� ��ȸ �մϴ�.
select name, gender, age from tourlists;

-- (3) ��� �������� �̸�, ���, ����� + 100�� ��ȸ �մϴ�.
select name, grade, amount + 100 from tourlists;

-- (4) ��� �������� ����� �ߺ��� �����ϰ� ���� �մϴ�.
select * from tourlists;
select distinct grade from tourlists;

-- (5) �̸� : , ��� : , ������ : , �������� : �� ��� �մϴ�.
select '�̸� : ' || name || ', ��� : ' || grade || ', ������ : ' || tplace || ', �������� : ' || bdate from tourlists;

-- (6) �̸��� '������'�� �����ڸ� ��ȸ �մϴ�.
select * from tourlists where name = '������';

-- (7) ������� 250 �̻�, 350 ������ �����ڸ� ��ȸ �մϴ�.
select * from tourlists where amount >= 250 and amount < 350;
select * from tourlists where amount between 250 and 350;

-- (8) �̸��� '������', 'ȫ����'�� �������� ������¿� �������ڸ� ��ȸ �մϴ�.
select name, bstate, bdate from tourlists where name in ('������', 'ȫ����');

-- (9) ������ �� '��'���� ��ȸ �մϴ�.
select * from tourlists where name like '��%';

-- (10) ������ �� '��'��� �ܾ ���Ե� ����� ��ȸ �մϴ�.
select * from tourlists where name like '%��%';

-- (11) �������ڸ� �ֽ� ������ ���� �մϴ�.
select * from tourlists order by bdate desc;

-- (12) ������� ���� ������ ���� �մϴ�.
select * from tourlists order by amount asc;

-- (13) �����ڸ��� '������'������ ���� �մϴ�.
select * from tourlists order by name asc;

-- (14) 'VIP' ����� ���� ��µǵ��� �ϰ�, ������� ū ������ ���� �մϴ�.
select * from tourlists order by grade asc, amount desc;

-- (15) ������ '������'�� '�̰���'�� ������ ������ �ο��� ��ȸ �մϴ�.
select * from tourlists where name not in ('������', '�̰���');

-- (16) '�������'�� �����ڸ� ������ ������ �ο��� ��ȸ �մϴ�.
select * from tourlists where bstate not in ('�������');

-- (17) ������� �Աݵ� �ο��� ��ȸ �մϴ�.
update tourlists set amount = null where name in ('������', '������', '������');

select * from tourlists where amount is not null;

-- (18) ������°� �Ϸ��̰�, �������� '����'�� �����ڸ� ��ȸ �մϴ�.
select * from tourlists where bstate = '�Ϸ�' and tplace = '����';

-- (19) ������ '��'�� �̰ų�, ������ �����ڸ� ����ϵ�, �̸��� ������������ ���� �մϴ�.
select * from tourlists where name like '��%' or gender in ('����')
order by name desc;


-- [Function PART] *************************************************

-- [���ڿ� �Լ�]

-- (1) �̸��� OOO�̰�, ������� OOO �Դϴ�.
select concat(concat(concat('�̸��� ', name), concat('�̰�, ������� ', amount)), '�Դϴ�.')
as result from tourlists;

-- (2) �������ڸ� ���������� ���� �մϴ�.
select substr(bdate, 1, 4) from tourlists;

-- (3) �������ڸ� ���� �ϱ����� ���� �մϴ�.
select substr(bdate, 6, 10) from tourlists;

-- (4) �������ڸ� �ϱ����� ���� �մϴ�.
select substr(bdate, -2, 2) from tourlists;

-- (5) �������� �̸��� ��������� Ȯ�� �մϴ�.
select name, length(name) as ����_���� from tourlists;

-- (6) �������� �̸��� '��'�� ��� �ִ��� Ȯ�� �մϴ�.
select name, instr(name, '��') from tourlists;

-- (7) �̸��� '��'�� �� ��� �����ڸ� Ȯ�� �մϴ�.
select * from tourlists where instr(name, '��') > 0;

-- (8) ������ �̸��� '��'�� '��'���� ���� �մϴ�.
select name, replace(name, '��', '��') from tourlists;

-- (9) �������� �̸��� �Ųٷ� ���� �մϴ�.
select name, reverse(name) from tourlists;

-- (10) �������� �̸��� ������������ �����ϰ� ���鿡 Ư�����ڸ� ä��ϴ�.
select name, rpad(name, 10, '��') from tourlists order by name desc;


-- [������ �Լ�]

-- (1) ������� ceil() �ø�, floor() ���� �մϴ�.
select name, amount, ceil(amount), floor(amount) from tourlists;

-- (2) ������� �Ҽ��� ��°�ڸ����� �ݿø� �մϴ�.
select name, round(amount, 2) as amount from tourlists;

-- (3) ��� ������� ���� ������ �����ϰ� ��Ʈ�� ���� ����� ��� �մϴ�. (�Ҽ��� ��°�ڸ� �ݿø�)
select name, round(sqrt(abs(amount)), 2) as amount from tourlists;

-- (4) ��� ������� 2���� �մϴ�.
select name, power(amount, 2) as amount from tourlists;

-- (5) ������� ��ȣ�� Ȯ�� �մϴ�. (��� 1, ���� -1, 0�̸� 0)
select name, amount, sign(amount) from tourlists;


-- [��¥ ���� �Լ�]

-- (1) ��¥ ������ ������ ���� �մϴ�.
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';

-- (2) �����Ϸκ��� 3���� �� �ð��� ���մϴ�.
select name, add_months(bdate, - 3) as ������ from tourlists;

-- (3) ��� ���� ���� ���� �����Ϸκ��� ����� �������� Ȯ�� �մϴ�.
select name, round(months_between(sysdate, bdate), 2) as ����� from tourlists;

-- (4) '�۵���'�� '������'�� �������ڸ� 3���� �ķ� ���� �մϴ�.
update tourlists set bdate = add_months(bdate, + 3) where name in ('�۵���', '������');

-- (5) '�������' ������ ���� ���� ���� ���ڷ� ���� �մϴ�.
update tourlists set bdate = sysdate where bstate in ('�������');


-- [null ���� �Լ�] 

-- (1) ��� �������� ������� ��ȸ �մϴ�. (������� �������� �ʴ� ��� 150���� ����)
select name, nvl(amount, 150) as newamount from tourlists;

-- (2) ��� �������� ������� ��ȸ �մϴ�. (����� �Ա� ���θ� �ڸ�Ʈ �մϴ�)
select name, nvl2(amount, '�ԱݿϷ�', '�Աݴ��') as bookstate from tourlists;

-- (3) ��� �������� ���ǻ��¸� ��ȸ �մϴ�. (��, ��������� ��쿡�� null ������ ó��)
select name, nullif(bstate, '�������') as ������� from tourlists;


-- [Case ����]

-- (1) �������� �̸��� ����ݰ� �Ļ� ����� ��� �մϴ�.
-- ������� 200 �̻��̸� '���', 300 �̻��̸� 'VIP'�� ��� �մϴ�.

select name, amount,
case
when nvl(amount, 150) >= 300 then 'VIP'
when nvl(amount, 150) >= 200 then '���'
else '�Ϲ�' end as grade
from tourlists;

-- (2) �������� �̸��� ���̿� �Ļ� ����� ��� �մϴ�.
-- ���̰� 40�� �̻��̸� '�߳�', 30�� �̻��̸� 'û��', 20���� ��� '�л�'���� �з�

select name, age,
case
when age >= 40 then '�߳�'
when age >= 30 then 'û��'
else '�л�' end as ageg
from tourlists;


-- [���� ����]
-- tourlists ���̺��� 'VIP'�� �����Ͽ� ���̺� 'VIP_TB'�� ����ϴ�.
-- ������ �߰�) ������ �����̰ų� ������°� �Ϸ��� �����ڸ� �߰�
create table vip_tb
as
select * from tourlists where grade = 'VIP';

insert into vip_tb
select * from tourlists
where gender = '����' and bstate = '�Ϸ�';

select * from vip_tb;

-- tourlists ���̺��� '���'�� �����Ͽ� ���̺� 'GRATE_TB'�� ����ϴ�.
-- ������ �߰�) ������ �����̰ų� ������°� ����� �����ڸ� �߰�
create table great_tb
as
select * from tourlists where grade = '���';

insert into great_tb
select * from tourlists
where gender = '����' and bstate = '�������';

select * from great_tb;
commit;

-- (1) Union 
select name, gender, age, grade, bstate from vip_tb
union
select name, gender, age, grade, bstate from great_tb;

-- (2) Union All
select * from vip_tb union all select * from great_tb;

-- (3) Intersect
select name, gender, age, grade, bstate from vip_tb
intersect
select name, gender, age, grade, bstate from great_tb;
 
-- (4) Minus
select name, gender, age, grade from vip_tb
minus
select name, gender, age, grade from great_tb
order by name desc;

select name, gender, age, grade from great_tb
minus
select name, gender, age, grade from vip_tb
order by name desc;


-- [Group �Լ�]

-- (1) ��� �������� ���� ���մϴ�.
select count(*) from tourlists;

-- (2) �Աݾ��� null�� �� ���� ���մϴ�.
select count(*) - count(amount) from tourlists;

-- (3) 'GRADE' �÷��� �� ���� ������ �����Ͱ� �ִ��� Ȯ�� �մϴ�.
select count(distinct grade) from tourlists;

-- (4) ������� �Ѿ��� ���մϴ�.
select sum(amount) from tourlists;

-- (5) �������� �����ڰ� ���� �� �������� Ȯ�� �մϴ�.
select tplace, count(*) as cnt
from tourlists
group by tplace;

-- (6) ���డ ���� �� �������� Ȯ�� �մϴ�.
select gender, count(*) as cnt
from tourlists
group by gender;

-- (7) ���� ���¿� �ּ� �����, �ִ� ������� ��ȸ �մϴ�.
-- ��, ������� null�� ��� 150���� ����
select bstate, min(nvl(amount, 150)) as "�ּ� �����", max(nvl(amount, 150)) as "�ִ� �����"
from tourlists
group by bstate
order by bstate;

-- (8) ������ �Ϸ�� ���� ��� ������� ����� ���մϴ�. 
-- ��, �������� ������ ��� ����, ������� null�� ��� 150���� ����
select bstate as "���� ����", round(avg(nvl(amount, 150)),2) as "���"
from tourlists
where tplace not in ('����') and bstate = '�Ϸ�'
group by bstate
order by bstate;

-- (9) ����, ��� ���� ���� �� ������ ��ȸ�ϵ�, 2�� �̻� ��ȸ�ǵ��� �մϴ�.
select gender, grade, count(*) as cnt
from tourlists
group by gender, grade
having count(*) >= 2
order by gender, grade;

-- (10) ������ �� �ֽ� ������� ���մϴ�.
-- ��, 2020�� 7�� ���� ���� ���� ����
select name, gender, grade, max(bdate) as "�ֽ� �����"
from tourlists
group by name, gender, grade, bdate
having max(bdate) >= '2020/07/01' 
order by bdate;


-- [JOIN PART] *************************************************

-- �Խù� ���̺� �� ���� �������� ���� �մϴ�. 
create sequence seq_board_t;

create table t_boards(
    no number primary key,
    writer varchar2(30),
    subject varchar2(50),
    content varchar2(50),
    readhit number default 0,
    regdate date default sysdate
);

alter table t_boards
add constraint t_boards_writer_fk
foreign key(writer)
references tourlists(id)
on delete set null;

-- �Խù� �����͸� ��� �մϴ�.
insert into t_boards(no, writer, subject, content, readhit, regdate)
values(seqboard.nextval, 'parkhay', '���� �� ���� ����', '�������� �����ϰ� �ͽ��ϴ�', default, '2020/09/13');
insert into t_boards(no, writer, subject, content, readhit, regdate)
values(seqboard.nextval, 'parkhay', '���� �� ������ �ȵǾ����', '��ȭ�� ��� ��û', default, '2020/09/15');

insert into t_boards(no, writer, subject, content, readhit, regdate)
values(seqboard.nextval, 'wonju', '���� �� ��� �ϰڽ��ϴ�~', '��� ����', default, '2020/10/01');
insert into t_boards(no, writer, subject, content, readhit, regdate)
values(seqboard.nextval, 'wonju', '��� �� ȯ��', 'ȯ�Ұ��´� 632183122212', default, '2020/10/03');

insert into t_boards(no, writer, subject, content, readhit, regdate)
values(seqboard.nextval, 'jusubi', '���ϸ��� �����ؼ� ����', '���ϸ��� ����', default, '2020/05/12');
insert into t_boards(no, writer, subject, content, readhit, regdate)
values(seqboard.nextval, 'jusubi', '��� ������ ���� �ǳ���?', '�����ڷ� ��� ������ �ɱ��?', default, '2020/06/13');

commit;

-- [Equi Inner Join]
-- �Խù��� �ۼ��� ����� �̸��� ������� ������ ��� �մϴ�.
select t.name, b.subject, b.content
from tourlists t join t_boards b
on t.id = b.writer;

-- [Non-equi Inner Join]
-- ��� �򰡿� ���̺��� �ۼ� �մϴ�.
create table t_grades(
    glevel varchar2(30), 
    lowamt number,
    highamt number
);

insert into t_grades values('�Ϲ�', 0, 100);
insert into t_grades values('���', 150, 200);
insert into t_grades values('VIP', 250, 400);

commit;

-- �� �������� �̸�, ���, ������� ��� �մϴ�.
select t.name, t.grade, g.glevel
from tourlists t, t_grades g
where t.grade between g.lowamt and g.highamt;

-- [Outer Join] 
-- �Խù��� ������ �������� �̸��� �Խù� ����� ������ ��ȸ �մϴ�.
-- �� �Խù��� ������ ���� �����ڵ� ���� ��ȸ �մϴ�.
select t.name, b.subject, b.content
from tourlists t left outer join t_boards b
on t.id = b.writer;

-- �Խù��� ������ �������� �̸��� �Խù� ����� ������ ��ȸ �մϴ�.
select t.name, b.subject, b.content
from tourlists t right outer join t_boards b
on t.id = b.writer;

-- �� �����ڵ��� �� ���� �Խù��� ������� Ȯ�� �մϴ�.
-- �Խù��� ������ ���� �����ڴ� 0�� ��� �մϴ�. 
select t.name, count(writer) as cnt
from tourlists t left outer join t_boards b
on t.id = b.writer
group by t.name
order by t.name desc;

-- [Self Join]


-- [SUBQUERY PART] *************************************************

-- [������ ��������] 

-- (1) ��պ��� ���� ������� ������ �������� �̸��� ������� ��ȸ �մϴ�.
select name, amount
from tourlists
where amount >= (select avg(amount) from tourlists);

-- (2) ������ '������'���� ���� ������� �����ڵ��� �̸���, ������� ��ȸ �մϴ�.
select name, amount
from tourlists
where amount < (select amount from tourlists where id = 'wonju');

-- (3) ������°� �Ϸ��̸鼭 �������ڰ� 2020/07/01�� ������ �����ڸ� ��ȸ �մϴ�.
select name, id, bstate, bdate
from tourlists
where bstate in (select bstate from tourlists where bstate = '�Ϸ�')
and bdate >= '2020/07/01';

-- [������ ��������] 

-- (1) ����� VIP�� �����ڵ��� �̸�, ���̵�, ������ ��ȸ �մϴ�.
select name, id, gender, grade
from tourlists
where id in (select id from tourlists where grade = 'VIP');

-- (2) ������°� '�������'�� �ƴ� �����ڵ��� �̸�, ���̵�, ������ ��ȸ �մϴ�.
select name, id, gender
from tourlists
where id not in (select id from tourlists where bstate = '�������');

-- (3) ������� �� ���� ������� �������� �̸�, ���̵�, ����, �����, ������¸� ��� �մϴ�.
select name, id, gender, amount, bstate
from tourlists
where (bstate, amount) in (select bstate, min(amount) from tourlists group by bstate);

-- (4) ����� '���'�� ������ �߿��� �ּ� ������� �ο����� ������� ���� �ο��� ��ȸ �մϴ�.
select name, amount from tourlists
where amount > any (select amount from tourlists where grade = '���');

-- (5) ����� '���'�� ������ �߿��� �ּ� ������� �ο����� ������� ���� �ο��� ��ȸ �մϴ�.
select name, amount from tourlists
where amount < all (select amount from tourlists where grade = '���');


-- [VIEW PART] *************************************************
-- [mango ����ڿ��� ������ view ���̺� ����]
create or replace view mangov
as
select id, name, age, tplace, grade from tourlists;

select * from mangov;

-- [��ü ������ �ο� (to mango : ���� ��ȸ Ȯ��)]
grant select on mangov to mango;

desc mangov;
select view_name, text from user_views order by view_name;

-- [������ �������� ��� ��ȸ]
select view_name, text from user_views
where view_name = 'MANGOV'
order by view_name;

-- [�並 �̿��� �������� ������ �߰�]
create or replace view mangov1
as
select id, name, gender, age, tplace from tourlists;

desc mangov1;

insert into mangov1 values('junghu', '������', '����', 45, '�̱�');

select * from mangov1;

-- [view �������� ����]
create or replace view mangov2
as
select t.id, t.name, t.gender, b.subject, b.content
from tourlists t join t_boards b
on t.id = b.writer;

select * from mangov2;

-- [with check option]
create or replace view mangov3
as
select * from tourlists
where grade = 'VIP'
with check option;

select * from mangov3;

-- VIP ��޿� �ش�Ǵ� �����ڴ� with check option�� ���ؼ� ���� �Ұ�
update mangov3 set grade = '���'
where id = 'ji3618';

-- [with read only]
create or replace view mangov4
as
select * from tourlists
where grade = 'VIP'
with read only;

select * from mangov4;

-- VIP ��޿� �ش�Ǵ� �����ڴ� with read only�� ���� ���� �Ұ�
update mangov4 set grade = '�Ϲ�'
where id = 'sdhkk';

-- [����¡ ó��]
select no, writer, subject, content, readhit, regdate
from (
    select rank() over(order by no desc) as ranking, no, writer, subject, content,
    readhit, regdate from t_boards)
where ranking between 1 and 3;


-- [CONSTRAINT PART] *************************************************
-- ['�����' ���� ���̺� ���� �� ������ �߰�]
create table catdesc(
    cno number primary key,
    ctype varchar2(30),
    location varchar2(50)
);

insert into catdesc values(1, '�丣�þ� �����', '�丣�þ�');
insert into catdesc values(2, '�� �����', '�±�');
insert into catdesc values(3, '���þ� ���', '���þ�');

select * from catdesc;
commit;

create table catinfo(
    cname varchar2(30) unique,
    cweight number,
    guardian varchar2(40) not null,
    cno number not null
);

-- [���Ἲ �������� ����]
alter table catinfo
add constraint catinfo
foreign key(cno)
references catdesc(cno);

-- [catinfo ���̺�_ ������ �߰�]
desc catinfo;

-- cweight �÷��� not null ���� ������ ���� null �Է� ����
insert into catinfo values('����', null, '�̵�ȯ', 1);
insert into catinfo values('ĥ��', 2.5, '�ں���', 3);

-- guardian �÷��� not null ���� ������ �־� null �Է� �Ұ���
insert into catinfo values('���', 7.5, null, 2);

-- cno �÷��� �߰��ϰ��� �ϴ� number�� ����, parent key not found
insert into catinfo values('����', 7.5, '�ں���', 5);

-- cname �÷��� unique ���� ������ �־� �ߺ��� �Ұ���
insert into catinfo values('����', 6.4, '�̵�ȯ', 1);

-- [primary key]
create table catinfo01(
    cname varchar2(30) primary key,
    cweight number,
    guardian varchar2(40) not null,
    cno number
);

-- �������� ������ �߰� 
insert into catinfo01 values('ġŸ', null, '������', 2);

-- primary key�� �ݵ�� �Է� �Ǿ�� ��. (unique + not null)
insert into catinfo01 values(null, 5.5, '�տ���', 3);


-- [check ���� ����]
create table catinfo02(
    cname varchar2(30) primary key,
    cweight number,
    cgender varchar(5) check(cgender in ('m', 'f')),
    guardian varchar2(40) not null,
    carefee number check(carefee >= 500),
    cno number
);

select * from catinfo02;

-- �������� ������ �߰�
insert into catinfo02 values('�Ҹ�', null, 'm', '������', 5000, 1);

-- carefee �÷� ���� (���� ���� ����, carefee 500 ����)
insert into catinfo02 values('����', null, 'm', '������', 300, 1);

-- cgender �÷� ���� (���� ���� ����, ������ ������ �̿� �ٸ� ������ �Է�)
insert into catinfo02 values('����', null, 'k', '������', 3200, 2);


-- [USER_CONSTRAINTS ��ȸ]
select t.table_name, t.constraint_name, t.constraint_type, t.status, 
c.column_name, t.search_condition
from user_constraints t, user_cons_columns c
where t.table_name = c.table_name
and t.constraint_name = c.constraint_name
and t.table_name = upper('&table_name');
