SELECT
  DATE_TRUNC('hour', mc.time_stamp) AS hour,
  SUM(bc.amount) / 1e27 AS total_sui_volume
FROM SUI.MOVE_CALLS mc
JOIN SUI.BALANCE_CHANGES bc 
  ON mc.transaction_block_digest = bc.transaction_block_digest
WHERE mc.package_id = '0x475e98e9c436ec118909f3b9e241d86bcbbc2cf9fba05e99a934823fefb375b7'
  AND bc.coin_type = '0x2::sui::SUI'
  AND mc.time_stamp > CURRENT_DATE - INTERVAL '30 day'
GROUP BY 1
ORDER BY 1 DESC;
