-- 오라클 주석은 빼기 두개를 적으면 됩니다.
-- 내가 보유한 테이블 리스트를 확인

select * from tab;

create user oraman 
identified by oracle 
account unlock;

alter user oraman default tablespace users;
grant connect, resource to oraman;

-- 현재 사용자 목록을 정렬하여 출력
select username from dba_users order by username;

-- 사용자 계정 삭제
drop user oraman cascade;

-- 다음과 같이 사용자들을 생성하고, 사용자 목록을 조회

create user oraman identified by oracle account unlock;
create user soshi identified by omygod account unlock;
create user bigbang identified by abc123 account unlock;

alter user oraman default tablespace users;
alter user soshi default tablespace users;
alter user bigbang default tablespace users;

grant connect, resource to oraman, soshi, bigbang;

select username from dba_users order by username;

-- 오라멘에게 view 생성 권한을 부여 (시스템 권한) 
grant create view to oraman;

-- 신규 사용자 생성 및 권한 부여
create user mango identified by mango123 account unlock;
alter user mango default tablespace users;
grant connect, resource to mango;

create user soo identified by soo123 quota unlimited on users account unlock;
create user hee identified by hee456 quota unlimited on users account unlock;

alter user soo default tablespace users;
alter user hee default tablespace users;
grant create session to soo, hee;

-- 특정 사용자가 사용하고 있는 기본 테이블 스페이스 확인
select username, default_tablespace
from dba_users
order by username;

-- 테이블 생성을 위한 권한 부여
grant create table to soo, hee;

-- 뷰 생성을 위한 권한 부여
grant create view to soo, hee;

-- 비밀번호 변경 및 암호 만기 옵션 지정
alter user soo identified by a1234 password expire;

-- 신규 비밀번호 변경
alter user soo identified by soo789;

-- 사용자 sample 생성
create user sample identified by sample quota unlimited on users account unlock;
grant connect, create table to sample;
alter user sample default tablespace users;

-- 사용자 sample 삭제
drop user sample;
drop user sample cascade;

-- 시스템 권한 조회
select privilege from role_sys_privs
where role='DBA' order by privilege; 

-- 테이블 생성 권한 제거 및 재부여
revoke create table from soo, hee;
grant create table to soo with admin option;

revoke create table from soo;

-- 신규 사용자 '곰돌이' 생성, 롤을 이용한 권한 부여 (접속, 테이블/뷰/롤)
create user gomdori identified by oracle
quota 1m on users account unlock; 
alter user gomdori default tablespace users;

create role gom_role;

grant create session, create table, create view, create role
to gom_role;

grant gom_role to gomdori;

-- 수여자가 '곰돌이'인 롤의 내용 조회
select * from dba_role_privs where grantee = 'GOMDORI';

-- 'gom_role'에 들어 있는 권한 내용 조회
select * from role_sys_privs where role = 'GOM_ROLE';
