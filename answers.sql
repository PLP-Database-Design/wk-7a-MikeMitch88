
-- QUESTION 1: Achieving 1NF (First Normal Form)

-- Transforming to 1NF by splitting the Products column
SELECT OrderID, CustomerName, 'Laptop' AS Product FROM ProductDetail WHERE FIND_IN_SET('Laptop', Products) > 0
UNION
SELECT OrderID, CustomerName, 'Mouse' AS Product FROM ProductDetail WHERE FIND_IN_SET('Mouse', Products) > 0
UNION
SELECT OrderID, CustomerName, 'Tablet' AS Product FROM ProductDetail WHERE FIND_IN_SET('Tablet', Products) > 0
UNION
SELECT OrderID, CustomerName, 'Keyboard' AS Product FROM ProductDetail WHERE FIND_IN_SET('Keyboard', Products) > 0
UNION
SELECT OrderID, CustomerName, 'Phone' AS Product FROM ProductDetail WHERE FIND_IN_SET('Phone', Products) > 0;


-- QUESTION 2: Achieving 2NF (Second Normal Form)

-- Creating Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Inserting data into Orders table (with distinct OrderID and CustomerName)
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;


-- Creating OrderDetails table
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


-- Inserting data into OrderDetails table
INSERT INTO OrderDetails (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;

