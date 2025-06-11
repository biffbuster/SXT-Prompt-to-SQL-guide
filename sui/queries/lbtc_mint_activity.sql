SELECT
  DATE (e.time_stamp) AS mint_date,
  COUNT(DISTINCT e.transaction_block_digest) AS distinct_transactions,
  COUNT(DISTINCT e.sender) AS distinct_senders,
  SUM(CAST(b.amount AS DECIMAL(38)) / 1e8) AS daily_lbtc_minted,
  SUM(SUM(CAST(b.amount AS DECIMAL(38)) / 1e8)) OVER (
    ORDER BY
      DATE (e.time_stamp)
  ) AS cumulative_lbtc_minted
FROM
  SUI.EVENTS e
  JOIN SUI.BALANCE_CHANGES b ON e.transaction_block_digest = b.transaction_blockdigest
WHERE
  e.type = '0x818430a456ff977f7320f78650d19801f90758d200a01dd3c2c679472c521357::treasury::MintWithPayloadEvent<0x3e8e9423d80e1774a7ca128fccd8bf5f1f7753be658c5e645929037f7c819040::lbtc::LBTC>'
  AND e.package_id = '0x818430a456ff977f7320f78650d19801f90758d200a01dd3c2c679472c521357'
  AND b.coin_type = '0x3e8e9423d80e1774a7ca128fccd8bf5f1f7753be658c5e645929037f7c819040::lbtc::LBTC'
  AND e.time_stamp >= date_sub (CAST('2025-06-11' AS DATE), 7)
GROUP BY
  DATE (e.time_stamp)
ORDER BY
  mint_date ASC
LIMIT
  200;