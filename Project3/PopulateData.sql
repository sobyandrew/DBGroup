  -- populating the toppings tables

  /* template for copy paste
INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('', , , , , , , );
     */

INSERT INTO TOPPINGS
  VALUES('Pepperoni', 1.25, 0.2, 100, 2, 2.75, 3.5, 4.5);

INSERT INTO TOPPINGS
  VALUES('Sausage', 1.25, 0.15, 100, 2.5, 3, 3.5, 4.25);

INSERT INTO TOPPINGS
  VALUES('Ham', 1.5, 0.15, 78, 2, 2.5, 3.25, 4);

INSERT INTO TOPPINGS
  VALUES('Chicken', 1.75, 0.25, 56, 1.5, 2, 2.25, 3);

INSERT INTO TOPPINGS
  VALUES('Green Pepper', 0.5, 0.02, 79, 1, 1.5, 2, 2.5);

INSERT INTO TOPPINGS
  VALUES('Onion', 0.5, 0.02, 85, 1, 1.5, 2, 2.75);

INSERT INTO TOPPINGS
  VALUES('Roma tomato', 0.75, 0.03, 86, 2, 3, 3.5, 4.5);

INSERT INTO TOPPINGS
  VALUES('Mushrooms', 0.75, 0.1, 52, 1.5, 2, 2.5, 3);

INSERT INTO TOPPINGS
  VALUES('Black Olives', 0.6, 0.1, 39, 0.75, 1, 1.5, 2);

INSERT INTO TOPPINGS
  VALUES('Pineapple', 1, 0.25, 15, 1, 1.25, 1.75, 2);

INSERT INTO TOPPINGS
  VALUES('Jalapenos', 0.5, 0.05, 64, 0.5, 0.75, 1.25, 1.75);

INSERT INTO TOPPINGS
  VALUES('Banana Peppers', 0.5, 0.05, 36, 0.6, 1, 1.3, 1.75);

INSERT INTO TOPPINGS
  VALUES('Regular Cheese', 1.5, 0.12, 250, 2, 3.5, 5, 7);

INSERT INTO TOPPINGS
  VALUES('Four Cheese Blend', 2, 0.15, 150, 2, 3.5, 5, 7);

INSERT INTO TOPPINGS
  VALUES('Feta Cheese', 2, 0.18, 75, 1.75, 3, 4, 5.5);

INSERT INTO TOPPINGS
  VALUES('Goat Cheese', 2, 0.2, 54, 1.6, 2.75, 4, 5.5);

INSERT INTO TOPPINGS
  VALUES('Bacon', 1.5, 0.25, 89, 1, 1.5, 2, 3);


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

/*template to copy FROM
INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(, '', '', , );
*/
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

/* template for each order with all the required changes in DB tables
--toppings, discounts, base_price done so can refer to these tables
-- finish populating the orders this is what needs to be added into db for each order
INSERT INTO ORDER_(Order_id, Total_cost_bus, Total_cost_cust, Dining_status)
  VALUES(, , , );

INSERT INTO CUSTOMER(Customer_id, Fname, Lname, Phone_num, House_num, Street_name, City, Zipcode, State)
  VALUES( , '', '', '', , '', '', '', '');

INSERT INTO DINE_IN(Order_id, Table_num)
  VALUES( , );

INSERT INTO SEATS(Order_id, Seat_nums)
  VALUES( , );

INSERT INTO PICKUP(Order_id, Cust_id)
  VALUES( , );

INSERT INTO DELIVERY(Order_id, Cust_id)
  VALUES( , );

INSERT INTO PIZZA(Pizza_id, Timestamp_pizza, Price, Cost_to_bus, Status, Order_id, Base_price_id)
  VALUES( , '', , , , , );

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( , '',);

INSERT INTO PIZZA_USE_DISCOUNT(Discount_id, Pizza_id)
  VALUES( , );

INSERT INTO ORDER_USE_DISCOUNT(Discount_id, Order_id)
  VALUES( , );

--end all things that need to be added into db for each order
*/
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
  VALUES(1, 'March 5th at 12:03PM', 13.50, 3.68, 1, 1, 9);

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
  VALUES(2, 'March 3rd at 12:05PM', 10.60, 3.23, 1, 2, 7);

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
  VALUES(3, 'March 3rd at 12:05PM', 6.75, 1.40, 1, 3, 2);

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

INSERT INTO CUSTOMER(Customer_id, Fname, Lname, Phone_num, House_num, Street_name, City, Zipcode, State)
  VALUES( 1, 'Andrew', 'Wilkes-Krier', '8642545861', NULL, NULL, NULL, NULL, NULL);

INSERT INTO PICKUP(Order_id, Cust_id)
  VALUES(4, 1);


