create database R
use R

create table Restaurant_Info(
    Restaurant_Id varchar(8) PRIMARY KEY NOT NULL,
    Restaurant_Name varchar(20),
    Restaurant_Phone varchar(20),
	ResLocation varchar(30),
	Opening_Closing_Time varchar(30)
)
create table admin(
	Username varchar(20),
	Pass varchar(20),
	Restaurant_Id varchar(8), FOREIGN KEY (Restaurant_Id) REFERENCES Restaurant_Info(Restaurant_Id)
)

create table Customers(
    Customer_Id varchar(8) PRIMARY KEY NOT NULL,
	Restaurant_Id varchar(8), FOREIGN KEY (Restaurant_Id) REFERENCES Restaurant_Info(Restaurant_Id),
    Customer_Fname varchar(20),
	Customer_Lname varchar(20),
    Customer_Phone varchar(20),
	Email_Id varchar(30)
)

create table Orders(
    Order_Id varchar(8) PRIMARY KEY NOT NULL,
    Customer_ID VARCHAR(8), FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
	Customer_Fname VARCHAR(20),
	No_of_Items int,
	descriptions varchar(100),
	Created_At TIME(6),
	Order_Status varchar(7)
)
create table Bill(
	Bill_No varchar(8) PRIMARY KEY,
	Order_Id varchar(8), FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id),
	Customer_Fname varchar(20),
	Customer_Lname varchar(20) NOT NULL,
	Customer_Id varchar(8), FOREIGN KEY(Customer_Id) REFERENCES Customers (Customer_Id),
	Order_DTL varchar(30),
	Total_Amount varchar(10)
)
create table Waiter_Info(
	Waiter_Id varchar(6) PRIMARY KEY NOT NULL,
	Fname varchar(15) ,
	Lname varchar(15) NOT NULL,
	Contact varchar(20) NOT NULL,
 	Addrss varchar(30) DEFAULT NULL,
  	Salary varchar(30) DEFAULT NULL,
	Sex char(1) NULL,
	Bdate date NULL,
	Join_Date date NOT NULL
) 
create table Waiter(
    Waiter_Id varchar(6), FOREIGN KEY (Waiter_Id) REFERENCES Waiter_info(Waiter_Id),
    Fname varchar(20),
    Customer_ID varchar(8),
    FOREIGN KEY (Customer_ID) REFERENCES Customers (Customer_ID),
    Order_Id varchar(8),FOREIGN KEY (Order_Id) REFERENCES Orders (Order_Id)
)
CREATE TABLE Products(
  Prod_Id varchar(6) PRIMARY KEY NOT NULL,
  Prod_code varchar(20),
  Prod_name varchar(20) NOT NULL,
  Prod_image varchar(20) NOT NULL,
  Prod_desc varchar(100),
  Prod_price BigInt NOT NULL
)
--ok

CREATE TABLE Payment(
  Pay_id varchar(6) PRIMARY KEY NOT NULL,
  Pay_code varchar(20) NOT NULL,
  Order_code varchar(20) NOT NULL,
  Order_Id varchar(8), FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id),  
  Customer_Id VARCHAR(8), FOREIGN KEY (Customer_Id) REFERENCES Customers(Customer_Id),
  Pay_amount varchar(20) NOT NULL,
  Pay_method varchar(30) NOT NULL
) 
--ok
create table Supplier(
	Supp_Id varchar(8) PRIMARY KEY NOT NULL,
	Supp_Name varchar(8) NOT NULL,
	Addrss varchar(30) NOT NULL,
	Contact varchar(20) NOT NULL,
	Details varchar(200) DEFAULT NULL
) 
--ok
create table Ingredients(
	Ingredient_Id varchar(8) PRIMARY KEY NOT NULL ,
	IngName varchar(30) NOT NULL,
	Quantity varchar(15) NOT NULL,
	Descp varchar(100) DEFAULT NULL,
	Supp_Id varchar(8), FOREIGN KEY (Supp_Id) REFERENCES Supplier (Supp_Id),
	Supp_Name varchar(8)
)

