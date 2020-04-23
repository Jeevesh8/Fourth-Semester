    --Modifies Schema to allow for more than 1 trip request by single customer
    --By making a new table having all custoomer Requests

    CREATE TABLE Requests(
        c_id int,
        t_id int,
        request_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        CONSTRAINT fk_from_requests_to_cust FOREIGN KEY(c_id)
            REFERENCES Customer(c_id)
            ON DELETE CASCADE,
        CONSTRAINT fk_from_requests_to_trip FOREIGN KEY(t_id)
            REFERENCES Trip(t_id)
            ON DELETE CASCADE
    ); 

    INSERT ALL
        INTO Requests(c_id, t_id) 
        VALUES(c_id, t_id)
    SELECT c_id, t_id FROM Customer;

    --INSERT INTO Requests(c_id, t_id) SELECT c_id,t_id FROM CUSTOMER;

    ALTER TABLE Customer DROP CONSTRAINT fk_from_customer_to_trip;
    ALTER TABLE Customer DROP COLUMN t_id;


    ALTER TABLE Driver Drop CONSTRAINT fk_from_driver_to_trip;

    UPDATE Driver
    SET Driver.t_id = (SELECT request_id FROM Requests 
                        WHERE Requests.t_id=Driver.t_id);

    ALTER TABLE Driver RENAME COLUMN t_id TO request_id;

    ALTER TABLE Driver ADD(
        CONSTRAINT fk_from_driver_to_Req FOREIGN KEY(request_id)
        REFERENCES Requests(request_id)
        ON DELETE CASCADE
    );
