/*
To get customer and trip information of a payment

    Using INNER JOINS
    SELECT p.amount, p.payment_mode, c.email_id, c.phone_no, t.source, t.destination from Payment p INNER JOIN Customer c on c.c_id=p.c_id INNER JOIN Trip t on t.t_id=p.t_id;

    Using AND*/
    SELECT p.amount, p.payment_mode, c.email_id, 
           c.phone_no, t.source, t.destination 
           FROM Payment p, Customer c, Trip t 
           WHERE c.c_id=p.c_id and t.t_id=p.t_id;

/*To get all trips to MUMBAI or MADRAS

    Using OR*/
    SELECT * FROM Trip 
        WHERE DESTINATION='MUMBAI' OR DESTINATION='MADRAS';

/*To get all Requests that have been accepted

    Using NOT*/
    SELECT * FROM Requests WHERE driver_id is NOT NULL;
