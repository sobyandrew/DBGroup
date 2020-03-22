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
/*need to add ALTER TABLE PIZZA ADD CONSTRAINT FKNAME for order id and base price id at very end*/

CREATE TABLE BASE_PRICE
  (Base_price_id  VARCHAR(10) NOT NULL,
  Base_cost       DECIMAL(4,2),
  Size            INT,
  )
