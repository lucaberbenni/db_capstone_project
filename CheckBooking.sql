DELIMITER //

CREATE PROCEDURE CheckBooking(booking_date DATETIME, table_number INT)

BEGIN

DECLARE booked_table INT DEFAULT 0;
SELECT COUNT(booked_table) AS BookedTable
INTO booked_table
FROM Bookings
WHERE Date = booking_date AND TableNo = table_number;
IF booked_table > 0 THEN
SELECT CONCAT("Table ", table_number, " is already booked") AS BookingStatus;
ELSE
SELECT CONCAT("Table ", table_number, " is not booked") AS BookingStatus;
END IF;

END //

DELIMITER ;