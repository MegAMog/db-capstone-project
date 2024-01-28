-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `customer_orders_view`
--

DROP TABLE IF EXISTS `customer_orders_view`;
/*!50001 DROP VIEW IF EXISTS `customer_orders_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_orders_view` AS SELECT 
 1 AS `CustomerID`,
 1 AS `CustomerFullName`,
 1 AS `OrderID`,
 1 AS `BillAmount`,
 1 AS `Discount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orders_view`
--

DROP TABLE IF EXISTS `orders_view`;
/*!50001 DROP VIEW IF EXISTS `orders_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orders_view` AS SELECT 
 1 AS `OrderID`,
 1 AS `TotalOrderQuantity`,
 1 AS `TotalOrderPrice`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `menuitems_view`
--

DROP TABLE IF EXISTS `menuitems_view`;
/*!50001 DROP VIEW IF EXISTS `menuitems_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `menuitems_view` AS SELECT 
 1 AS `ItemID`,
 1 AS `ItemName`,
 1 AS `Type`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `customer_orders_view`
--

/*!50001 DROP VIEW IF EXISTS `customer_orders_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`little_lemon_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_orders_view` AS select `customers`.`CustomerID` AS `CustomerID`,concat(`customers`.`FirstName`,' ',`customers`.`LastName`) AS `CustomerFullName`,`orderhistory`.`OrderID` AS `OrderID`,`orders`.`BillAmount` AS `BillAmount`,`orders`.`Discount` AS `Discount` from (((`orders` join `orderhistory` on((`orderhistory`.`OrderID` = `orders`.`OrderID`))) left join `bookings` on((`orderhistory`.`BookingID` = `bookings`.`BookingID`))) join `customers` on((`customers`.`CustomerID` = `bookings`.`CustomerID`))) where (`orders`.`BillAmount` > 150) order by `orders`.`BillAmount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_view`
--

/*!50001 DROP VIEW IF EXISTS `orders_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`little_lemon_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_view` AS select `orderhistory`.`OrderID` AS `OrderID`,sum(`orderhistory`.`Quantity`) AS `TotalOrderQuantity`,sum(`menuitems`.`Price`) AS `TotalOrderPrice` from (`orderhistory` join `menuitems` on((`orderhistory`.`ItemID` = `menuitems`.`ItemID`))) group by `orderhistory`.`OrderID` having (sum(`orderhistory`.`Quantity`) > 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `menuitems_view`
--

/*!50001 DROP VIEW IF EXISTS `menuitems_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`little_lemon_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `menuitems_view` AS select `menuitems`.`ItemID` AS `ItemID`,`menuitems`.`ItemName` AS `ItemName`,`menuitems`.`Type` AS `Type` from `menuitems` where `menuitems`.`ItemID` in (select `orderhistory`.`ItemID` from `orderhistory` group by `orderhistory`.`ItemID` having (count(distinct `orderhistory`.`OrderID`) > 2)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'littlelemondb'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddValidBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`little_lemon_admin`@`%` PROCEDURE `AddValidBooking`(booking_date DATE, booking_slot TIME(0), table_no INT, customer_id INT)
BEGIN
call littlelemondb.CheckBooking(booking_date, booking_slot, table_no, @table_status);

START TRANSACTION;
INSERT INTO bookings (BookingDate,BookingSlot,TableNo,CustomerID) 
VALUES (booking_date, booking_slot, table_no, customer_id);

IF @table_status IS NOT NULL THEN ROLLBACK;
ELSE COMMIT;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`little_lemon_admin`@`%` PROCEDURE `CancelBooking`(booking_id INT)
BEGIN
IF EXISTS(SELECT BookingID FROM bookings WHERE BookingID=booking_id) THEN
	DELETE FROM bookings WHERE BookingID=booking_id;
    SELECT CONCAT("Booking ", booking_id, " was canceled.");
ELSE SELECT CONCAT("There is no booking ", booking_id, " in DB.");
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`little_lemon_admin`@`%` PROCEDURE `CancelOrder`(order_id INT, item_id INT)
BEGIN
DELETE FROM orderhistory WHERE OrderID=order_id AND ItemID=item_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`little_lemon_admin`@`%` PROCEDURE `CheckBooking`(booking_date DATE, booking_slot TIME(0), table_no INT, OUT status VARCHAR(255))
BEGIN
SELECT CONCAT(TableNo, ' is already booked.') INTO status
FROM bookings
WHERE 
BookingDate=booking_date
AND BookingSlot BETWEEN (booking_slot - INTERVAL 60 MINUTE) AND (booking_slot + INTERVAL 60 MINUTE)
AND TableNo=table_no; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxQuantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`little_lemon_admin`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
SELECT MAX(Quantity) as MaxQuantity
FROM orderhistory;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBookingSetNewTimeTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`little_lemon_admin`@`%` PROCEDURE `UpdateBookingSetNewTimeTable`(booking_id INT, new_booking_slot TIME(0))
BEGIN
DECLARE booking_date DATE;
DECLARE table_no INT;
DECLARE slot_status VARCHAR(255);
    
IF EXISTS(SELECT BookingID FROM bookings WHERE BookingID=booking_id ) THEN  


	SELECT BookingDate INTO booking_date FROM bookings WHERE BookingID=booking_id;
	SELECT TableNo INTO table_no FROM bookings WHERE BookingID=booking_id;

	SELECT CONCAT('Table', TableNo,' is already booked for new time.') INTO slot_status
	FROM bookings
	WHERE 
	BookingDate=booking_date
	AND TableNo=table_no
	AND BookingID<>booking_id
	AND BookingSlot BETWEEN (new_booking_slot - INTERVAL 60 MINUTE) AND (new_booking_slot + INTERVAL 60 MINUTE)
	AND TableNo=table_no; 

	IF slot_status IS NULL THEN 
		UPDATE bookings
		SET BookingSlot=new_booking_slot
		WHERE BookingID=booking_id;
		
		SELECT CONCAT("Booking ", booking_id, " was updated.");
		
	ELSE SELECT slot_status;
	END IF;
    
ELSE SELECT CONCAT("There is no such Booking as ", booking_id, ".");
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-28 20:38:39
