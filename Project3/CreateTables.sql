CREATE TABLE PIZZA
  (Pizza_id       VARCHAR(10)   NOT NULL,
  Timestamp_pizza VARCHAR(8),
  Price           DECIMAL(4,2),
  Cost_to_bus     DECIMAL(4,2),
  Status          INT,
  Order_id        VARCHAR(10),
  Base_price_id   VARCHAR(10),
  CONSTRAINT PIZZAPK
    PRIMARY KEY(Pizza_id));
/*need to add 2x ALTER TABLE PIZZA ADD CONSTRAINT FKNAME for order id and base price id at very end*/

CREATE TABLE BASE_PRICE
  (Base_price_id  VARCHAR(10) NOT NULL,
  Base_cost       DECIMAL(4,2),
  Size            INT,
  Crust_type      VARCHAR(15),
  Price           DECIMAL(4,2),
  CONSTRAINT BASE_PRICEPK
    PRIMARY KEY(Base_price_id));

CREATE TABLE TOPPINGS
  (Name          VARCHAR(15) NOT NULL,
  Price_to_cust  DECIMAL(4,2), /* might only need 3,2*/
  Price_to_bus   DECIMAL(4,2), /* same as above */
  Small_amnt     INT,
  Medium_amnt    INT,
  Large_amnt     INT,
  XLarge_amnt    INT,
  CONSTRAINT TOPPINGPK
    PRIMARY KEY(Name));

CREATE TABLE PIZZA_CONTAINS_TOPPING
  (Pizza_id     VARCHAR(10) NOT NULL,
  Topping_name  VARCHAR(15) NOT NULL,
  Extra_topping BOOLEAN DEFAULT 0, /*FALSE? was trying to find info on BOOLEAN data type i think this should work*/
  CONSTRAINT PIZ_CON_TOP_PK
    PRIMARY KEY(Pizza_id, Topping_name),
  CONSTRAINT PIZ_CON_TOP_PIZ_FK
    FOREIGN KEY(Pizza_id) REFERENCES PIZZA(Pizza_id)
  CONSTRAINT PIZ_CON_TOP_NAME_FK
    FOREIGN KEY(Topping_name) REFERENCES TOPPINGS(Name)); /* add on update / on delete cascade?*/

CREATE TABLE CUSTOMER
  (Customer_id VARCHAR(15) NOT NULL,
  Fname VARCHAR(20),
  Mname VARCHAR(20),
  Lname VARCHAR(20),
  Phone_num VARCHAR(10),/*stores 10 numbers do we want to account for international code / dashes / parens?*/
  House_num INT,
  Street_name VARCHAR(20),
  City VARCHAR(20),
  Zipcode VARCHAR(6), /*int?*/
  /*finish zipcode part now*/
  
CREATE TABLE ORDER
  (Order_id  VARCHAR(10) NOT NULL,
  Total_cost_bus DECIMAL(5,2), /*with 5,2 max is $999.99 should 6,2 ... 7,2 be used*/
  Total_cost_cust DECIMAL(5,2),
  Dining_status BOOLEAN DEFAULT 0, /*what should data type be*/
  CONSTRAINT ORDERPK
    PRIMARY KEY(Order_id));

CREATE TABLE DINE_IN
  (Order_id VARCHAR NOT NULL,
  Table_num INT,
  CONSTRAINT DINE_INPK
    PRIMARY KEY(Order_id),
  CONSTRAINT DINE_INFK
    FOREIGN KEY(Order_id) REFERENCES ORDER(Order_id));

CREATE TABLE SEATS
  (Order_id VARCHAR NOT NULL,
  Seat_nums INT,
  CONSTRAINT SEATSPK
    PRIMARY KEY (Order_id, Seat_nums),
  CONSTRAINT SEATSFK
    FOREIGN KEY(Order_id) REFERENCES DINE_IN(Order_id));
