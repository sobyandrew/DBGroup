package cpsc4620.antonspizza;

import java.io.*;
import java.sql.*;
import java.util.*;

/*
This file is where most of your code changes will occur
You will write the code to retrieve information from the database, or save information to the database

The class has several hard coded static variables used for the connection, you will need to change those to your connection information

This class also has static string variables for pickup, delivery and dine-in. If your database stores the strings differently (i.e "pick-up" vs "pickup") changing these static variables will ensure that the comparison is checking for the right string in other places in the program. You will also need to use these strings if you store this as boolean fields or an integer.


*/

/**
 * A utility class to help add and retrieve information from the database
 */

public final class DBNinja {
    //enter your user name here
    private static String user = "AntnPzDB_4nnj";
    //enter your password here
    private static String password = "Onlineclass2020*";
    //enter your database name here
    private static String database_name = "AntonPizzaDB_n3kq";
    //Do not change the port. 3306 is the default MySQL port
    private static String port = "3306";
    private static Connection conn;

    //Change these variables to however you record dine-in, pick-up and delivery, and sizes and crusts
    public final static String pickup = "pickup";
    public final static String delivery = "delivery";
    public final static String dine_in = "dine-in";

    public final static String size_s = "Small";
    public final static String size_m = "Medium";
    public final static String size_l = "Large";
    public final static String size_xl = "X-Large";

    public final static String crust_thin = "Thin";
    public final static String crust_orig = "Original";
    public final static String crust_pan = "Pan";
    public final static String crust_gf = "Gluten-Free";

    private static int currentCustID = 5;
    //private static int currentOrder = 9;
    //private static int currentPizza = 17;



