SELECT 
date_trunc('day',time_stamp) as day,
-- package_id,
COUNT(DISTINCT transaction_block_digest) as txns,
COUNT(DISTINCT sender) as users
FROM SUI.EVENTS
WHERE type_ = '0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::trade::SwapEvent'
AND time_stamp BETWEEN current_date-60 and current_date+60
GROUP BY 1
ORDER BY 1 DESC
LIMIT 10000