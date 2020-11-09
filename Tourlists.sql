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
