CREATE TABLE PIZZA
  (Pizza_id       INT   NOT NULL,
  Timestamp_pizza VARCHAR(40) NOT NULL,
  Price           DECIMAL(4,2) NOT NULL,
  Cost_to_bus     DECIMAL(4,2) NOT NULL,
  Status          INT NOT NULL,
  Order_id        INT NOT NULL,
  Base_price_id   INT NOT NULL,
  CONSTRAINT PIZZAPK
    PRIMARY KEY(Pizza_id));
/*need to add 2x ALTER TABLE PIZZA ADD CONSTRAINT FKNAME for order id and base price id at very end*/

CREATE TABLE BASE_PRICE
  (Base_price_id  INT NOT NULL,
  Size            VARCHAR(30) NOT NULL,
  Crust_type      VARCHAR(30) NOT NULL,
  Price           DECIMAL(4,2) NOT NULL,
  Base_cost       DECIMAL(4,2) NOT NULL,
  CONSTRAINT BASE_PRICEPK
    PRIMARY KEY(Base_price_id));

CREATE TABLE TOPPINGS
  (Name          VARCHAR(40) NOT NULL,
  Price          DECIMAL(4,2) NOT NULL, /* might only need 3,2*/
  Cost_per_unit  DECIMAL(4,2) NOT NULL, /* same as above */
  Inventory      INT NOT NULL,
  Small          DECIMAL(3,2),/*NULL in any of these fields can mean we do not apply toppings to that particular size*/
  Medium         DECIMAL(3,2),
  Large          DECIMAL(3,2),
  XLarge         DECIMAL(3,2),
  CONSTRAINT TOPPINGPK
    PRIMARY KEY(Name));

CREATE TABLE PIZZA_CONTAINS_TOPPING
  (Pizza_id     INT NOT NULL,
  Topping_name  VARCHAR(40) NOT NULL,
  Extra_topping BOOLEAN NOT NULL DEFAULT FALSE, /*FALSE? was trying to find info on BOOLEAN data type i think this should work*/
  CONSTRAINT PIZ_CON_TOP_PK
    PRIMARY KEY(Pizza_id, Topping_name),
  CONSTRAINT PIZ_CON_TOP_PIZ_FK
    FOREIGN KEY(Pizza_id) REFERENCES PIZZA(Pizza_id)
    /*ON UPDATE CASCADE     ON DELETE CASCADE*/,
  CONSTRAINT PIZ_CON_TOP_NAME_FK
    FOREIGN KEY(Topping_name) REFERENCES TOPPINGS(Name)
    /*ON UPDATE CASCADE     ON DELETE CASCADE*/); /* add on update / on delete cascade?*/

CREATE TABLE CUSTOMER
  (Customer_id INT NOT NULL,
  Fname VARCHAR(20) NOT NULL,
  /*Mname VARCHAR(20),*/
  Lname VARCHAR(20) NOT NULL,
  Phone_num VARCHAR(10) NOT NULL,/*stores 10 numbers do we want to account for international code / dashes / parens?*/
  House_num INT, /* everything left can be null bc don't need it for a pickup*/
  Street_name VARCHAR(20),
  City VARCHAR(20),
  Zipcode CHAR(6), /*int?*/
  State CHAR(2),
  CONSTRAINT CUSTOMERPK
    PRIMARY KEY(Customer_id));

CREATE TABLE ORDER_
  (Order_id  INT NOT NULL,
  Total_cost_bus DECIMAL(5,2) NOT NULL, /*with 5,2 max is $999.99 should 6,2 ... 7,2 be used*/
  Total_cost_cust DECIMAL(5,2) NOT NULL,
  Dining_status INT NOT NULL, /*what should data type be*/
  CONSTRAINT ORDERPK
    PRIMARY KEY(Order_id));

CREATE TABLE DINE_IN
  (Order_id INT NOT NULL,
  Table_num INT NOT NULL,
  CONSTRAINT DINE_INPK
    PRIMARY KEY(Order_id),
  CONSTRAINT DINE_INFK
    FOREIGN KEY(Order_id) REFERENCES ORDER_(Order_id)
    /*ON UPDATE CASCADE     ON DELETE CASCADE*/);

CREATE TABLE SEATS
  (Order_id INT NOT NULL,
  Seat_nums INT NOT NULL,
  CONSTRAINT SEATSPK
    PRIMARY KEY (Order_id, Seat_nums),
  CONSTRAINT SEATSFK
    FOREIGN KEY(Order_id) REFERENCES DINE_IN(Order_id)
    ON UPDATE CASCADE     ON DELETE CASCADE);

