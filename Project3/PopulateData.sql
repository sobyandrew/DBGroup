  /*
     Project 3 - CPSC 4620
     Blake Washburn
     Andrew Soby
  */

INSERT INTO TOPPING
  VALUES(1,'Pepperoni', 1.25, 0.2, 100, 2, 2.75, 3.5, 4.5);

INSERT INTO TOPPING
  VALUES(2,'Sausage', 1.25, 0.15, 100, 2.5, 3, 3.5, 4.25);

INSERT INTO TOPPING
  VALUES(3,'Ham', 1.5, 0.15, 78, 2, 2.5, 3.25, 4);

INSERT INTO TOPPING
  VALUES(4,'Chicken', 1.75, 0.25, 56, 1.5, 2, 2.25, 3);

INSERT INTO TOPPING
  VALUES(5,'Green Pepper', 0.5, 0.02, 79, 1, 1.5, 2, 2.5);

INSERT INTO TOPPING
  VALUES(6,'Onion', 0.5, 0.02, 85, 1, 1.5, 2, 2.75);

INSERT INTO TOPPING
  VALUES(7,'Roma tomato', 0.75, 0.03, 86, 2, 3, 3.5, 4.5);

INSERT INTO TOPPING
  VALUES(8,'Mushrooms', 0.75, 0.1, 52, 1.5, 2, 2.5, 3);

INSERT INTO TOPPING
  VALUES(9,'Black Olives', 0.6, 0.1, 39, 0.75, 1, 1.5, 2);

INSERT INTO TOPPING
  VALUES(10,'Pineapple', 1, 0.25, 15, 1, 1.25, 1.75, 2);

INSERT INTO TOPPING
  VALUES(11,'Jalapenos', 0.5, 0.05, 64, 0.5, 0.75, 1.25, 1.75);

INSERT INTO TOPPING
  VALUES(12,'Banana Peppers', 0.5, 0.05, 36, 0.6, 1, 1.3, 1.75);

INSERT INTO TOPPING
  VALUES(13,'Regular Cheese', 1.5, 0.12, 250, 2, 3.5, 5, 7);

INSERT INTO TOPPING
  VALUES(14,'Four Cheese Blend', 2, 0.15, 150, 2, 3.5, 5, 7);

INSERT INTO TOPPING
  VALUES(15,'Feta Cheese', 2, 0.18, 75, 1.75, 3, 4, 5.5);

INSERT INTO TOPPING
  VALUES(16,'Goat Cheese', 2, 0.2, 54, 1.6, 2.75, 4, 5.5);

INSERT INTO TOPPING
  VALUES(17,'Bacon', 1.5, 0.25, 89, 1, 1.5, 2, 3);


-- populate the discounts place into discount table then the appropriate percentage / dollar amount table

INSERT INTO DISCOUNT
  VALUES(1,'employee');

INSERT INTO PERCENTAGE_DISCOUNT
  VALUES(1,15);

INSERT INTO DISCOUNT
  VALUES(2,'Lunch Special Medium');

INSERT INTO DOLLAR_DISCOUNT
  VALUES(2,1);

INSERT INTO DISCOUNT
  VALUES(3,'Lunch Special Large');

INSERT INTO DOLLAR_DISCOUNT
  VALUES(3,2);

INSERT INTO DISCOUNT
  VALUES(4,'Specialty Pizza');

INSERT INTO DOLLAR_DISCOUNT
  VALUES(4,1.5);

INSERT INTO DISCOUNT
  VALUES(5,'Gameday Special');

INSERT INTO PERCENTAGE_DISCOUNT
  VALUES(5,20);

-- populate base prices

INSERT INTO BASE_PRICE
  VALUES(1, 'small', 'Thin', 3, 0.5);

INSERT INTO BASE_PRICE
  VALUES(2, 'small', 'Original', 3, 0.75);

INSERT INTO BASE_PRICE
  VALUES(3, 'small', 'Pan', 3.5, 1);

INSERT INTO BASE_PRICE
  VALUES(4, 'small', 'Gluten-Free', 4, 2);

INSERT INTO BASE_PRICE
  VALUES(5, 'medium', 'Thin', 5, 1);

INSERT INTO BASE_PRICE
  VALUES(6, 'medium', 'Original', 5, 1.5);

INSERT INTO BASE_PRICE
  VALUES(7, 'medium', 'Pan', 6, 2.25);

INSERT INTO BASE_PRICE
  VALUES(8, 'medium', 'Gluten-Free', 6.25, 3);

INSERT INTO BASE_PRICE
  VALUES(9, 'Large', 'Thin', 8, 1.25);

INSERT INTO BASE_PRICE
  VALUES(10, 'Large', 'Original', 8, 2);

INSERT INTO BASE_PRICE
  VALUES(11, 'Large', 'Pan', 9, 3);

INSERT INTO BASE_PRICE
  VALUES(12, 'Large', 'Gluten-Free', 9.5, 4);

