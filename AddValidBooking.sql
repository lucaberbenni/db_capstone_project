DELIMITER // 

CREATE PROCEDURE AddValidBooking(
IN booking_date DATETIME, 
IN table_number INT
)

BEGIN

DECLARE existing_booking_count INT;

SELECT COUNT(*)
INTO existing_booking_count
FROM Bookings
WHERE Date = booking_date AND TableNo = table_number;

START TRANSACTION;

IF existing_booking_count > 0 THEN
ROLLBACK;
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = "Table already booked for this date";
ELSE
INSERT INTO Bookings (Date, TableNo)
VALUES
(booking_date, table_number);

COMMIT;
END IF;

END //

DELIMITER ; 