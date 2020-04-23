/*Schedule for deleting rows older than 1 year automatically every day.*/

CREATE OR REPLACE PROCEDURE delete_trips
AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Here');
        DELETE FROM trip y 
            WHERE sysdate > add_months(y.arrival_date,12);
    END;
/
BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
        job_name        => 'delete_old_rows',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'delete_trips;',
        start_date      => sysdate,
        repeat_interval => 'FREQ=DAILY',
        end_date        => add_months(sysdate,12*10),
        auto_drop       => FALSE,
        enabled         => TRUE
    );
END;
/