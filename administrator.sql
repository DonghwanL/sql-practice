-- ����Ŭ �ּ��� ���� �ΰ��� ������ �˴ϴ�.
-- ���� ������ ���̺� ����Ʈ�� Ȯ��

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

-- ������ ���� ����ڵ��� �����ϰ�, ����� ����� ��ȸ

create user oraman identified by oracle account unlock;
create user soshi identified by omygod account unlock;
create user bigbang identified by abc123 account unlock;

alter user oraman default tablespace users;
alter user soshi default tablespace users;
alter user bigbang default tablespace users;

grant connect, resource to oraman, soshi, bigbang;

select username from dba_users order by username;

-- ����࿡�� view ���� ������ �ο� (�ý��� ����) 
grant create view to oraman;

-- �ű� ����� ���� �� ���� �ο�
create user mango identified by mango123 account unlock;
alter user mango default tablespace users;
grant connect, resource to mango;

create user soo identified by soo123 quota unlimited on users account unlock;
create user hee identified by hee456 quota unlimited on users account unlock;

alter user soo default tablespace users;
alter user hee default tablespace users;
grant create session to soo, hee;

-- Ư�� ����ڰ� ����ϰ� �ִ� �⺻ ���̺� �����̽� Ȯ��
select username, default_tablespace
from dba_users
order by username;

-- ���̺� ������ ���� ���� �ο�
grant create table to soo, hee;

-- �� ������ ���� ���� �ο�
grant create view to soo, hee;

-- ��й�ȣ ���� �� ��ȣ ���� �ɼ� ����
alter user soo identified by a1234 password expire;

-- �ű� ��й�ȣ ����
alter user soo identified by soo789;

-- ����� sample ����
create user sample identified by sample quota unlimited on users account unlock;
grant connect, create table to sample;
alter user sample default tablespace users;

-- ����� sample ����
drop user sample;
drop user sample cascade;

-- �ý��� ���� ��ȸ
select privilege from role_sys_privs
where role='DBA' order by privilege; 

-- ���̺� ���� ���� ���� �� ��ο�
revoke create table from soo, hee;
grant create table to soo with admin option;

revoke create table from soo;

-- �ű� ����� '������' ����, ���� �̿��� ���� �ο� (����, ���̺�/��/��)
create user gomdori identified by oracle
quota 1m on users account unlock; 
alter user gomdori default tablespace users;

create role gom_role;

grant create session, create table, create view, create role
to gom_role;

grant gom_role to gomdori;

-- �����ڰ� '������'�� ���� ���� ��ȸ
select * from dba_role_privs where grantee = 'GOMDORI';

-- 'gom_role'�� ��� �ִ� ���� ���� ��ȸ
select * from role_sys_privs where role = 'GOM_ROLE';