INSERT INTO PIZZA
  VALUES(4, 'March 3rd at 9:30PM', 10.75, 3.30, 1, 4, 10);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 4, 'Regular Cheese', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 4, 'Pepperoni', FALSE);
/* should we add his address or update it later? hes the next order again
--this is gross can we just combine address?
INSERT INTO CUSTOMER(Customer_id, Fname, Lname, Phone_num, House_num, Street_name, City, Zipcode, State)
  VALUES( 1, 'Andrew', 'Wilkes-Krier', '8642545861', 115, 'Party Blvd', 'Anderson', '29621', 'SC');
*/


/*End ORDER 3*/

/*Start Order 4*/
INSERT INTO ORDER_(Order_id, Total_cost_bus, Total_cost_cust, Dining_status)
  VALUES(5, 16.86, 45.50, 3);


INSERT INTO DELIVERY(Order_id, Cust_id)
  VALUES(5, 1); /*might need to update his address*/

INSERT INTO PIZZA
  VALUES(5, 'March 5th at 7:11PM', 14.50, 5.59, 1, 5, 14);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 5, 'Pepperoni', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 5, 'Sausage', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 5, 'Four Cheese Blend', FALSE);

INSERT INTO PIZZA(Pizza_id, Timestamp_pizza, Price, Cost_to_bus, Status, Order_id, Base_price_id)
  VALUES(6, 'March 5th at 7:11PM', 17.00, 5.59, 1, 5, 14);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 6, 'Ham', TRUE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 6, 'Pineapple', TRUE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 6, 'Four Cheese Blend', FALSE);

INSERT INTO PIZZA(Pizza_id, Timestamp_pizza, Price, Cost_to_bus, Status, Order_id, Base_price_id)
  VALUES(7, 'March 5th at 7:11PM', 14.00, 5.68, 1, 5, 14);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 7, 'Jalapenos', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 7, 'Bacon', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 7, 'Four Cheese Blend', FALSE);

/*use his previous customer, maybe update or just add his addres originally?
--this is gross can we just combine address?
INSERT INTO CUSTOMER(Customer_id, Fname, Lname, Phone_num, House_num, Street_name, City, Zipcode, State)
  VALUES( , '', '', '', , '', '', '', '');*/



INSERT INTO PIZZA_USE_DISCOUNT(Discount_id, Pizza_id)
  VALUES( 4, 6);

INSERT INTO ORDER_USE_DISCOUNT(Discount_id, Order_id)
  VALUES( 5, 5);

/*End Order 4*/

/*Order 5 */

INSERT INTO ORDER_(Order_id, Total_cost_bus, Total_cost_cust, Dining_status)
  VALUES(6, 7.85, 16.85, 2);

INSERT INTO CUSTOMER(Customer_id, Fname, Lname, Phone_num, House_num, Street_name, City, Zipcode, State)
  VALUES( 2, 'Matt', 'Engers', '8644749953', NULL, NULL, NULL, NULL, NULL);

INSERT INTO PICKUP(Order_id, Cust_id)
  VALUES(6, 2);

INSERT INTO PIZZA
  VALUES(8, 'March 2nd at 5:30PM', 16.85, 7.85, 1, 6, 16);


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

INSERT INTO CUSTOMER(Customer_id, Fname, Lname, Phone_num, House_num, Street_name, City, Zipcode, State)
  VALUES(3, 'Frank', 'Turner', '8642328944', 6745, 'Wessex St', 'Anderson', '29621', 'SC');

INSERT INTO DELIVERY(Order_id, Cust_id)
  VALUES(7, 3);

INSERT INTO PIZZA(Pizza_id, Timestamp_pizza, Price, Cost_to_bus, Status, Order_id, Base_price_id)
  VALUES(9, 'March 2nd 6:17PM', 13.25, 3.20, 1, 7, 9);

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

INSERT INTO CUSTOMER(Customer_id, Fname, Lname, Phone_num, House_num, Street_name, City, Zipcode, State)
  VALUES( 4, 'Milo', 'Auckerman', '8648785679', 8879, 'Suburban Home', 'Anderson', '29621', 'SC');

INSERT INTO DELIVERY(Order_id, Cust_id)
  VALUES(8, 4);

INSERT INTO PIZZA
  VALUES( 10, 'March 6th at 8:32PM', 12, 3.75, 1, 8, 9);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 10, 'Four Cheese Blend', TRUE);

INSERT INTO PIZZA
  VALUES( 11, 'March 6th at 8:32PM', 12, 2.55, 1, 8, 9);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 11, 'Regular Cheese', FALSE);

INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( 11, 'Pepperoni', TRUE);


INSERT INTO ORDER_USE_DISCOUNT(Discount_id, Order_id)
  VALUES( 1, 8);

/*End Order 7*/
