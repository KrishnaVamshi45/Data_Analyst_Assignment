-- Revenue by channel
SELECT sales_channel, SUM(amount) revenue
FROM clinic_sales
GROUP BY sales_channel;

-- Profit / Loss
SELECT s.month,
       s.revenue,
       e.expense,
       (s.revenue - e.expense) profit
FROM
(SELECT MONTH(date) month, SUM(amount) revenue FROM clinic_sales GROUP BY MONTH(date)) s
JOIN
(SELECT MONTH(date) month, SUM(amount) expense FROM expenses GROUP BY MONTH(date)) e
ON s.month=e.month;
