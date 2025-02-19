-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select ProductName, CategoryName
from Product as p
    join Category as c on p.CategoryId = c.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select Id, CompanyName
from [Order]
    join [Shipper] on [Order].ShipVia = [Shipper].Id
where OrderDate < "2012-08-09";


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select ProductName, Quantity, OrderId
from [OrderDetail]
    join [Product] on [OrderDetail].ProductId = [Product].Id
where OrderId = "10251"
order by ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select Id as OrderId, CompanyName, LastName
from [Order]
    join [Customer] on [Customer].Id = [Order].CustomerId
    join [Employee] on [Employee].Id = [Order].EmployeeId;