-- 🔍 Top 5 Customers by Revenue
SELECT 
    c.ContactName,
    c.CompanyName,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalSpent
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
    c.ContactName, c.CompanyName
ORDER BY 
    TotalSpent DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;


-- 💰 Revenue by Product
SELECT 
    p.ProductName,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS ProductRevenue
FROM 
    Products p
JOIN 
    [Order Details] od ON p.ProductID = od.ProductID
GROUP BY 
    p.ProductName
ORDER BY 
    ProductRevenue DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;


-- 📈 Monthly Sales Trend
SELECT 
    FORMAT(o.OrderDate, 'yyyy-MM') AS OrderMonth,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS MonthlyRevenue
FROM 
    Orders o
JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
    FORMAT(o.OrderDate, 'yyyy-MM')
ORDER BY 
    OrderMonth;


-- 🧑‍💼 Revenue by Employee
SELECT 
    e.FirstName + ' ' + e.LastName AS Employee,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS EmployeeRevenue
FROM 
    Employees e
JOIN 
    Orders o ON e.EmployeeID = o.EmployeeID
JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
    e.FirstName, e.LastName
ORDER BY 
    EmployeeRevenue DESC;

