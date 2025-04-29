-- Create a email.dat file in C:/loader with content
1,john.doe@example.com
2,jane.doe@example.com
3,peter.doe@example.com

-- Create a email.ctl file in C:/loader with content
load data into table SYS.EMAILS
insert
fields terminated by ","
(
EMAIL_ID,
EMAIL
)

-- Create a email.par file in C:/loader with content
userid=OT/tiger
control=email.ctl
log=email.log
bad=email.bad
data=email.dat
direct=true

-- RUN AS: SYS
-- Create user OT with password: tiger if it does not exist
CREATE USER OT IDENTIFIED BY tiger;
GRANT CREATE SESSION TO OT;

CREATE TABLE EMAILS(
    EMAIL_ID NUMBER PRIMARY KEY,
    EMAIL VARCHAR2(150) NOT NULL
);

GRANT SELECT, INSERT, UPDATE, DELETE ON EMAILS TO OT;

-- execute the email.par file located in C:/loader using sqlldr
cd C:/loader
sqlldr parfile=email.par 

-- RUN AS: SYS
SELECT * FROM EMAILS;