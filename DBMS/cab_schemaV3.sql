--Modifying schema to allow drivers to accept multiple requests.
CREATE TABLE driver_acception(
    driver_id int,
    request_id int PRIMARY KEY,
    CONSTRAINT fk_from_accept_to_driver FOREIGN KEY(driver_id)
        REFERENCES Driver(driver_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_from_accept_to_request FOREIGN KEY(request_id)
        REFERENCES Requests(request_id)
        ON DELETE CASCADE
);

INSERT INTO driver_acception(driver_id, request_id) 
    SELECT driver_id, request_id FROM Driver;

ALTER TABLE Driver DROP CONSTRAINT fk_from_driver_to_Req;
ALTER TABLE Driver DROP COLUMN request_id;

/*
Customer can check driver of request via 
(customer_id, trip_id)->(request_id)->(driver_id)
If customer places request entry is made in Requests table
If driver accepts, entry is made in driver_acception table
*/

/*
SECOND-WAY
Extra column of driver assigned to request is added in Requests table.
*/

ALTER TABLE Driver DROP CONSTRAINT fk_from_driver_to_Req;

ALTER TABLE Requests ADD(
    driver_id int,
    CONSTRAINT fk_from_requests_to_driver FOREIGN KEY(driver_id)
        REFERENCES Driver(driver_id)
        ON DELETE CASCADE    
);

UPDATE Requests
SET Requests.driver_id = (SELECT driver_id FROM Driver 
                          WHERE Driver.request_id=Requests.request_id);

ALTER TABLE Driver DROP COLUMN request_id;
