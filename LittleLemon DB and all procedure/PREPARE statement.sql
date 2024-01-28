PREPARE GetOrderDetail FROM "SELECT orders.OrderID, SUM(Quantity), BillAmount FROM orders INNER JOIN orderhistory ON orders.OrderID=orderhistory.OrderID WHERE orders.OrderID=? GROUP by orders.OrderID"

SET @id = 1;
EXECUTE GetOrderDetail USING @id;