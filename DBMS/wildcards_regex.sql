/*To count number of payments done by card*/
SELECT count(*) FROM Payment WHERE payment_mode LIKE '%Card';

/*To mail all our customers in Green Park; 
  for example in case of Jam near Green Park*/
SELECT EMAIL_ID FROM Customer 
    WHERE AADDRESS LIKE '%Green Park%'; 

/*To select all customers named Amit or Akshit, 'i' to ignore case*/
SELECT * FROM Customer 
    WHERE REGEXP_LIKE(FIRST_NAME, 'A(ksh|m)it', 'i');
