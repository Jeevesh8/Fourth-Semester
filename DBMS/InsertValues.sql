INSERT INTO Trip
VALUES('DELHI', 'MUMBAI', 0, '08-MAR-2020', '09-MAR-2020');

INSERT ALL
    INTO Trip
    VALUES('BANGALORE', 'COIMBATORE', 1, '08-MAR-2020', '08-MAR-2020')
    INTO Trip
    VALUES('KOLKATTA', 'MADRAS', 2, '08-MAR-2020', '10-MAR-2020')
    INTO Trip
    VALUES('AMRITSAR', 'SHANGHAI', 3, '08-MAR-2020', '12-MAR-2020')
    INTO Trip
    VALUES('DELHI', 'MADURAI', 4, '01-JAN-2019', '05-JAN-2019')
    
    INTO Customer
    VALUES(0,9205677801,'B-32, Green Park', 'sjsjs@gmail.com', 'Aman', 'Chauhan',2)
    INTO Customer
    VALUES(1,9205637801,'B-34, Green Park', 'sjs@gmail.com', 'Amit', 'Chauhan',3)
    INTO Customer
    VALUES(2,9105637801,'A-34, Green Park', 'vermajs@gmail.com', 'Amit', 'Verma',0)
    INTO Customer
    VALUES(3,9103637801,'A-33, Green Park', 'sharmajs@gmail.com', 'Amit', 'Sharma',1)
    INTO Customer
    VALUES(4,8203637801,'A-13, Green Park', 'sharma11js@gmail.com', 'Akshit', 'Sharma',4)
    
    INTO Driver
    VALUES(0,0.0,'A-35, Green Park', 9311061144, 'Suresh', 'Kumar', 2)
    INTO Driver
    VALUES(1,0.0,'AF-33, Green Park', 9311061244, 'Yogesh', 'Kumar', 0)
    INTO Driver
    VALUES(2,0.0,'AS-33, Green Park', 9313061144, 'Narendra', 'Kumar', 3)

    INTO Vehicle
    VALUES('K-2',4,123734534,0,1)
    INTO Vehicle
    VALUES('K-1',6,123734234,1,1)
    INTO Vehicle
    VALUES('K-0',4,113734534,2,0)
    INTO Vehicle
    VALUES('M-2',5,123774534,3,2)

    INTO Payment
    VALUES(6000, 63742, 'Debit Card', 1, 3)
    INTO Payment
    VALUES(8700, 63827, 'Credit Card', 2, 0)
    INTO Payment
    VALUES(9200, 63372, 'Cash', 0, 2)
    INTO Payment
    VALUES(9250, 23483, 'Cash', 4, 4)
SELECT * FROM dual ;