create table Food(
    Food_Id varchar(8) PRIMARY KEY NOT NULL,
    Order_Id varchar(8), FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id),
    Quantity int,
    Descriptions varchar(100),
	Price int
)
--ok
create table Cook_Info (
	Cook_Id varchar(8) PRIMARY KEY NOT NULL ,
	Fname varchar(15) NOT NULL,
	Lname varchar(15) NOT NULL,
	Contact varchar(20) NOT NULL,
 	Addrss varchar(30) DEFAULT NULL,
  	Salary varchar(30) DEFAULT NULL,
	Sex char(1) DEFAULT NULL,
	Bdate date DEFAULT NULL,
	Join_Date date NOT NULL,
	Specialization varchar(50) DEFAULT NULL
)
create table Manager_info(
	Manager_Id varchar(6) PRIMARY KEY NOT NULL,
	fname varchar(15),
	lname varchar(15),
	Contact varchar(20),
 	Addres varchar(30),
  	Salary varchar(30),
	Sex char(1),
	B_date date ,
	Join_Date date
)
--ok
create table Cook(
    Cook_Id varchar(8), FOREIGN KEY (Cook_Id) REFERENCES Cook_Info (Cook_Id),
	Cook_Name varchar(20),
    Order_Id varchar(8), FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id)
)
--ok

create table order_Info(
	Order_Id varchar(8),FOREIGN KEY (Order_Id) REFERENCES Orders (Order_Id),
    No_Of_Items int,
    Order_Time TIME
)
--ok
create table Food_Info(
    Food_Id varchar(8), FOREIGN KEY (Food_Id) REFERENCES Food(Food_Id),
    Quantity int,
    Price varchar(8)
)
--ok
create table Bill_Info(
    Bill_No varchar(8), FOREIGN KEY (Bill_No) REFERENCES Bill(Bill_No),
    Price varchar(15) PRIMARY KEY
)
-- Insert sample data into Restaurant_Info table
INSERT INTO Restaurant_Info (Restaurant_Id, Restaurant_Name, Restaurant_Phone, Locatin, Opening_Closing_Time)
VALUES ('R001', 'Sample Restaurant', '123-456-7890', '123 Main St, City, Country', '08:00 AM - 10:00 PM');

-- Insert sample data into admin table
INSERT INTO admin (Username, Pass, Restaurant_Id)
VALUES ('admin1', 'password123', 'R001');

-- Insert sample data into Customers table
INSERT INTO Customers (Customer_Id, Restaurant_Id, Customer_Fname, Customer_Lname, Customer_Phone, Email_Id)
VALUES ('C002', 'R001', 'John', 'Doe', '987-654-3210', 'john.doe@example.com');

-- Insert sample data into Orders table
INSERT INTO Orders (Order_Id, Customer_ID, Customer_Fname, No_of_Items, descriptions, Created_At, Order_Status)
VALUES ('O002', 'C001', 'John', 2, 'Burger, Fries', '12:00:00', 'Pending');

-- Insert sample data into Bill table
INSERT INTO Bill (Bill_No, Order_Id, Customer_Fname, Customer_Lname, Customer_Id, Order_DTL, Total_Amount)
VALUES ('B004', 'O001', 'John', 'Doe', 'C001', 'Burger, Fries', '25.00');

-- Insert sample data into Supplier table
INSERT INTO Supplier (Supp_Id, Supp_Name, Addrss, Contact, Details)
VALUES ('S001', 'Sample Supplier', '456 Oak St, City, Country', '555-123-4567', 'Supplier of fresh ingredients');

-- Insert sample data into Ingredients table
INSERT INTO Ingredients (Ingredient_Id, Name, Quantity, Descp, Supp_Id, Supp_Name)
VALUES ('I001', 'Beef Patty', '10 lbs', 'Fresh beef patties', 'S001', 'Sample Supplier');

-- Insert sample data into Cook_Info table
INSERT INTO Cook_Info (Cook_Id, Fname, Lname, Contact, Addrss, Salary, Sex, Bdate, Join_Date, Specialization)
VALUES ('C003', 'Michael', 'Smith', '555-987-6543', '789 Pine St, City, Country', '3000', 'M', '1990-05-15', '2023-01-10', 'Grilling');

-- Insert sample data into Manager_info table
INSERT INTO Manager_info (Manager_Id, fname, lname, Contact, Addres, Salary, Sex, B_date, Join_Date)
VALUES ('M002', 'Emily', 'Johnson', '555-789-1234', '101 Maple Ave, City, Country', '5000', 'F', '1985-10-20', '2022-03-01');
SELECT tables

