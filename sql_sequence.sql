-- [Sequence]

-- 시퀀스 생성
create sequence seqtest01;

-- 시퀀스 목록 확인
select * from seq;

-- 숫자 추출하기
select seqtest01.nextval from dual;

-- 추출한 번호 확인
select seqtest01.currval from dual;

-- 테이블 생성
create table seqtable(
    no number primary key,
    remark varchar2(30)
);

-- 테이블에 데이터를 추가
insert into seqtable(no, remark) values(seqtest01.nextval, '하하하');
insert into seqtable(no, remark) values(seqtest01.nextval, '호호호');
insert into seqtable(no, remark) values(seqtest01.nextval, '히히히');
insert into seqtable(no, remark) values(seqtest01.nextval, '크크크');

commit;
select * from seqtable;

-- 다음 문장은 오류가 발생 합니다. (values 스펠링 오류, 해당 번호는 폐기됨)
insert into seqtable(no, remark) value(seqtest01.nextval, '가나다');

insert into seqtable(no, remark) values(seqtest01.nextval, '라마바');

commit;
select * from seqtable;

-- 시작 값 : 10, 증감치 : 10, 최대 값 : 60
create sequence seqtest02 
start with 10 increment by 10 maxvalue 60;

select seqtest02.nextval from dual;

-- 초기 값은 1, 증감치는 2인 시퀀스 seqtest03을 생성 
-- seqtable 데이터를 모두 삭제하고, 시퀀스 seqtest03를 사용하여 3건 추가 
create sequence seqtest03
start with 1 increment by 2;

delete from seqtable; 

insert into seqtable(no, remark) values(seqtest03.nextval, '가가가');
insert into seqtable(no, remark) values(seqtest03.nextval, '나나나');
insert into seqtable(no, remark) values(seqtest03.nextval, '다다다');

commit;
select * from seqtable;
select * from seq;

-- 시퀀스의 내용 변경
alter sequence seqtest01 
increment by 100
maxvalue 100000;

insert into seqtable(no, remark) values(seqtest01.nextval, '마마마');
insert into seqtable(no, remark) values(seqtest01.nextval, '바바바');
commit;

-- 시퀀스 삭제
drop sequence seqtest01;
drop sequence seqtest02;
drop sequence seqtest03;
