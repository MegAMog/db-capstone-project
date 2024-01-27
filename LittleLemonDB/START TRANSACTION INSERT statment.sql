USE littlelemondb;

START TRANSACTION;
INSERT INTO bookings (BookingDate,BookingSlot,TableNo,CustomerID) 
VALUES 
('2022-10-10', '18:00:00', 5, 1),
('2022-11-12', '19:00:00', 3, 3),
('2022-10-11', '19:00:00', 2, 2),
('2022-10-13', '18:30:00', 2, 1);

SELECT * FROM bookings;
COMMIT;



