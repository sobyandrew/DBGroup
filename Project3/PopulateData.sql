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
