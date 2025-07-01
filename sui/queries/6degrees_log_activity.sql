SELECT
  DATE (time_stamp) AS transaction_date,
  COUNT(transaction_block_digest) AS transaction_count,
  COUNT(sender) AS sender_count
FROM
  SUI.EVENTS
WHERE
  package_id = '0x2cdcc3b1306a49fcd5b8ccded57116ad86ab37a93ba9d91fa1ce06a8d22a21e9'
  AND type_ = '0x2cdcc3b1306a49fcd5b8ccded57116ad86ab37a93ba9d91fa1ce06a8d22a21e9::campaign::LoginEvent'
  AND time_stamp >= date_sub (CAST('2025-07-01' AS DATE), 7)
GROUP BY
  DATE (time_stamp)
ORDER BY
  transaction_date DESC
LIMIT
  200;
