-- System Privileges
-- Granted only by a database administrator or user who have been granted the administrator option.
-- RUN AS: SYS
-- If user doesn't exist, create a user: DB_USER_A with password: tiger
CREATE USER DB_USER_A IDENTIFIED BY tiger
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON USERS
PROFILE DEFAULT
ACCOUNT UNLOCK
/

-- Grant CREATE SESSION and CREATE TABLE to user: DB_USER_A to connect to DB and create tables
GRANT CREATE SESSION, CREATE TABLE TO DB_USER_A;

-- If user doesn't exist, create a user: DB_USER_B with password: tiger
CREATE USER DB_USER_B IDENTIFIED BY tiger
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON USERS
PROFILE DEFAULT
ACCOUNT UNLOCK
/

-- Grant CREATE SESSION to user: DB_USER_B to connect to DB
GRANT CREATE SESSION TO DB_USER_B;

-- Grant SELECT ANY TABLE to user: DB_USER_B
GRANT SELECT ANY TABLE TO DB_USER_B;

-- RUN AS: DB_USER_A
-- Create a new table: DB_USER_A.EMP
CREATE TABLE DB_USER_A.EMP (
    EMP_ID NUMBER NOT NULL,
    EMP_NAME VARCHAR2(30) NOT NULL
);

-- RUN AS: DB_USER_B
-- Select and view the data of table: DB_USER_A.EMP
SELECT * FROM DB_USER_A.EMP;

-- RUN AS: SYS
-- Remove/Revoke the SELECT ANY TABLE privilege from user: DB_USER_B
REVOKE SELECT ANY TABLE FROM DB_USER_B;

-- RUN AS: DB_USER_B
-- Try to select and view the data of table: DB_USER_A.EMP
SELECT * FROM DB_USER_A.EMP;

-- System Privileges with Admin option
-- RUN AS: SYS
-- If user: LINDA do not exist, create user: LINDA with password: tiger
CREATE USER LINDA IDENTIFIED BY tiger;
-- Grant CREATE SESSION to user: LINDA to connect to DB
GRANT CREATE SESSION TO LINDA;

-- If user: GEORGE do not exist, create user: GEORGE with password: tiger
CREATE USER GEORGE IDENTIFIED BY tiger;
-- Grant CREATE SESSION to user: GEORGE to connect to DB
GRANT CREATE SESSION TO GEORGE;

-- Grant SELECT ANY TABLE privilege to user: LINDA with ADIMIN OPTION
GRANT SELECT ANY TABLE TO LINDA WITH ADMIN OPTION;

-- RUN AS: LINDA
-- Grant SELECT ANY TABLE privilege to user: GEORGE
GRANT SELECT ANY TABLE TO GEORGE;

-- RUN AS: SYS
-- Remove/Revoke SELECT ANY TABLE privilege from user: LINDA
REVOKE SELECT ANY TABLE FROM LINDA;

-- RUN AS: LINDA
-- Try SELECT on table: DB_USER_A.EMP
SELECT * FROM DB_USER_A.EMP;

-- RUN AS: GEORGE
-- Try SELECT on table: DB_USER_A.EMP
SELECT * FROM DB_USER_A.EMP;

-- RUN AS: SYS
-- View all system privileges assigned to users
SELECT * FROM DBA_SYS_PRIVS;

-- As DBA view all system privileges assigned to user: GEORGE 
SELECT * 
FROM DBA_SYS_PRIVS
WHERE GRANTEE = 'GEORGE';

-- RUN AS: GEORGE
-- View all system privileges assigned to current loged in user: GEORGE
SELECT * FROM USER_SYS_PRIVS;

-- Object Privileges
-- RUN AS: SYS
-- If user: SCOTT do not exist, create user: SCOTT with password: tiger
CREATE USER SCOTT IDENTIFIED BY tiger;
-- Grant CREATE SESSION to user: LINDA to connect to DB
GRANT CREATE SESSION, CREATE TABLE TO SCOTT;

-- If user: LINDA do not exist, create user: LINDA with password: tiger
CREATE USER LINDA IDENTIFIED BY tiger;
-- Grant CREATE SESSION to user: LINDA to connect to DB
GRANT CREATE SESSION TO LINDA;

-- RUN AS: SCOTT
-- If table: SCOTT.EMP doesn't exist, create a table: SCOTT.EMP
CREATE TABLE SCOTT.EMP (
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30)
);

