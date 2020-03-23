readme for project 3

to get into MYSQL:

1) CD into Project3 Directory

2) connect to MYSQL with this command: mysql -h mysql1.cs.clemson.edu -u AntnPzDB_4nnj -p AntonPizzaDB_n3kq

3) Enter Password, password is: Onlineclass2020*

4) Change into proper DB with command(no semicolon):USE AntonPizzaDB_n3kq

SET FOREIGN_KEY_CHECKS=1; to turn on foreign key FOREIGN_KEY_CHECKS FUTURE: THIS STEP WAS FIXED BY ORDERING DROP TABLES TO AVOID ISSUES W FOREIGN KEYS

TODO:
1) Finish step 3 just the orders portion
2) add constraints to create tables?
3) (FUTURE: I CHOSE INTS)for arbitrary primary keys like Pizza_id what data type should we use INT / CHAR etc
   I'm assuming these will be just numbers so maybe change to int e.g.  Pizza_id -> 4251

   b) going of what i said above some things translated from the diagram aren't "clear"
      on what type they should be or what length so just look at that too.

5) connection string file for plis shouldn't be hard its in this readme
