CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(Quantity) AS MaxQuantity
FROM Orders;