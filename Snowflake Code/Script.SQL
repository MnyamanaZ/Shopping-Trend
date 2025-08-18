SELECT
    TO_DATE(processdate)AS purchase_date,
    MONTHNAME(processdate)AS month_name,
    DAYNAME(TO_DATE(processdate)) AS day_name,
    DAYOFMONTH(TO_DATE(processdate))AS day_of_month,
    TO_CHAR(TO_DATE(processdate),'YYYY-MM') AS month_id,

    YEAR(TO_DATE(processdate))AS year_of_purchase,
  
    
-------Aggregates

SUM("Purchase Amount (USD)")AS revenue,
Count(DISTINCT CUSTOMER_ID) AS number_of_customers,

    subscription_status,
    shipping_type,
    discount_applied,
    promo_code_used,
    payment_method,
    Season,
    category,
    gender,
    location,
    item_purchased,
    size,
    previous_purchases,
    frequency_of_purchases,
    
 -----CASE STATEMENTS 

      CASE
            WHEN review_rating BETWEEN 2.5 AND 3.0 THEN 'Bad'
            WHEN review_rating BETWEEN 3.1 AND 3.8 THEN 'Good'
     ELSE   'Excellent'
END AS Review_Rating_Bucket,

CASE
            WHEN age BETWEEN 18 AND 25 THEN 'Young Adults'
            WHEN age BETWEEN 26 AND 40 THEN 'Adults'
            WHEN age BETWEEN 41 AND 60 THEN 'Mature Adults'
ELSE 'Senior'
END AS Age_Group,

CASE    
            WHEN DAYOFWEEK(TO_DATE(processdate)) BETWEEN 1 AND 5 THEN 'Weekday'
    ELSE 'Weekend'
END AS Time_of_the_week,  

CASE
    WHEN day_name= 'Mon' THEN 1
    WHEN day_name= 'Tue' THEN 2
    WHEN day_name= 'Wed' THEN 3
    WHEN day_name= 'Thu' THEN 4
    WHEN day_name= 'Fri' THEN 5
    WHEN day_name= 'Sat' THEN 6
    WHEN day_name= 'Sun' THEN 7
END AS Day_ID,

FROM SHOPPINGTRENDS.SALES.TRANSACTIONS
GROUP BY ALL;

