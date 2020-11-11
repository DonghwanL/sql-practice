
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


