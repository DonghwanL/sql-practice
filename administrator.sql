-- ����Ŭ �ּ��� ���� �ΰ��� ������ �˴ϴ�.
-- ���� ������ ���̺� ����Ʈ�� Ȯ�� �մϴ�.

select * from tab;

create user oraman 
identified by oracle 
account unlock;

alter user oraman default tablespace users;
grant connect, resource to oraman;
-- ���� ����� ����� �����Ͽ� ���
select username from dba_users order by username;

-- ����� ���� ����
drop user oraman cascade;

-- ������ ���� ����ڵ��� �����ϰ�, ����� ����� ��ȸ�� ������. 

create user oraman identified by oracle account unlock;
create user soshi identified by omygod account unlock;
create user bigbang identified by abc123 account unlock;

alter user oraman default tablespace users;
alter user soshi default tablespace users;
alter user bigbang default tablespace users;

grant connect, resource to oraman, soshi, bigbang;

select username from dba_users order by username;
