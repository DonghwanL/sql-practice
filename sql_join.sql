
-- 게시물 테이블 이름을 boards라고 가정 합니다.
-- [boards 테이블의 column 구성]
-- no(글 번호), writer(작성자), password(비밀번호), subject(글 제목), content(글 내용)
-- readhit(조회 수), regdate(작성 일자)

-- 회원이 탈퇴를 하는 경우, 이전에 작성한 게시물은 남기도록 합니다.
alter table boards
add constraint aaa
foreign key(writer)
references employees(id)
on delete set null;

-- 상품이 지워졌을 때, 매출은?
on delete set null;

-- 주문 테이블과 주문 상세 테이블이 있습니다. 
-- 주문 취소시 주문 상세 테이블은?
on delete cascade;

-- 게시물 테이블 및 관련 시퀀스를 생성 합니다.
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

-- 게시물 데이터 등록
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'an', 'abc123', '자바', '너무 어려워', default, '80/12/25');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'an', 'abc123', 'db', '그룹 바이', default, '88/07/17');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'an', 'abc123', 'jsp', '웹 프로그래밍', default, '86/08/15');

insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'queen', 'abc123', 'jdbc', '제이디비씨', default, '90/01/22');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'queen', 'abc123', 'sql', '에스큐엘', default, '93/06/17');

insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'maria', 'abc123', '자바', 'java', default, '00/01/22');
insert into boards(no, writer, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'maria', 'abc123', 'sql', '호호호', default, '08/06/17');


