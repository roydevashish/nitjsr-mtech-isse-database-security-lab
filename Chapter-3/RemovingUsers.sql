-- RUN AS: SYS
-- Remove the user: DB_SEC
DROP USER DB_SEC;

-- If the user owns any objects.
DROP USER DB_SEC CASCADE;