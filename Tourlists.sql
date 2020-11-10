-- [DDL PART] *************************************************

-- Tourlist ���̺� ���� 
create table Tourlist(
    name varchar2(30) primary key,
    gender varchar2(10) not null,
    age number not null,
    tplace varchar2(20) not null,
    price number,
    grade varchar2(20),
    bstate varchar2(20),
    bdate varchar2(40)
);

-- ������ �߰�
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('������', '����', 32, '�̱�', 420, '���', '�Ϸ�', '2020/03/15');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('�ۿ���', '����', 23, '����', 310, '�Ϲ�', '�Ϸ�', '2020/09/30');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('������', '����', 37, 'ȫ��', 180, 'VIP', '�Ϸ�', '2020/05/03');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('�۵���', '����', 51, '���', 390, 'VIP', '�Ϸ�', '2019/11/20');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('������', '����', 35, '�ɶ���', 298, '���', '�Ϸ�', '2020/02/17');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('������', '����', 28, '������', 270, '�Ϲ�', '�Ϸ�', '2020/04/18');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('���Ͽ�', '����', 42, '����', 320, '���', '�Ϸ�', '2020/09/07');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('ȫ����', '����', 24, '�߱�', 115, '�Ϲ�', '�Ϸ�', '2020/10/11');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('�̰���', '����', 40, '�Ϻ�', 92, 'VIP', '�Ϸ�', '2020/10/29');
insert into Tourlist(name, gender, age, tplace, price, grade, bstate, bdate)
values('������', '����', 26, '���þ�', 200, '�Ϲ�', '�Ϸ�', 2020/06/12);

select * from tourlist;
desc tourlist;
commit;

-- CTAS ����� Ȱ���� ����ִ� �ӽ� ���̺� �����ϱ�
create table Tourlist01
as
select * from Tourlist where 1=2;

-- �÷� �̸� ���� �� ����
alter table tourlist rename column price to amount;

-- ���̺� �̸� ���� �� ����
rename tourlist to tourlists;

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
