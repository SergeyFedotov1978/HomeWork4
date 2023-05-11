-- Answer for capture #1

SELECT 
    'First half of 2019' AS 'data range',
    SUM(invoice_total) AS 'total sales',
    SUM(payment_total) AS 'total payment',
    SUM(invoice_total) - SUM(payment_total) AS 'what we expect'
FROM
    invoices
WHERE
    invoice_date < '2019-07-01' 
UNION SELECT 
    'Second half of 2019',
    SUM(invoice_total),
    SUM(payment_total),
    SUM(invoice_total) - SUM(payment_total)
FROM
    invoices
WHERE
    invoice_date > '2019-06-30'

-- Answer for capture #2
    
    SELECT 
    date,
    pm.name AS payment_method,
    SUM(amount) AS total_payments
FROM
    payments AS pay
        JOIN
    payment_methods AS pm ON pay.payment_method = pm.payment_method_id
GROUP BY date , payment_method_id
ORDER BY date

-- Answer for capture #3

SELECT 
    payment_method, SUM(amount) AS total
FROM
    payments
GROUP BY payment_method WITH ROLLUP