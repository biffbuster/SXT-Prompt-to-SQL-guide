SELECT
  DATE (time_stamp) AS DAY,
  COUNT(DISTINCT transaction_block_digest) AS txns,
  COUNT(DISTINCT sender) AS stakers,
  SUM(amount) / 1e27 AS total_staked,
  'stake' AS action
FROM
  SUI.STAKING_REQUEST_EVENT
WHERE
  package_id = '0x0000000000000000000000000000000000000000000000000000000000000003'
  AND time_stamp >= date_sub (CAST('2025-06-19' AS DATE), 7)
GROUP BY
  DATE (time_stamp)
ORDER BY
  DAY DESC
LIMIT
  200;
