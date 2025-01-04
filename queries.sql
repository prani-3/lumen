CREATE DATABASE InventoryManagement;
USE InventoryManagement;
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255),
    Description TEXT,
    ProductImage VARCHAR(255),
    ProductCategoryName VARCHAR(255),
    ModelNumber VARCHAR(50),
    SerialNumber VARCHAR(50),
    StockLevel INT,
    ReorderPoint INT,
    SupplierID INT,
    OrderDate DATE,
    Quantity INT,
    OrderStatus VARCHAR(50),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(255),
    SupplierEmail VARCHAR(255),
    SupplierContact VARCHAR(15)
);
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    OrderStatus VARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(255),
    Password VARCHAR(255),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Type VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(255)
);
INSERT INTO Suppliers (SupplierName, SupplierEmail, SupplierContact)
VALUES 
    ('Cisco', 'abcd@mail.com', '1234567890'),
    ('HP', 'abhp@mail.com', '1980762345'),
    ('Netgear', 'Neger@mail.com', '9256476541'),
    ('Broadcom', 'brcom@mail.com', '1759731673'),
    ('BELL', 'blee@mail.com', '1256476893');
INSERT INTO Products (ProductName, Description, ProductImage, ProductCategoryName, ModelNumber, SerialNumber, StockLevel, ReorderPoint, SupplierID, OrderDate, Quantity, OrderStatus)
VALUES 
    ('Cisco ISR 1101', 'ISR 1101 4 Ports GE Ethernet WAN Router', NULL, 'Router', 'XYZ123', '6a38028c-6a71-4f44-b8f6-253bc7086a0a', 500, 150, 1, '2023-01-15', 500, 'Delivered'),
    ('HP 5406zl', 'HP ProCurve Switch 5406zl', NULL, 'Switch', 'ABC456', '7edc108e-45e0-4997-bc59-17852d16b689', 300, 100, 2, '2023-11-05', 300, 'Delivered'),
    ('DOCSIS 3.1 Cable Modem', 'Superfast speeds up to 10 gigabits per second', 'modem.jpg', 'Modem', 'LMN789', 'e41e2e16-2945-4c0c-a584-48935742fe94', 200, 50, 3, '2023-08-06', 200, 'Delivered'),
    ('Cellular Duplexer Rx', 'A multiplexer product that is RoHS6 compliant', NULL, 'Multiplexer', 'DSC423', '6aac9135-9ceb-4535-a13a-fc04ad8dadd5', 200, 50, 4, '2023-05-16', 200, 'Delivered'),
    ('SBB100 Splitter Trough Block', 'Splitter block with copper-aluminium monopiece', 'splitter.jpg', 'Splitter', 'BGH678', 'b01f5fea-f863-441e-9150-c5595caa9f01', 400, 75, 5, '2023-10-06', 400, 'Delivered');
INSERT INTO Users (UserName, Password, FirstName, LastName, Type, Phone, Email)
VALUES 
    ('rthomas', 'adminpass', 'Rachel', 'Thomas', 'Admin', '1234987650', 'abc@mail.com'),
    ('ajackson', 'managerpass', 'Alex', 'Jackson', 'Manager', '7894987650', 'non@mail.com'),
    ('pnelson', 'staffpass', 'Peter', 'Nelson', 'Staff', '7654987124', 'mmm@mail.com');