    /**
     * This function will handle the connection to the database
     * @return true if the connection was successfully made
     * @throws SQLException
     * @throws IOException
     */
    private static boolean connect_to_db() throws SQLException, IOException
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e) {
            System.out.println ("Could not load the driver");

            System.out.println("Message     : " + e.getMessage());


            return false;
        }

        conn = DriverManager.getConnection("jdbc:mysql://mysql1.cs.clemson.edu:"+port+"/"+database_name, user, password);
        return true;
    }

    /**
     *
     * @param o order that needs to be saved to the database
     * @throws SQLException
     * @throws IOException
     * @requires o is not NULL. o's ID is -1, as it has not been assigned yet. The pizzas do not exist in the database
     *          yet, and the topping inventory will allow for these pizzas to be made
     * @ensures o will be assigned an id and added to the database, along with all of it's pizzas. Inventory levels
     *          will be updated appropriately
     */
    public static void addOrder(Order o) throws SQLException, IOException
    {
        connect_to_db();

		/* add code to add the order to the DB. Remember to add the pizzas and discounts as well, which will involve multiple tables. Customer should already exist. Toppings will need to be added to the pizzas.

		It may be beneficial to define more functions to add an individual pizza to a database, add a topping to a pizza, etc.

		Note: the order ID will be -1 and will need to be replaced to be a fitting primary key.

		You will also need to add timestamps to your pizzas/orders in your database. Those timestamps are not stored in this program, but you can get the current time before inserting into the database

		Remember, when a new order comes in the ingredient levels for the topping need to be adjusted accordingly. Remember to check for "extra" of a topping here as well.

		You do not need to check to see if you have the topping in stock before adding to a pizza. You can just let it go negative.
		*/
      //maybe call a select statement to get the orderId to start at using SELECT Order_id FROM ORDER_ ORDER BY Order_id DESC LIMIT 1; same with pizza id

      PreparedStatement getOrderNum = conn.prepareStatement("SELECT Order_id FROM ORDER_ ORDER BY Order_id DESC LIMIT 1");
      getOrderNum.clearParameters();

      ResultSet rsetOrder = getOrderNum.executeQuery();

      rsetOrder.next();
      int currentOrder = rsetOrder.getInt(1) + 1;
      System.out.println(currentOrder); // delete this line

      PreparedStatement getPizzaNum = conn.prepareStatement("SELECT Pizza_id FROM PIZZA ORDER BY PIZZA_id DESC LIMIT 1");
      getPizzaNum.clearParameters();

      ResultSet rsetPizza = getPizzaNum.executeQuery();

      rsetPizza.next();

      int currentPizza = rsetPizza.getInt(1) + 1;
       //get pizza from order and get discount
       PreparedStatement p = conn.prepareStatement("INSERT INTO ORDER_ VALUES(?, ?, ?, ?)");
       p.clearParameters();
       p.setInt(1, currentOrder);
       currentOrder++;
       p.setDouble(2, -1); // how do we calculate cost to business?
       p.setDouble(3, o.calcPrice());
       int orderStatus= 0;

       if(o.getType() == pickup){

         orderStatus = 2;
         p.setInt(4, orderStatus);
         int r = p.executeUpdate();
         PreparedStatement pPick = conn.prepareStatement("INSERT INTO PICKUP VALUES(?, ?)");
         pPick.clearParameters();
         pPick.setInt(1, currentOrder -1);
         pPick.setInt(2, (o.getCustomer()).getID());
         int rPick = pPick.executeUpdate();
         //insert into PICKUP(Order_id, Cust_id)

       }
       else if (o.getType() == dine_in){
         orderStatus = 1;
         p.setInt(4, orderStatus);
         int r = p.executeUpdate();
         //insert into dine_in and seats
         PreparedStatement pDine = conn.prepareStatement("INSERT INTO DINE_IN VALUES(?, ?)");
         pDine.clearParameters();
         pDine.setInt(1, currentOrder -1);
         pDine.setInt(2, ((DineInCustomer) (o.getCustomer())).getTableNum());
         int rDine = pDine.executeUpdate();

         List<Integer> seats = ((DineInCustomer) (o.getCustomer())).getSeats();
         for(int s : seats){
           PreparedStatement pSeats = conn.prepareStatement("INSERT INTO SEATS VALUES(?, ?)");
           pSeats.clearParameters();
           pSeats.setInt(1, currentOrder -1);
           pSeats.setInt(2, s);
           int rSeats = pSeats.executeUpdate();

         }
       }
       else
       {
         orderStatus = 3;
         p.setInt(4, orderStatus);
         int r = p.executeUpdate();
         //insert into Delivery(Order_id, Cust_id)
         PreparedStatement pDeliv = conn.prepareStatement("INSERT INTO DELIVERY VALUES(?, ?)");
         pDeliv.clearParameters();
         pDeliv.setInt(1, currentOrder -1);
         pDeliv.setInt(2, (o.getCustomer()).getID());
         int rDeliv = pDeliv.executeUpdate();
       }

       // p.setInt(4, orderStatus);
       // int r = p.executeUpdate();

       //need to adjust inventory levels and check for extra topping

       //add each pizza from order into db
       ArrayList<Pizza> pizzas = o.getPizzas();

       for(Pizza pz : pizzas)
       {
          PreparedStatement p2 = conn.prepareStatement("INSERT INTO PIZZA VALUES(?, ?, ?, ?, ?, ?, ?)");
          p2.clearParameters();
          p2.setInt(1, currentPizza);
          currentPizza++; //FIXME: gain global call fix this
          p2.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
          p2.setDouble(3, pz.calcPrice());
          p2.setDouble(4, 0.0);
          p2.setInt(5, 0); //not complete status
          p2.setInt(6,currentOrder - 1);
          //not done with prepared statement yet get baseID
          //used to calcualte the baseId real quick
          int crustBase = 0;
          int sizeBase = 0;
          String sizeForTop = "";
          //calc baseid
          if(pz.getCrust() == crust_thin){
            crustBase = 1;
          } else if(pz.getCrust() == crust_orig)
          {
            crustBase = 2;
          } else if(pz.getCrust() == crust_pan){
            crustBase = 3;
          } else {
            crustBase = 4;
          }
          //calc base id
          if(pz.getSize() == size_s){
            sizeBase = 0;
            sizeForTop  = "SELECT Small FROM TOPPING WHERE Name = ?";
          } else if(pz.getSize() == size_m){
            sizeBase = 1;
            sizeForTop  = "SELECT Medium FROM TOPPING WHERE Name = ?";
          } else if(pz.getSize() == size_l){
            sizeBase = 2;
            sizeForTop  = "SELECT Large FROM TOPPING WHERE Name = ?";
          } else{
            sizeBase = 3;
            sizeForTop  = "SELECT XLarge FROM TOPPING WHERE Name = ?";
          }

          p2.setInt(7, ((sizeBase*4) + crustBase));
          int r2 = p2.executeUpdate();

          //insert into PIZZA(ID, timestamp, price, cost, status, orderID, basePrice)
          System.out.println(pz.toString());
          ArrayList<Topping> toppings = pz.getToppings();
          for(Topping t : toppings)
          {
            //insert into PIZZA_CONTAINS_TOPPING(id, topping name, bool)
            PreparedStatement p3 = conn.prepareStatement("INSERT INTO PIZZA_CONTAINS_TOPPING VALUES(?, ?, ?)");
            p3.clearParameters();
            p3.setInt(1,currentPizza -1);
            p3.setString(2, t.getName());
            p3.setBoolean(3, t.getExtra());
            int r3 = p3.executeUpdate();
            //update the inventory in TOPPING WHERE Name = t.getName?

            //System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ before size for top");
            PreparedStatement pSize = conn.prepareStatement(sizeForTop);
            pSize.clearParameters();
          //  pSize.setString(1, sizeForTop);
            pSize.setString(1, t.getName());

  //System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ before size for top2");
            ResultSet pSizeSet = pSize.executeQuery();
            pSizeSet.next();
            //  System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ before size for top3");
            double inventChange = pSizeSet.getDouble(1);

            PreparedStatement p4 = conn.prepareStatement("UPDATE TOPPING SET Inventory = Inventory - ? WHERE Name = ?");
            p4.clearParameters();
            p4.setDouble(1, inventChange); //do i need to do a select statement and get the size of it pls no
            p4.setString(2, t.getName());
            int r4 = p4.executeUpdate();
          }

          //pizza discounts
          ArrayList<Discount> discounts = pz.getDiscounts();

          for(Discount d: discounts)
          {
          //insert into PIZZA_USE_DISCOUNT(Discount_id, Pizza_id)
            PreparedStatement p5 = conn.prepareStatement("INSERT INTO PIZZA_USE_DISCOUNT(?, ?)");
            p5.clearParameters();
            p5.setInt(1, d.getID());
            p5.setInt(2, currentPizza -1);
            int r5 = p5.executeUpdate();
          }

       }

       ArrayList<Discount> orderDisc = o.getDiscounts();

       for(Discount od : orderDisc){
         //insert into ORDER_USE_DISCOUNT(Discount_id, Order_id)
         PreparedStatement p6 = conn.prepareStatement("INSERT INTO ORDER_USE_DISCOUNT(?, ?)");
         p6.clearParameters();
         p6.setInt(1, od.getID());
         p6.setInt(2, currentPizza -1);
         int r6 = p6.executeUpdate();

       }

       //maybe need to add order discounts?

       conn.close();

    }

    /**
     *
     * @param c the new customer to add to the database
     * @throws SQLException
     * @throws IOException
     * @requires c is not null. C's ID is -1 and will need to be assigned
     * @ensures c is given an ID and added to the database
     */
    public static void addCustomer(ICustomer c) throws SQLException, IOException
    {
        connect_to_db();
		/*add code to add the customer to the DB.
		Note: the ID will be -1 and will need to be replaced to be a fitting primary key
		Note that the customer is an ICustomer data type, which means c could be a dine in, carryout or delivery customer
        */


        // Cast the customer and handle as appropriate
        if(c instanceof DeliveryCustomer){
          //INSERT INTO CUSTOMER(Customer_id, Fname, Lname, Phone_num, House_num, Street_name, City, Zipcode, State)
            //VALUES( 1, 'Andrew', 'Wilkes-Krier', '8642545861', 115, 'Party Blvd', 'Anderson', '29621', 'SC');
            DeliveryCustomer cust = (DeliveryCustomer) c;
            PreparedStatement p = conn.prepareStatement("INSERT INTO CUSTOMER VALUES(?,?, 'test', ?,?)");
            p.clearParameters();
            p.setInt(1, currentCustID); //FIXME: just did a private global var bad practice change?
            currentCustID++;
            p.setString(2, cust.getName());
            p.setString(3, cust.getPhone());
            p.setString(4, cust.getAddress());
            int r = p.executeUpdate();

            //DeliveryCustomer cust = (DeliveryCustomer) c;

        }else if(c instanceof DineOutCustomer){
            DineOutCustomer cust = (DineOutCustomer) c;
            PreparedStatement p = conn.prepareStatement("INSERT INTO CUSTOMER VALUES(?,?, 'test', ?, NULL)");
            p.clearParameters();
            p.setInt(1, currentCustID); //FIXME: just did a private global var bad practice change?
            currentCustID++;
            p.setString(2, cust.getName());
            p.setString(3, cust.getPhone());
            int r = p.executeUpdate();
        }


        //dont have dine in customer
        // }else if(c instanceof DineInCustomer){
        //     DineInCustomer cust = (DineInCustomer) c;

        //}


        conn.close();
    }

    /**
     *
     * @param o the order to mark as complete in the database
     * @throws SQLException
     * @throws IOException
     * @requires the order exists in the database
     * @ensures the order will be marked as complete
     */
    public static void CompleteOrder(Order o) throws SQLException, IOException
    {
        connect_to_db();
		/*add code to mark an order as complete in the DB. You may have a boolean field for this, or maybe a completed time timestamp. However you have it, */

        conn.close();
    }

    /**
     *
     * @param t the topping whose inventory is being replenished
     * @param toAdd the amount of inventory of t to add
     * @throws SQLException
     * @throws IOException
     * @requires t exists in the database and toAdd > 0
     * @ensures t's inventory level is increased by toAdd
     */
    public static void AddToInventory(Topping t, double toAdd) throws SQLException, IOException
    {
        connect_to_db();
		/*add code to add to the inventory level of T. This is not adding a new topping, it is adding a certain amount of stock for a topping. This would be used to show that an order was made to replenish the restaurants supply of pepperoni, etc*/
        //pretty sure this should add to inventory
        PreparedStatement p = conn.prepareStatement("UPDATE TOPPING SET Inventory = Inventory + ? WHERE ID = ?");
        p.clearParameters();
        p.setDouble(1,toAdd);
        p.setInt(2, t.getID());
        //need to try catch
        int r = p.executeUpdate();

        conn.close();
    }


    /*
        A function to get the list of toppings and their inventory levels. I have left this code "complete" as an example of how to use JDBC to get data from the database. This query will not work on your database if you have different field or table names, so it will need to be changed

        Also note, this is just getting the topping ids and then calling getTopping() to get the actual topping. You will need to complete this on your own

        You don't actually have to use and write the getTopping() function, but it can save some repeated code if the program were to expand, and it keeps the functions simpler, more elegant and easy to read. Breaking up the queries this way also keeps them simpler. I think it's a better way to do it, and many people in the industry would agree, but its a suggestion, not a requirement.
    */

    /**
     *
     * @return the List of all toppings in the database
     * @throws SQLException
     * @throws IOException
     * @ensures the returned list will include all toppings and accurate inventory levels
     */
    public static ArrayList<Topping> getInventory() throws SQLException, IOException
    {
        //start by connecting
        connect_to_db();
        ArrayList<Topping> ts = new ArrayList<Topping>();
        //create a string with out query, this one is an easy one

        // May need to replace the "Topping_ID" below with "Name" below as I think out database uses that as the primary key
        String query = "Select ID From TOPPING;";

        Statement stmt = conn.createStatement();
        try {
            ResultSet rset = stmt.executeQuery(query);
            //even if you only have one result, you still need to call ResultSet.next() to load the first tuple
            while(rset.next())
            {
					/*Use getInt, getDouble, getString to get the actual value. You can use the column number starting with 1, or use the column name as a string

					NOTE: You want to use rset.getInt() instead of Integer.parseInt(rset.getString()), not just because it's shorter, but because of the possible NULL values. A NUll would cause parseInt to fail

					If there is a possibility that it could return a NULL value you need to check to see if it was NULL. In this query we won't get nulls, so I didn't. If I was going to I would do:

					int ID = rset.getInt(1);
					if(rset.wasNull())
					{
						//set ID to what it should be for NULL, and whatever you need to do.
					}

					NOTE: you can't check for NULL until after you have read the value using one of the getters.

					*/
                int ID = rset.getInt(1);
                //Now I'm just passing my primary key to this function to get the topping itself individually
                ts.add(getTopping(ID));
            }
        }
        catch (SQLException e) {
            System.out.println("Error loading inventory");
            while (e != null) {
                System.out.println("Message     : " + e.getMessage());
                e = e.getNextException();
            }

            //don't leave your connection open!
            conn.close();
            return ts;
        }

        //end by closing the connection
        conn.close();
        return ts;
    }

    /**
     *
     * @return a list of all orders that are currently open in the kitchen
     * @throws SQLException
     * @throws IOException
     * @ensures all currently open orders will be included in the returned list.
     */
    public static ArrayList<Order> getCurrentOrders() throws SQLException, IOException
    {
        connect_to_db();

        ArrayList<Order> os = new ArrayList<Order>();
        Order addo = new Order(-1, null, "-1");
		/*add code to get a list of all open orders. Only return Orders that have not been completed. If any pizzas are not completed, then the order is open.*/
      //select orderID from Pizza Where Status == 0 (not complete)

        PreparedStatement p = conn.prepareStatement("SELECT PIZZA.Order_id, Dining_status FROM PIZZA JOIN ORDER_ ON PIZZA.Order_id = ORDER_.Order_id WHERE Status = ?"); // might add distinct
        p.clearParameters();
        p.setInt(1, 0); // setting status to 0 its not completed yet where 1 is completed

        ResultSet rset = p.executeQuery();

        // public Order(int i, ICustomer c, String type)
        // {
        //     ID = i;
        //     cust = c;
        //     order_type = type;
        //     pizzas = new ArrayList<Pizza>();
        //     discounts = new ArrayList<Discount>();
        // }
        while(rset.next())
        {
          //ICustomer cust;
          int order = rset.getInt(1);
          int dining = rset.getInt(2);
          String status ="";
          //this is needed to get the customer data
          if(dining == 1)
          {
            DineInCustomer cust = new DineInCustomer(1, null, 1);
            status = dine_in;
            //prepared statement for dine in cust
            addo = new Order(order, cust, status);
          }
          else if(dining == 2){

            DineOutCustomer cust = new DineOutCustomer(1, "test", "testphone");
            status = pickup;
            //prepared statement for pickupcus
            addo = new Order(order, cust, status);
          }
          else{
            DeliveryCustomer cust = new DeliveryCustomer(-1, "fname", "lname", "address");
            status = delivery;
            //prepared statement for deliverycust
            addo = new Order(order, cust, status);
          }
          // PreparedStatement p2 = conn.prepareStatement("SELECT * FROM ORDER WHERE Status = ?"); // might add distinct
          // p.clearParameters();
        //  add = new Order(order, cust, status);
          os.add(addo);
        }
        conn.close();
        return os;
    }

    /**
     *
     * @param size the pizza size
     * @param crust the type of crust
     * @return the base price for a pizza with that size and crust
     * @throws SQLException
     * @throws IOException
     * @requires size = size_s || size_m || size_l || size_xl AND crust = crust_thin || crust_orig || crust_pan || crust_gf
     * @ensures the base price for a pizza with that size and crust is returned
     */
    public static double getBasePrice(String size, String crust) throws SQLException, IOException
    {
        connect_to_db();
        double bp = 0.0;
        PreparedStatement p = conn.prepareStatement("SELECT Price FROM BASE_PRICE WHERE Size = ? AND Crust_type = ?"); // might add distinct
        p.clearParameters();
        p.setString(1, size);
        p.setString(2, crust);

        ResultSet rset = p.executeQuery();

        while(rset.next())
        {
          bp = rset.getDouble(1);
          System.out.println(bp);
        }

        //add code to get the base price for that size and crust pizza Depending on how you store size and crust in your database, you may have to do a conversion

        conn.close();
        return bp;
    }

    /**
     *
     * @return the list of all discounts in the database
     * @throws SQLException
     * @throws IOException
     * @ensures all discounts are included in the returned list
     */
    public static ArrayList<Discount> getDiscountList() throws SQLException, IOException
    {
        ArrayList<Discount> discs = new ArrayList<Discount>();
        connect_to_db();
        //add code to get a list of all discounts

        //two prepared statements joining discount + PERCENTAGE_DISCOUNT and discount + DOLLAR_DISCOUNT
        //first query
        PreparedStatement p = conn.prepareStatement("SELECT Name, Amount_off, DD.Discount_id FROM DOLLAR_DISCOUNT AS DD NATURAL JOIN DISCOUNT;"); // might add distinct
        p.clearParameters();

        ResultSet rset = p.executeQuery();

        while(rset.next())
        {
          String dName = rset.getString(1);
          double cash = rset.getDouble(2);
          int discID = rset.getInt(3);

          Discount cashDisc = new Discount(dName, 0.0, cash, discID);
          discs.add(cashDisc);
        }

        //second query
        PreparedStatement p2 = conn.prepareStatement("SELECT Name, Percent_off, PD.Discount_id FROM PERCENTAGE_DISCOUNT AS PD NATURAL JOIN DISCOUNT;"); // might add distinct
        p2.clearParameters();

        ResultSet rset2 = p2.executeQuery();

        while(rset2.next())
        {
          String dName2 = rset2.getString(1);
          double percent = rset2.getDouble(2);
          int discID2 = rset2.getInt(3);

          Discount percentDisc = new Discount(dName2, percent/100.0, 0.0, discID2);
          discs.add(percentDisc);
        }

        conn.close();
        return discs;
    }

    /**
     *
     * @return the list of all delivery and carry out customers
     * @throws SQLException
     * @throws IOException
     * @ensures the list contains all carryout and delivery customers in the database
     */
     //done this function
    public static ArrayList<ICustomer> getCustomerList() throws SQLException, IOException
    {
        ArrayList<ICustomer> custs = new ArrayList<ICustomer>();
        connect_to_db();
        //add code to get a list of all customers
        String query = "SELECT * FROM CUSTOMER";
        Statement stmt = conn.createStatement();
        try {
            ResultSet rset = stmt.executeQuery(query);
            //even if you only have one result, you still need to call ResultSet.next() to load the first tuple
            while(rset.next())
            {
                int custID = rset.getInt(1);
                String fName = rset.getString(2);
                String lName = rset.getString(3);
                String phoneNum = rset.getString(4);
                String address = rset.getString(5);
                DeliveryCustomer cust = new DeliveryCustomer(custID, (fName + " " + lName), phoneNum, address);
                // int houseNum = rset.getInt(5);
                // String streetName = rset.getString(6);
                // String city = rset.getString(7);
                // String zip = rset.getString(8);             // Should this be an int?
                // String state = rset.getString(9);

                custs.add(cust);
                /* Complile these into a customer object and add to ArrayList of customers. How do we cast this, because we dont know if the customer is dine in or carry out? */
            }
        }
        catch (SQLException e) {
            System.out.println("Error loading Topping");
            while (e != null) {
                System.out.println("Message     : " + e.getMessage());
                e = e.getNextException();
            }
            conn.close();
            return custs;
        }

        conn.close();
        return custs;
    }



	/*
	Note: The following incomplete functions are not strictly required, but could make your DBNinja class much simpler. For instance, instead of writing one query to get all of the information about an order, you can find the primary key of the order, and use that to find the primary keys of the pizzas on that order, then use the pizza primary keys individually to build your pizzas. We are no longer trying to get everything in one query, so feel free to break them up as much as possible

	You could also add functions that take in a Pizza object and add that to the database, or take in a pizza id and a topping id and add that topping to the pizza in the database, etc. I would recommend this to keep your addOrder function much simpler

	These simpler functions should still not be called from our menu class. That is why they are private

	We don't need to open and close the connection in these, since they are only called by a function that has opened the connection and will close it after
	*/


    private static Topping getTopping(int ID) throws SQLException, IOException
    {
        connect_to_db();
        //add code to get a topping
		//the java compiler on unix does not like that t could be null, so I created a fake topping that will be replaced
        Topping t = new Topping("fake", 0.25, 100.0, -1);
        String query = "Select Name, Price, Inventory From TOPPING where ID = " + ID + ";";
        /* ^ Not sure why we are not asking for more information, like what size topping we need to use */

        Statement stmt = conn.createStatement();
        try {
            ResultSet rset = stmt.executeQuery(query);
            //even if you only have one result, you still need to call ResultSet.next() to load the first tuple
            while(rset.next())
            {
					String tname = rset.getString(1);
					double price = rset.getDouble(2);
					double inv = rset.getDouble(3);

					t = new Topping(tname, price, inv, ID);
			}
		}
		catch (SQLException e) {
            System.out.println("Error loading Topping");
            while (e != null) {
                System.out.println("Message     : " + e.getMessage());
                e = e.getNextException();
            }
            conn.close();
            return t;
        }
        conn.close();
        return t;

    }

    /* The last three functions  originally didnt come with any parameters, so I added one. The funtions did not make since without a parameter like topping had */
    /* I dont think any of the following statement use Prepared Statements, and I think we need to use those */

    private static Discount getDiscount(int ID)  throws SQLException, IOException
    {
        // Create temporary fake discount
        connect_to_db();
        Discount D = new Discount("fake", 0.0, 0.0, 0);
        String query = "SELECT Discount_id, Name FROM DISCOUNT WHERE Discount_id = " + ID + ";";
        /* ^ Do we still need to select the discount_id in this statement? Also, how do we get information from its subclasses (percent_off and dollar amount off), should we do a cast kind of thing as in addCustomer? */

        Statement stmt = conn.createStatement();
        try {
            ResultSet rset = stmt.executeQuery(query);
            while(rset.next()) {
                int discountID = rset.getInt(1);
                String name = rset.getString(2);

              //  D = new Discount(discountID, name);
               D = new Discount(name, 1.0, 1.0, discountID);
            }
        }
        catch (SQLException e) {
            System.out.println("Error loading Discount");
            while (e != null) {
                System.out.println("Message     : " + e.getMessage());
                e = e.getNextException();
            }
            conn.close();
            return D;
        }
        conn.close();
        return D;
    }


    private static Pizza getPizza(int ID)  throws SQLException, IOException
    {
        //add code to get Pizza Remember, a Pizza has toppings and discounts on it
        connect_to_db();
        /* The nulls below are in place of ArrayLists, so they might cause errors */
        //Pizza P = new Pizza(1, "fake", "fake", null, null, 0.0);
        Pizza P = new Pizza(1, "fake", "fake", 0.0);
        String query = "SELECT * FROM PIZZA WHERE Pizza_id = " + ID + ";";

        Statement stmt = conn.createStatement();
        try {
            ResultSet rset = stmt.executeQuery(query);
            while(rset.next()) {
                int pizzaID = rset.getInt(1);
                String timestamp = rset.getString(2);       // What kind of object do we want to store a timestamp in? Or do we even need to?
                double price = rset.getDouble(3);
                double busCost = rset.getDouble(4);
                int status = rset.getInt(5);
                int orderID = rset.getInt(6);
                int basePriceID = rset.getInt(7);

                /* The database we have is different from what he has in Pizza.java, So i just included the attributes that are in Pizza.java */
                /* We need to get the crust and size of the pizza somehow, because its not in our database from Pizza */
                /* I think we also have to get the topping list and the discount list from the database somehow */

                //crust and size can be obtained from basePrice ID
                //P = new Pizza(pizzaID, "crust", "size", basePriceID);
            }
        }
        catch (SQLException e) {
            System.out.println("Error loading Pizza");
            while (e != null) {
                System.out.println("Message     : " + e.getMessage());
                e = e.getNextException();
            }
            conn.close();
            return P;
        }
        conn.close();
        return P;
    }


    private static ICustomer getCustomer(int ID)  throws SQLException, IOException
    {
        connect_to_db();
        //add code to get customer

        /* QUESTION: How do we know what type of customer we are going to get for casting before we do a search? I dont know what to set iCustomer = to before we run the query*/
        ICustomer C = new DeliveryCustomer(-1, "test","test", "test");
        String query = "SELECT * FROM CUSTOMER WHERE Customer_id = " + ID + ";";

        Statement stmt = conn.createStatement();
        try {
            ResultSet rset = stmt.executeQuery(query);
            while(rset.next()) {
                /* I dont really know what to put here */
                break;
                // C = ?
            }
        }
        catch (SQLException e) {
            System.out.println("Error running getCustomer");
            while (e != null) {
                System.out.println("Message     : " + e.getMessage());
                e = e.getNextException();
            }
            conn.close();
            return C;
        }
        conn.close();
        return C;
    }

    private static Order getOrder(int ID)  throws SQLException, IOException
    {
        connect_to_db();
        //add code to get an order. Remember, an order has pizzas, a customer, and discounts on it
        /* Below there are nulls for customer and Arraylists, so that might throw an error */
        //Order O = new Order(0, null, "fake", null, null);
        Order O = new Order(0, null, "fake");
        String query = "SELECT * FROM ORDER WHERE Order_id = " + ID + ";";

        Statement stmt = conn.createStatement();
        try {
            ResultSet rset = stmt.executeQuery(query);
            while(rset.next()) {
                int orderID = rset.getInt(1);
                double busCost = rset.getDouble(2);
                double custCost = rset.getDouble(3);
                int diningStatus = rset.getInt(4);
              }
                // O = new Order(...);      We need to get the ArrayLists and customer here before we can set O to a new order
        }
        catch (SQLException e) {
            System.out.println("Error running getCustomer");
            while (e != null) {
                System.out.println("Message     : " + e.getMessage());
                e = e.getNextException();
            }
            conn.close();
            return O;
        }
        conn.close();
        return O;
    }
}
