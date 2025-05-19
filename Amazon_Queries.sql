SELECT *
FROM `cleaned dataset` ;

# Query 1
# Percentage of Delivered Vs Returned
SELECT 
    is_returned,
    COUNT(*) AS total_orders,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `cleaned dataset`), 2) AS percentage
FROM 
    `cleaned dataset`
GROUP BY 
    is_returned;
    
# Query 2
# Return rate by state
SELECT 
    ship_state,
    COUNT(*) AS total_orders,
    SUM(is_returned=1) AS returned_orders,
    ROUND(SUM(is_returned=1) * 100.0 / COUNT(*), 2) AS return_rate_percentage
FROM 
    `cleaned dataset`
GROUP BY 
    ship_state
ORDER BY 
    return_rate_percentage DESC;
    
# Query 3
# SKU's with >50% return rate
SELECT 
    sku,
    COUNT(*) AS total_orders,
    SUM(is_returned=1) AS returned_orders,
    ROUND(SUM(is_returned=1) * 100.0 / COUNT(*), 2) AS return_rate_percentage
FROM 
    `cleaned dataset`
GROUP BY 
    sku
HAVING 
    return_rate_percentage > 50
ORDER BY 
    return_rate_percentage DESC;

# Query 4
# Return rate by Payment Method
SELECT 
    CASE 
        WHEN cod=1 THEN 'Cash on Delivery'
        ELSE 'Online'
    END AS payment_method,
    COUNT(*) AS total_orders,
    SUM(is_returned=1) AS returned_orders,
    ROUND(SUM(is_returned=1) * 100.0 / COUNT(*), 2) AS return_rate_percentage
FROM 
    `cleaned dataset`
GROUP BY 
    payment_method;



