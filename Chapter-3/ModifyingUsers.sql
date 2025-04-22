-- RUN AS: SYS
-- Modify the user: DB_SEC
-- password: newtiger
-- quota: 25M on USERS
-- account lock
ALTER USER DB_SEC IDENTIFIED BY newtiger
QUOTA 25M ON USERS
ACCOUNT LOCK
/

-- Try to connect to DB with user: DB_SEC
-- It will show error as account is locked.

-- Modify the user: DB_SEC
-- account unlock
ALTER USER DB_SEC
ACCOUNT UNLOCK
/

-- Try to connect to DB with user: DB_SEC with new password: newtiger
-- You will connect successfully.