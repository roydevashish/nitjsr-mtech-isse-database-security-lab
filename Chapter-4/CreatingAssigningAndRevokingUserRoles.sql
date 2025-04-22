-- RUN AS: SYS
-- Create role: ROLE_CONNECT_TO_DB
CREATE ROLE ROLE_CONNECT_TO_DB;

-- Grant CREATE SESSION privilege to role: ROLE_CONNECT_TO_DB
GRANT CREATE SESSION TO ROLE_CONNECT_TO_DB;

-- If user: SCOTT exists, drop the user: SCOTT
DROP USER SCOTT CASCADE;

-- Create a user: SCOTT with password: tiger
CREATE USER SCOTT IDENTIFIED BY tiger;

-- Grant role: ROLE_CONNECT_TO_DB to user: SCOTT
GRANT ROLE_CONNECT_TO_DB TO SCOTT;

-- RUN AS: SCOTT
-- Try to login as user: SCOTT and print the current logged in user's name
BEGIN
    DBMS_OUTPUT.PUT_LINE('CURRENT LOGGED IN USER IS: ' || USER);
END;
/

-- RUN AS: SYS
-- Remove/Revoke role: ROLE_CONNECT_TO_DB from user: SCOTT
REVOKE ROLE_CONNECT_TO_DB FROM SCOTT;

-- RUN AS: SCOTT
-- Try to login as user: SCOTT and print the current logged in user's name
BEGIN
    DBMS_OUTPUT.PUT_LINE('CURRENT LOGGED IN USER IS: ' || USER);
END;
/

-- RUN AS: SYS
-- List all the roles in database
SELECT * FROM DBA_ROLES;

-- List all the roles assigned to users
SELECT * FROM DBA_ROLE_PRIVS;

-- List all the roles assigned to other roles
SELECT * FROM ROLE_ROLE_PRIVS;

-- List all the roles with system privileges
SELECT * FROM ROLE_SYS_PRIVS;

-- List all the roles with object privileges
SELECT * FROM ROLE_TAB_PRIVS;

-- List all the roles enabled in the current session
SELECT * FROM SESSION_ROLES;