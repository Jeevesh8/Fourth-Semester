CREATE TABLE Customer(
    c_id int PRIMARY KEY,
    phone_no NUMBER(10),
    aaddress VARCHAR(100),
    email_id VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);


CREATE TABLE Trip(
    source VARCHAR(40),
    destination VARCHAR(40),
    t_id int PRIMARY KEY,
    departure_date DATE,
    arrival_date DATE
);

CREATE TABLE Payment(
    amount NUMBER(10),
    p_id int PRIMARY KEY,
    payment_mode VARCHAR(50),
    c_id int NOT NULL,
    t_id int NOT NULL,
    CONSTRAINT fk_from_pay_to_trip FOREIGN KEY(t_id) 
        REFERENCES Trip(t_id)
        ON DELETE CASCADE,
        /*ON UPDATE CASCADE, Doesn't Work in Oracle*/
    CONSTRAINT fk_from_pay_to_cust FOREIGN KEY(c_id) 
        REFERENCES Customer(c_id)
        ON DELETE CASCADE
        /*ON UPDATE CASCADE, Doesn't Work in Oracle*/
);

CREATE TABLE Driver(
    driver_id int PRIMARY KEY,
    Rating NUMBER(1,1),
    aaddress VARCHAR(100),
    phone_no NUMBER(10),
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    t_id int,
    CONSTRAINT rating_constraint CHECK (Rating>=0 AND Rating<=5),
    CONSTRAINT fk_from_driver_to_trip FOREIGN KEY(t_id)
        REFERENCES Trip(t_id)
        ON DELETE CASCADE
        /*ON UPDATE CASCADE, Doesn't Work in Oracle*/
);

CREATE TABLE Vehicle(
    Model VARCHAR(50),
    Seats int NOT NULL,
    reg_no int NOT NULL,
    vehicle_id int PRIMARY KEY,
    d_id int NOT NULL,
    CONSTRAINT fk_from_vehicle_to_driver FOREIGN KEY(d_id)
        REFERENCES Driver(driver_id)
        ON DELETE CASCADE
        /*ON UPDATE CASCADE, Doesn't Work in Oracle*/
);

ALTER TABLE Customer ADD(
    t_id int NOT NULL,
    CONSTRAINT fk_from_customer_to_trip FOREIGN KEY(t_id)
        REFERENCES Trip(t_id)
        ON DELETE CASCADE
        /*ON UPDATE CASCADE, Doesn't Work in Oracle*/
);

/*Names can't begin with _ 
'mode' is a keyword. */
