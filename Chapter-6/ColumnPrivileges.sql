-- RUN AS: DB_VPD
-- Create table: DB_VPD.TEST
CREATE TABLE DB_VPD.TEST (
    NUM NUMBER,
    TEXT VARCHAR2(20)
)
/

-- If user: DB_VPD_SCOTT doesn't exits, create user: DB_VPD_SCOTT
CREATE USER DB_VPD_SCOTT IDENTIFIED BY tiger;

-- Grant CREATE SESSION privilege to user: DB_VPD to connect to DB
GRANT CREATE SESSION TO DB_VPD_SCOTT;

-- Grant SELECT privilege on table: DB_VPD.TEST to user: DB_VPD_SCOTT
GRANT SELECT ON DB_VPD.TEST TO DB_VPD_SCOTT;
/

-- Grant UPDATE only on the column: TEXT in the table: DB_VPD.TEST to user: DB_VPD_SCOTT
GRANT UPDATE(TEXT) ON DB_VPD.TEST TO DB_VPD_SCOTT
/

-- Insert data in table: DB_VPD.TEST
INSERT INTO DB_VPD.TEST VALUES(1, 'LINE 1')
/

COMMIT
/

-- RUN AS: DB_VPD_SCOTT
-- List the data of table: DB_VPD.TEST
SELECT * FROM DB_VPD.TEST
/

-- Update the data of column: TEXT of table: DB_VPD.TEST
UPDATE DB_VPD.TEST SET TEXT = 'LINE 1 MOD BY SCOTT'
/

COMMIT
/

-- List the data of table: DB_VPD.TEST
SELECT * FROM DB_VPD.TEST
/

-- Try to update the data of column: NUM of table: DB_VPD.TEST
UPDATE DB_VPD.TEST SET NUM = 3
/