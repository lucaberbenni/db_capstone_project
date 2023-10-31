DELIMITER //

CREATE PROCEDURE UpdateBooking(
booking_id INT,
booking_date DATETIME
)

BEGIN

UPDATE Bookings
SET Date = booking_date
WHERE BookingID = booking_id;

SELECT CONCAT ("Booking ", booking_id, " updated.")
AS Confirmation;

END //

DELIMITER ;

