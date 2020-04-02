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

--for each order its either dine in and seats / pickup /  delivery not more than 1
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

--repeat this for each and every topping
INSERT INTO PIZZA_CONTAINS_TOPPING(Pizza_id, Topping_name, Extra_topping)
  VALUES( , '',);

--this is gross can we just combine address?
INSERT INTO CUSTOMER(Customer_id, Fname, Lname, Phone_num, House_num, Street_name, City, Zipcode, State)
  VALUES( , '', '', '', , '', '', '', '');

--either pizza use disc / or order use discount or none

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
