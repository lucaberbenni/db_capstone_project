SELECT 
    CustomerDetails.CustomerID AS CustomerID,
    CustomerDetails.Name AS FullName,
    Orders.OrderID AS OrderID,
    Orders.TotalCost AS Cost,
    Menu.MenuID AS MenuID,
    Menu.Courses AS Courses,
    Menu.Starters AS Starters
FROM 
    CustomerDetails
JOIN 
    Orders ON Orders.CustomerID = CustomerDetails.CustomerID
JOIN 
    Menu ON Orders.OrderID = Menu.OrderID
WHERE 
    Orders.TotalCost > 150
ORDER BY 
    Orders.TotalCost ASC;
