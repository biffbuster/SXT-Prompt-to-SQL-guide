SELECT
  DATE (time_stamp) AS transaction_date,
  COUNT(DISTINCT transaction_block_digest) AS distinct_transaction_count,
  COUNT(DISTINCT sender) AS distinct_sendercount
FROM
  SUI.EVENTS
WHERE
  type = '0xe74104c66dd9f16b3096db2cc00300e556aa92edc871be4bc052b5dfb80db239::pool::SwapEvent'
  AND package_id = '0xd8405a122c49b64210ea4dea5928d59c103e72e1da1e36f0257a6b1c48acee27'
  AND time_stamp >= date_sub (CAST('2025-07-01' AS DATE), 30)
GROUP BY
  transaction_date
ORDER BY
  transaction_date DESC
LIMIT
  200;
