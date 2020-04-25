--Interface for Driver

/*
Can Insert into vehicles with their own driver_id, multiple times.
Can Insert into Driver, only once; into driver_acception, multiple times.
Can query Trips, Requests.
*/

--Dropping a view
DROP VIEW IF EXISTS pending_requests;

--Creating a view
CREATE OR REPLACE VIEW pending_requests AS
SELECT source, destination, departure_date, arrival_date, Num_Requests FROM 
(SELECT count(*) Num_Requests , r.t_id FROM Requests r, Trip t WHERE r.t_id=t.t_id
GROUP BY r.t_id) requests_per_trip, trip
WHERE trip.t_id=requests_per_trip.t_id ;


--Sequence of Driver-IDs
CREATE SEQUENCE driver_ids
MINVALUE 0
START WITH 0
MAXVALUE 999999999999999999999
INCREMENT BY 1
CACHE 20;

--Procedure to register a driver and get priveledges and views. 

CREATE OR REPLACE FUNCTION register_driver(driver_name IN VARCHAR, pass_word IN VARCHAR) RETURN NUMBER AS
sql_stmt VARCHAR2(200);
driver_id NUMBER;
new_view_name VARCHAR(50);
BEGIN
  
    sql_stmt := 'CREATE USER '||driver_name||' identified by '||pass_word;
  
    EXECUTE IMMEDIATE sql_stmt;
  
    sql_stmt := 'grant create session to '||driver_name;
  
    EXECUTE IMMEDIATE sql_stmt;
  
    driver_id := driver_ids.nextval;
    new_view_name := 'vehicle_'||driver_name;
    
    sql_stmt := 'CREATE VIEW '||new_view_name|| ' AS SELECT Model, Seats, reg_no FROM Vehicle WHERE(d_id='||driver_id||')';
  
    EXECUTE IMMEDIATE sql_stmt;
  
    sql_stmt := 'grant insert, update, select, delete on '||new_view_name||' to '||driver_name;  
    
    EXECUTE IMMEDIATE sql_stmt;
  
    sql_stmt := 'grant select on PENDING_REQUESTS to '||driver_name;
  
    EXECUTE IMMEDIATE sql_stmt;
    
    RETURN driver_id;

END register_driver;
/

/*
NOTES:-
1.) You can't use DDL statements without execute immediate
2.) You can do queries, updations, inserts on tables without using execute immediate and 
    directly use(in statements) the variables available in the scope. Binding vars are more efficient here.
3.) You can't use binding variables in DDL statements. 
*/