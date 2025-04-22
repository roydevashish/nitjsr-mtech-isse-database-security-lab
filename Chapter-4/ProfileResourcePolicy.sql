-- RUN AS: SYS
-- Create profile: PROFILE_RESOURCE_POLICY with
-- Connection time should not exceeds 2 hours
-- Session should be disconnected if idle time exceeds 15 min
-- CPU time allowed per call is 10 sec.
CREATE PROFILE PROFILE_RESOURCE_POLICY
LIMIT
    SESSIONS_PER_USER           DEFAULT
    CPU_PER_SESSION             DEFAULT
    CPU_PER_CALL                1000
    CONNECT_TIME                120
    IDLE_TIME                   15
    LOGICAL_READS_PER_SESSION   DEFAULT
    LOGICAL_READS_PER_CALL      DEFAULT
    COMPOSITE_LIMIT             DEFAULT
    PRIVATE_SGA                 DEFAULT
/

-- List profile from table: DBA_PROFILES
SELECT *
FROM DBA_PROFILES
WHERE PROFILE = 'PROFILE_RESOURCE_POLICY'
/

-- Modify profile: CH04_PROF with ideal time to 30 min
ALTER PROFILE PROFILE_RESOURCE_POLICY
LIMIT
    IDLE_TIME 30
/

-- If user do not exits then, create a new user: SAFYOUNI and assign a profile to user: SAFYOUNI using ALTER USER
-- Create a new user: SAFYOUNI
CREATE USER SAFYOUNI IDENTIFIED BY tiger
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA 25M ON USERS
PROFILE DEFAULT
ACCOUNT UNLOCK
/

-- List all the users
SELECT USERNAME, PROFILE
FROM DBA_USERS
ORDER BY CREATED DESC
/

-- Assign new profile: PROFILE_RESOURCE_POLICY to user: SAFYOUNI using ALTER USER
ALTER USER SAFYOUNI
PROFILE PROFILE_RESOURCE_POLICY
/