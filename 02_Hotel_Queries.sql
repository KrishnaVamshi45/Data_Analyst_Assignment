-- Q1 Last Booking
SELECT * FROM bookings ORDER BY booking_date DESC LIMIT 1;

-- Q2 Billing November
SELECT b.booking_id,
       SUM(bc.quantity * i.rate) AS total_bill
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(b.booking_date)=11 AND YEAR(b.booking_date)=2021
GROUP BY b.booking_id;

-- Q3 Bills >1000
SELECT b.booking_id,
       SUM(bc.quantity * i.rate) AS total_bill
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
GROUP BY b.booking_id
HAVING total_bill > 1000;

-- Q4 Most Ordered Item
SELECT *
FROM (
    SELECT MONTH(b.booking_date) m,
           i.item_name,
           SUM(bc.quantity) qty,
           RANK() OVER (PARTITION BY MONTH(b.booking_date) ORDER BY SUM(bc.quantity) DESC) rnk
    FROM bookings b
    JOIN booking_commercials bc ON b.booking_id=bc.booking_id
    JOIN items i ON bc.item_id=i.item_id
    GROUP BY m,i.item_name
) t
WHERE rnk=1;

-- Q5 2nd Highest Bill
SELECT *
FROM (
    SELECT b.booking_id,
           SUM(bc.quantity * i.rate) total,
           DENSE_RANK() OVER (ORDER BY SUM(bc.quantity * i.rate) DESC) rnk
    FROM bookings b
    JOIN booking_commercials bc ON b.booking_id=bc.booking_id
    JOIN items i ON bc.item_id=i.item_id
    GROUP BY b.booking_id
) t
WHERE rnk=2;