INSERT INTO BASE_PRICE
  VALUES(13, 'X-Large', 'Thin', 10, 2);

INSERT INTO BASE_PRICE
  VALUES(14, 'X-Large', 'Original', 10, 3);

INSERT INTO BASE_PRICE
  VALUES(15, 'X-Large', 'Pan', 11.5, 4.5);

INSERT INTO BASE_PRICE
  VALUES(16, 'X-Large', 'Gluten-Free', 12.5, 6);

/*ORDER 1 BELOW*/
INSERT INTO ORDER_
  VALUES(1, 3.68, 13.50, 1);

INSERT INTO DINE_IN
  VALUES( 1, 14);

INSERT INTO SEATS
  VALUES( 1, 1);
INSERT INTO SEATS
  VALUES( 1, 2);
INSERT INTO SEATS
  VALUES( 1, 3);

INSERT INTO PIZZA
  VALUES(1, '2020-03-05 12:03:00', 13.50, 3.68, 1, 1, 9);

INSERT INTO PIZZA_CONTAINS_TOPPING
  VALUES( 1, 'Regular Cheese', TRUE);

INSERT INTO PIZZA_CONTAINS_TOPPING
  VALUES( 1, 'Pepperoni', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING
  VALUES( 1, 'Sausage', FALSE);

INSERT INTO PIZZA_USE_DISCOUNT
  VALUES( 3, 1);
/*END ORDER 1*/

/*ORDER 2*/
INSERT INTO ORDER_
  VALUES(2, 3.23, 10.60, 1);

INSERT INTO DINE_IN
  VALUES(2, 4);

INSERT INTO SEATS
  VALUES(2, 1);

INSERT INTO PIZZA
  VALUES(2, '2020-03-03 12:05:00', 10.60, 3.23, 1, 2, 7);

INSERT INTO PIZZA_CONTAINS_TOPPING
  VALUES( 2, 'Feta Cheese', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING
  VALUES( 2, 'Black Olives', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING
  VALUES( 2, 'Roma tomato', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING
  VALUES( 2, 'Mushrooms', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING
  VALUES( 2, 'Banana Peppers', FALSE);

INSERT INTO PIZZA_USE_DISCOUNT
  VALUES(2, 2);

INSERT INTO PIZZA_USE_DISCOUNT
  VALUES(4, 2);

/*second part of order*/

INSERT INTO ORDER_(Order_id, Total_cost_bus, Total_cost_cust, Dining_status)
  VALUES(3, 1.40, 6.75, 1);

INSERT INTO DINE_IN(Order_id, Table_num)
  VALUES(3, 4);

INSERT INTO SEATS(Order_id, Seat_nums)
  VALUES( 3, 2);

INSERT INTO PIZZA
  VALUES(3, '2020-03-03 12:05:00', 6.75, 1.40, 1, 3, 2);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 3, 'Regular Cheese', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 3, 'Chicken', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 3, 'Banana Peppers', FALSE);
/*End ORDER 2*/

/*Order 3 (3rd paragraph of orders)*/
INSERT INTO ORDER_(Order_id, Total_cost_bus, Total_cost_cust, Dining_status)
  VALUES(4, 19.80, 64.50, 2);

INSERT INTO CUSTOMER(Customer_id, Fname, Lname, Phone_num, Address)/*House_num, Street_name, City, Zipcode, State)*/
  VALUES( 1, 'Andrew', 'Wilkes-Krier', '8642545861', '115 Party Blvd, Anderson 29621, SC');

INSERT INTO PICKUP(Order_id, Cust_id)
  VALUES(4, 1);

INSERT INTO PIZZA
  VALUES(4, '2020-03-03 21:30:00', 10.75, 3.30, 0, 4, 10); /* change 0 to 1 just testing now*/

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 4, 'Regular Cheese', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 4, 'Pepperoni', FALSE);

INSERT INTO PIZZA
  VALUES(12, '2020-03-03 21:30:00', 10.75, 3.30, 1, 4, 10);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES(12, 'Regular Cheese', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES(12, 'Pepperoni', FALSE);

INSERT INTO PIZZA
  VALUES(13, '2020-03-03 21:30:00', 10.75, 3.30, 1, 4, 10);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES(13, 'Regular Cheese', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES(13, 'Pepperoni', FALSE);

INSERT INTO PIZZA
  VALUES(14, '2020-03-03 21:30:00', 10.75, 3.30, 1, 4, 10);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES(14, 'Regular Cheese', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES(14, 'Pepperoni', FALSE);

INSERT INTO PIZZA
  VALUES(15, '2020-03-03 21:30:00', 10.75, 3.30, 1, 4, 10);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES(15, 'Regular Cheese', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES(15, 'Pepperoni', FALSE);

INSERT INTO PIZZA
  VALUES(16, '2020-03-03 21:30:00', 10.75, 3.30, 1, 4, 10);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES(16, 'Regular Cheese', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES(16, 'Pepperoni', FALSE);
/*End ORDER 3*/

/*Start Order 4*/
INSERT INTO ORDER_(Order_id, Total_cost_bus, Total_cost_cust, Dining_status)
  VALUES(5, 16.86, 45.50, 3);

INSERT INTO DELIVERY(Order_id, Cust_id)
  VALUES(5, 1);

INSERT INTO PIZZA
  VALUES(5, '2020-03-05 19:11:00', 14.50, 5.59, 1, 5, 14);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 5, 'Pepperoni', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 5, 'Sausage', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 5, 'Four Cheese Blend', FALSE);

INSERT INTO PIZZA(Pizza_id, Timestamp_pizza, Price, Cost_to_bus, Status, Order_id, Base_price_id)
  VALUES(6, '2020-03-05 19:11:00', 17.00, 5.59, 1, 5, 14);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 6, 'Ham', TRUE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 6, 'Pineapple', TRUE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 6, 'Four Cheese Blend', FALSE);

INSERT INTO PIZZA(Pizza_id, Timestamp_pizza, Price, Cost_to_bus, Status, Order_id, Base_price_id)
  VALUES(7, '2020-03-05 19:11:00', 14.00, 5.68, 1, 5, 14);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 7, 'Jalapenos', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 7, 'Bacon', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 7, 'Four Cheese Blend', FALSE);

INSERT INTO PIZZA_USE_DISCOUNT(Discount_id, Pizza_id)
  VALUES( 4, 6);

INSERT INTO ORDER_USE_DISCOUNT(Discount_id, Order_id)
  VALUES( 5, 5);
/*End Order 4*/

/*Order 5 */
INSERT INTO ORDER_(Order_id, Total_cost_bus, Total_cost_cust, Dining_status)
  VALUES(6, 7.85, 16.85, 2);

INSERT INTO CUSTOMER(Customer_id, Fname, Lname, Phone_num, Address) /*House_num, Street_name, City, Zipcode, State)*/
  VALUES( 2, 'Matt', 'Engers', '8644749953', NULL);

INSERT INTO PICKUP(Order_id, Cust_id)
  VALUES(6, 2);

INSERT INTO PIZZA
  VALUES(8, '2020-03-02 17:30:00', 16.85, 7.85, 1, 6, 16);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 8, 'Green Pepper', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 8, 'Onion', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 8, 'Roma tomato', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 8, 'Mushrooms', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 8, 'Black Olives', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 8, 'Goat Cheese', FALSE);

INSERT INTO PIZZA_USE_DISCOUNT(Discount_id, Pizza_id)
  VALUES(4, 8);
/*End Order 5*/

/*Order 6*/
INSERT INTO ORDER_(Order_id, Total_cost_bus, Total_cost_cust, Dining_status)
  VALUES(7, 3.20, 13.25, 3);

INSERT INTO CUSTOMER(Customer_id, Fname, Lname, Phone_num, Address) /*House_num, Street_name, City, Zipcode, State)*/
  VALUES(3, 'Frank', 'Turner', '8642328944', '6745 Wessex St, Anderson 29621, SC');

INSERT INTO DELIVERY(Order_id, Cust_id)
  VALUES(7, 3);

INSERT INTO PIZZA(Pizza_id, Timestamp_pizza, Price, Cost_to_bus, Status, Order_id, Base_price_id)
  VALUES(9, '2020-03-02 18:17:00', 13.25, 3.20, 1, 7, 9);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 9, 'Chicken', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 9, 'Green Pepper', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 9, 'Onion', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 9, 'Mushrooms', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 9, 'Four Cheese Blend', FALSE);
/*End Order 6*/

/*Order 7*/
INSERT INTO ORDER_(Order_id, Total_cost_bus, Total_cost_cust, Dining_status)
  VALUES(8, 6.30, 24.00, 3);

INSERT INTO CUSTOMER(Customer_id, Fname, Lname, Phone_num, Address) /*House_num, Street_name, City, Zipcode, State)*/
  VALUES( 4, 'Milo', 'Auckerman', '8648785679', '8879 Suburban Home, Anderson 29621, SC');

INSERT INTO DELIVERY(Order_id, Cust_id)
  VALUES(8, 4);

INSERT INTO PIZZA
  VALUES( 10, '2020-03-06 20:32:00', 12, 3.75, 1, 8, 9);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 10, 'Four Cheese Blend', TRUE);

INSERT INTO PIZZA
  VALUES( 11, '2020-03-06 20:32:00', 12, 2.55, 1, 8, 9);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 11, 'Regular Cheese', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 11, 'Pepperoni', TRUE);

INSERT INTO ORDER_USE_DISCOUNT(Discount_id, Order_id)
  VALUES( 1, 8);
/*End Order 7*/
