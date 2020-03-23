/*test*/
INSERT INTO ORDER_(Order_ID, Total_cost_bus, Total_cost_cust, Dining_status)
  VALUES('123456789', 5.5, 4.4, 1);

  -- populating the toppings tables

  /* template for copy paste
INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('', , , , , , , );
     */

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Pepperoni', 1.25, 0.2, 100, 2, 2.75, 3.5, 4.5);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Sausage', 1.25, 0.15, 100, 2.5, 3, 3.5, 4.25);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Ham', 1.5, 0.15, 78, 2, 2.5, 3.25, 4);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Chicken', 1.75, 0.25, 56, 1.5, 2, 2.25, 3);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Green Pepper', 0.5, 0.02, 79, 1, 1.5, 2, 2.5);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Onion', 0.5, 0.02, 85, 1, 1.5, 2, 2.75);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Roma tomato', 0.75, 0.03, 86, 2, 3, 3.5, 4.5);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Mushrooms', 0.75, 0.1, 52, 1.5, 2, 2.5, 3);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Black Olives', 0.6, 0.1, 39, 0.75, 1, 1.5, 2);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Pineapple', 1, 0.25, 15, 1, 1.25, 1.75, 2);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Jalapenos', 0.5, 0.05, 64, 0.5, 0.75, 1.25, 1.75);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Banana Peppers', 0.5, 0.05, 36, 0.6, 1, 1.3, 1.75);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Regular Cheese', 1.5, 0.12, 250, 2, 3.5, 5, 7);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Four Cheese Blend', 2, 0.15, 150, 2, 3.5, 5, 7);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Feta Cheese', 2, 0.18, 75, 1.75, 3, 4, 5.5);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Goat Cheese', 2, 0.2, 54, 1.6, 2.75, 4, 5.5);

INSERT INTO TOPPINGS(Name, Price, Cost_per_unit, Inventory, Small, Medium, Large, XLarge)
  VALUES('Bacon', 1.5, 0.25, 89, 1, 1.5, 2, 3);


-- populate the discounts place into discount table then the appropriate percentage / dollar amount table

INSERT INTO DISCOUNT(Discount_id, Name)
  VALUES(1,'employee');

INSERT INTO PERCENTAGE_DISCOUNT(Discount_id,Percent_off)
  VALUES(1,15);

INSERT INTO DISCOUNT(Discount_id, Name)
  VALUES(2,'Lunch Special Medium');

INSERT INTO DOLLAR_DISCOUNT(Discount_id, Amount_off)
  VALUES(2,1);

INSERT INTO DISCOUNT(Discount_id, Name)
  VALUES(3,'Lunch Special Large');

INSERT INTO DOLLAR_DISCOUNT(Discount_id, Amount_off)
  VALUES(3,2);

INSERT INTO DISCOUNT(Discount_id, Name)
  VALUES(4,'Specialty Pizza');

INSERT INTO DOLLAR_DISCOUNT(Discount_id, Amount_off)
  VALUES(4,1.5);

INSERT INTO DISCOUNT(Discount_id, Name)
  VALUES(5,'Gameday Special');

INSERT INTO PERCENTAGE_DISCOUNT(Discount_id,Percent_off)
  VALUES(5,20);

-- populate base prices

/*template to copy FROM
INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(, '', '', , );
*/
INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(1, 'small', 'Thin', 3, 0.5);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(2, 'small', 'Original', 3, 0.75);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(3, 'small', 'Pan', 3.5, 1);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(4, 'small', 'Gluten-Free', 4, 2);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(5, 'medium', 'Thin', 5, 1);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(6, 'medium', 'Original', 5, 1.5);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(7, 'medium', 'Pan', 6, 2.25);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(8, 'medium', 'Gluten-Free', 6.25, 3);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(9, 'Large', 'Thin', 8, 1.25);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(10, 'Large', 'Original', 8, 2);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(11, 'Large', 'Pan', 9, 3);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(12, 'Large', 'Gluten-Free', 9.5, 4);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(13, 'X-Large', 'Thin', 10, 2);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(14, 'X-Large', 'Original', 10, 3);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(15, 'X-Large', 'Pan', 11.5, 4.5);

INSERT INTO BASE_PRICE(Base_price_id, Size, Crust_type, Price, Base_cost)
  VALUES(16, 'X-Large', 'Gluten-Free', 12.5, 6);


-- finish populating the orders
