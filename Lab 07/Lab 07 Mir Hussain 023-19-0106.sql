show databases;
use lab7;

CREATE TABLE Sales_Master (
  Sales_no VARCHAR(6) PRIMARY KEY,
  Sal_name VARCHAR(20) NOT NULL,
  Address VARCHAR(30) NOT NULL,
  City VARCHAR(20) ,
  Pincode INT(6) ,
  State VARCHAR(20),
  Sal_amt INT(8) NOT NULL CHECK (Sal_amt > 0) ,
  Tgt_do_get INT(6) NOT NULL CHECK (Tgt_do_get > 0)  ,
  Ytd_sales INT(6) NOT NULL CHECK (Ytd_sales > 0),
  Remarks VARCHAR(30) NOT NULL
 );
 
 
 
INSERT INTO Sales_Master (Sales_no, Sal_name, Address, City, Pincode, State, Sal_amt, Tgt_do_get, Ytd_sales, Remarks) 
VALUES ("500001", "Kiran", "A/14 worli", "Bombay", 400002, "Mah", 3000, 100, 50, "Good"),
	   ("500002", "Manish", "65, na riman", "Bombay", 400001, "Mah", 3000, 200, 100, "Good"),
       ("500003", "Ravi", "P-7 Bandra", "Bombay", 400032, "Mah", 3000, 200, 100, "Good"),
       ("500004", "Ashish", "A/5 Juhu", "Bombay", 400044, "Mah", 3000, 200, 150, "Good");
       


