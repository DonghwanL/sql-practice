-- [Sequence]

-- ������ ����
create sequence seqtest01;

-- ������ ��� Ȯ��
select * from seq;

-- ���� �����ϱ�
select seqtest01.nextval from dual;

-- ������ ��ȣ Ȯ��
select seqtest01.currval from dual;

-- ���̺� ����
create table seqtable(
    no number primary key,
    remark varchar2(30)
);

-- ���̺� �����͸� �߰�
insert into seqtable(no, remark) values(seqtest01.nextval, '������');
insert into seqtable(no, remark) values(seqtest01.nextval, 'ȣȣȣ');
insert into seqtable(no, remark) values(seqtest01.nextval, '������');
insert into seqtable(no, remark) values(seqtest01.nextval, 'ũũũ');

commit;
select * from seqtable;

-- ���� ������ ������ �߻� �մϴ�. (values ���縵 ����, �ش� ��ȣ�� ����)
insert into seqtable(no, remark) value(seqtest01.nextval, '������');

insert into seqtable(no, remark) values(seqtest01.nextval, '�󸶹�');

commit;
select * from seqtable;

-- ���� �� : 10, ����ġ : 10, �ִ� �� : 60
create sequence seqtest02 
start with 10 increment by 10 maxvalue 60;

select seqtest02.nextval from dual;

-- �ʱ� ���� 1, ����ġ�� 2�� ������ seqtest03�� ���� 
-- seqtable �����͸� ��� �����ϰ�, ������ seqtest03�� ����Ͽ� 3�� �߰� 
create sequence seqtest03
start with 1 increment by 2;

delete from seqtable; 

insert into seqtable(no, remark) values(seqtest03.nextval, '������');
insert into seqtable(no, remark) values(seqtest03.nextval, '������');
insert into seqtable(no, remark) values(seqtest03.nextval, '�ٴٴ�');

commit;
select * from seqtable;
select * from seq;

-- �������� ���� ����
alter sequence seqtest01 
increment by 100
maxvalue 100000;

insert into seqtable(no, remark) values(seqtest01.nextval, '������');
insert into seqtable(no, remark) values(seqtest01.nextval, '�ٹٹ�');
commit;

-- ������ ����
drop sequence seqtest01;
drop sequence seqtest02;
drop sequence seqtest03;