-- Grant SELECT privilege on table: SCOTT.EMP to user: LINDA
GRANT SELECT ON SCOTT.EMP TO LINDA;

-- RUN AS: LINDA
-- View the table: SCOTT.EMP
SELECT * FROM SCOTT.EMP;

-- RUN AS: SCOTT
-- Remove/Revoke SELECT privilege on table: SCOTT.EMP from user: LINDA
REVOKE SELECT ON SCOTT.EMP FROM LINDA;

-- RUN AS: LINDA
-- View the table: SCOTT.EMP
SELECT * FROM SCOTT.EMP;

-- Object Privileges with GRANT OPTION
-- RUN AS: SCOTT
-- -- If user: SCOTT do not exist, create user: SCOTT with password: tiger
CREATE USER SCOTT IDENTIFIED BY tiger;
-- Grant CREATE SESSION to user: LINDA to connect to DB
GRANT CREATE SESSION, CREATE TABLE TO SCOTT;

-- If user: LINDA do not exist, create user: LINDA with password: tiger
CREATE USER LINDA IDENTIFIED BY tiger;
-- Grant CREATE SESSION to user: LINDA to connect to DB
GRANT CREATE SESSION TO LINDA;

-- If user: GEORGE do not exist, create user: GEORGE with password: tiger
CREATE USER GEORGE IDENTIFIED BY tiger;
-- Grant CREATE SESSION to user: GEORGE to connect to DB
GRANT CREATE SESSION TO GEORGE;

-- RUN AS: SCOTT
-- If table: SCOTT.EMP doesn't exist, create a table: SCOTT.EMP
CREATE TABLE SCOTT.EMP (
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30)
);

-- Grant SELECT privilege with GRANT OPTION on table: SCOTT.EMP to user: LINDA
GRANT SELECT ON SCOTT.EMP TO LINDA WITH GRANT OPTION;

-- RUN AS: LINDA
-- View the table: SCOTT.EMP
SELECT * FROM SCOTT.EMP;

-- Grant SELECT privilege on table: SCOTT.EMP to user: GEROGE by LINDA
GRANT SELECT ON SCOTT.EMP TO GEORGE;

-- RUN AS: GEORGE
-- View the table: SCOTT.EMP
SELECT * FROM SCOTT.EMP;

-- RUN AS: SCOTT
-- Remove/Revoke SELECT privilege on table: SCOTT.EMP from user: LINDA
REVOKE SELECT ON SCOTT.EMP FROM LINDA;

-- RUN AS: LINDA
-- View the table: SCOTT.EMP
SELECT * FROM SCOTT.EMP;

-- RUN AS: GEORGE
-- View the table: SCOTT.EMP
SELECT * FROM SCOTT.EMP;

-- RUN AS: SYS
-- As DBA user: SYS, view all the object privileges issued by user: SYS
SELECT * FROM DBA_TAB_PRIVS;

-- RUN AS: SCOTT
-- As current logged in user: SCOTT, view all the object privileges
SELECT * FROM USER_TAB_PRIVS;
-- As current logged in user: SCOTT, view all the object privileges made
SELECT * FROM USER_TAB_PRIVS_MADE;
-- As current logged in user: SCOTT, view all the object privileges received
SELECT * FROM USER_TAB_PRIVS_RECD;

-- RUN AS: LINDA
-- As current logged in user: LINDA, view all the object privileges
SELECT * FROM USER_TAB_PRIVS;
-- As current logged in user: LINDA, view all the object privileges made
SELECT * FROM USER_TAB_PRIVS_MADE;
-- As current logged in user: LINDA, view all the object privileges received
SELECT * FROM USER_TAB_PRIVS_RECD;

-- RUN AS: GEORGE
-- As current logged in user: GEORGE, view all the object privileges
SELECT * FROM USER_TAB_PRIVS;
-- As current logged in user: GEORGE, view all the object privileges made
SELECT * FROM USER_TAB_PRIVS_MADE;
-- As current logged in user: GEORGE, view all the object privileges received
SELECT * FROM USER_TAB_PRIVS_RECD;

-- RUN AS: any user
-- View all the object privileges
SELECT * FROM ALL_TAB_PRIVS;
-- View all the object privileges made
SELECT * FROM ALL_TAB_PRIVS_MADE;
-- View all the object privileges received
SELECT * FROM ALL_TAB_PRIVS_RECD;