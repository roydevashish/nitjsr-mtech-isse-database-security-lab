-- RUN AS: SYS
-- Create a user with 
-- username: DB_SEC
-- password: tiger
-- default tablespace: USERS
-- temporary tablespace: temp
-- quota: unlimited on user
-- profile: default
-- password not expired
-- account: unlocked
CREATE USER DB_SEC IDENTIFIED BY tiger
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON USERS
PROFILE DEFAULT
ACCOUNT UNLOCK
/

-- Provide CREATE SESSION privilege to connect to DB.
GRANT CREATE SESSION TO DB_SEC;

-- Check the DBA_USERS table for list of users.
SELECT *
FROM DBA_USERS
ORDER BY CREATED DESC
/