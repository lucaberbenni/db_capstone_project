SELECT MenuID
FROM Menu
WHERE OrderID = ANY (
    SELECT OrderID
    FROM Orders
    WHERE Quantity > 2
);
