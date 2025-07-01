SELECT
  DATE (mc.time_stamp) AS transfer_date,
  SUM(bc.amount / 1e27 * -1) AS total_transferred
FROM
  SUI.MOVE_CALLS mc
  JOIN SUI.BALANCE_CHANGES bc ON mc.transaction_block_digest = bc.transaction_block_digest
WHERE
  mc.function = 'stake_with_pool'
  AND mc.package_id = '0xfdc88f7d7cf30afab2f82e8380d11ee8f70efb90e863d1de8616fae1bb09ea77'
  AND bc.coin_type = '0x356a26eb9e012a68958082340d4c4116e7f55615cf27affcff209cf0ae544f59::wal::WAL'
  AND mc.time_stamp >= date_sub (CAST('2025-04-11' AS DATE), 7)
GROUP BY
  DATE (mc.time_stamp)
LIMIT
  200;
