-- Scenario 1
-- RUN AS: DB_VPD
-- Policy function to add a predicate to the WHERE clause
CREATE OR REPLACE FUNCTION DB_VPD_ROW_OWNER_WHERE (
    p_schema IN VARCHAR2,
    p_table IN VARCHAR2
) RETURN VARCHAR2 AS
BEGIN
    RETURN 'CTL_UPD_USER = SYS_CONTEXT(''USERENV'', ''SESSION_USER'')';
END;
/

-- Add policy to enforce RLS (row level security)
BEGIN
    DBMS_RLS.ADD_POLICY(
        OBJECT_SCHEMA => 'DB_VPD', 
        OBJECT_NAME => 'CUSTOMERS', 
        POLICY_NAME => 'DB_VPD_ROW_OWNER_POLICY', 
        FUNCTION_SCHEMA => 'DB_VPD', 
        POLICY_FUNCTION => 'DB_VPD_ROW_OWNER_WHERE', 
        STATEMENT_TYPES => 'SELECT, UPDATE, DELETE', 
        ENABLE => TRUE);
END;
/

-- RUN AS: DB_VPD_CLERK1, DB_VPD_CLERK2, DB_VPD_CLERK3
SELECT COUNT(*) FROM DB_VPD.CUSTOMERS
/

-- RUN AS: DB_VPD
-- Disable the policy that enforces RLS(row level security)
BEGIN
    DBMS_RLS.ENABLE_POLICY(
        OBJECT_SCHEMA => 'DB_VPD',
        OBJECT_NAME => 'CUSTOMERS',
        POLICY_NAME => 'DB_VPD_ROW_OWNER_POLICY',
        ENABLE => FALSE
    );
END;