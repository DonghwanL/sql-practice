-- 오라클 주석은 빼기 두개를 적으면 됩니다.
-- 내가 보유한 테이블 리스트를 확인 합니다.

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

-- 다음과 같이 사용자들을 생성하고, 사용자 목록을 조회해 보세요. 

create user oraman identified by oracle account unlock;
create user soshi identified by omygod account unlock;
create user bigbang identified by abc123 account unlock;

alter user oraman default tablespace users;
alter user soshi default tablespace users;
alter user bigbang default tablespace users;

grant connect, resource to oraman, soshi, bigbang;

select username from dba_users order by username;