CREATE TABLE PICKUP
  (Order_id INT NOT NULL,
  Cust_id   INT NOT NULL,
  CONSTRAINT PICKUPPK
    PRIMARY KEY(Order_id),
  CONSTRAINT PICKUPFK
  FOREIGN KEY(Cust_id) REFERENCES CUSTOMER(Customer_id)
  ON UPDATE CASCADE     ON DELETE CASCADE);

CREATE TABLE DELIVERY
  (Order_id INT NOT NULL,
  Cust_id   INT NOT NULL,
  CONSTRAINT DELIVERYPK
    PRIMARY KEY(Order_id),
  CONSTRAINT DELIVERYFK
  FOREIGN KEY(Cust_id) REFERENCES CUSTOMER(Customer_id)
  ON UPDATE CASCADE     ON DELETE CASCADE);

CREATE TABLE DISCOUNT
  (Discount_id INT NOT NULL,
  Name         VARCHAR(40) NOT NULL,
  CONSTRAINT DISCOUNTPK
    PRIMARY KEY(Discount_id));

-- possiby add a Name VARCHAR(20) field to percent / dollar
CREATE TABLE PERCENTAGE_DISCOUNT
  (Discount_id INT NOT NULL,
  Percent_off  Decimal(4,2) NOT NULL, -- change to int?
  CONSTRAINT PERCENTAGE_DISCOUNTPK
    PRIMARY KEY(Discount_id),
  CONSTRAINT PERCENTAGE_DISCOUNTFK
    FOREIGN KEY(Discount_id) REFERENCES DISCOUNT(Discount_id)
    /*ON UPDATE CASCADE     ON DELETE CASCADE*/);

CREATE TABLE DOLLAR_DISCOUNT
  (Discount_id INT NOT NULL,
  Amount_off   Decimal(4,2) NOT NULL, -- change to 3,2?
  CONSTRAINT DOLLAR_DISCOUNTPK
    PRIMARY KEY(Discount_id),
  CONSTRAINT DOLLAR_DISCOUNTFK
    FOREIGN KEY(Discount_id) REFERENCES DISCOUNT(Discount_id)
    /*ON UPDATE CASCADE     ON DELETE CASCADE*/);

CREATE TABLE ORDER_USE_DISCOUNT
  (Discount_id INT NOT NULL,
  Order_id     INT NOT NULL,
  CONSTRAINT ORDER_USE_DISCOUNTPK
    PRIMARY KEY(Discount_id, Order_id),
  CONSTRAINT ORDER_USE_DISCOUNT_DISFK
    FOREIGN KEY(Discount_id) REFERENCES DISCOUNT(Discount_id)
    /*ON UPDATE CASCADE     ON DELETE CASCADE*/,
  CONSTRAINT ORDER_USE_DISCOUNT_ORDFK
    FOREIGN KEY(Order_id) REFERENCES ORDER_(Order_id)
    /*ON UPDATE CASCADE     ON DELETE CASCADE*/);

CREATE TABLE PIZZA_USE_DISCOUNT
  (Discount_id INT NOT NULL,
  Pizza_id     INT NOT NULL,
  CONSTRAINT PIZZA_USE_DISCOUNTPK
    PRIMARY KEY(Discount_id, Pizza_id),
  CONSTRAINT PIZZA_USE_DISCOUNT_DISFK
    FOREIGN KEY(Discount_id) REFERENCES DISCOUNT(Discount_id)
    /*ON UPDATE CASCADE     ON DELETE CASCADE*/,
  CONSTRAINT PIZZA_USE_DISCOUNT_PIZZFK
    FOREIGN KEY(Pizza_id) REFERENCES PIZZA(Pizza_id)
    /*ON UPDATE CASCADE     ON DELETE CASCADE*/);


/* this is to add in the fk constraints for pizza as when its created
   the pks of order and base price do not yet exist to reference.
   I could make order and base price first i think to just add it in
   directly and remove the alter, but should work as is.*/
ALTER TABLE PIZZA ADD CONSTRAINT ORDERFK
  FOREIGN KEY(Order_id) REFERENCES ORDER_(Order_id)
  /*ON UPDATE CASCADE     ON DELETE CASCADE*/;

ALTER TABLE PIZZA ADD CONSTRAINT BASE_PRICEFK
  FOREIGN KEY(Base_price_id) REFERENCES BASE_PRICE(Base_price_id)
  /*ON UPDATE CASCADE     ON DELETE CASCADE*/;
