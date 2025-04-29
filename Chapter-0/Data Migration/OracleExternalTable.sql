-- Create a folder loader at C drive
-- i.e. C:\loader and put the languages.csv file in it 

-- RUN AS: SYS
-- Create a directory object
CREATE DIRECTORY lang_external AS 'C:\loader'; 

-- Create a user OT
CREATE USER OT IDENTIFIED BY tiger;
GRANT CREATE SESSION TO OT;

-- Grant READ and WRITE access on the directory object to users
GRANT READ, WRITE ON DIRECTORY lang_external TO OT;

-- Creating the external table
CREATE TABLE languages(
    language_id INT,
    language_name VARCHAR2(30)
)
ORGANIZATION EXTERNAL(
    TYPE oracle_loader
    DEFAULT DIRECTORY lang_external
    ACCESS PARAMETERS 
    (FIELDS TERMINATED BY ',')
    LOCATION ('languages.csv')
);

-- QUERY THE EXTERNAL TABLE
SELECT 
    language_id, 
    language_name 
FROM 
    languages
ORDER BY 
    language_name;