SELECT
  -- date_trunc('day', time_stamp) AS day,
  CASE 
    WHEN coin_type = '0x3e8e9423d80e1774a7ca128fccd8bf5f1f7753be658c5e645929037f7c819040::lbtc::LBTC' THEN 'LBTC'
    WHEN coin_type = '0x5f496ed5d9d045c5b788dc1bb85f54100f2ede11e46f6a232c29daada4c5bdb6::coin::COIN' THEN 'stBTC'
    WHEN coin_type = '0xaafb102dd0902f5055cadecd687fb5b71ca82ef0e0285d90afde828ec58ca96b::btc::BTC' THEN 'sbWBTC'
    WHEN coin_type = '0x027792d9fed7f9844eb4839566001bb6f6cb4804f66aa2da6fe1ee242d896881::coin::COIN' THEN 'WBTC'
    WHEN coin_type = '0x876a4b7bce8aeaef60464c11f4026903e9afacab79b9b142686158aa86560b50::xbtc::XBTC' THEN 'xBTC'
    WHEN coin_type =
      '0x77045f1b9f811a7a8fb9ebd085b5b0c55c5cb0d1520ff55f7037f89b5da9f5f1::TBTC::TBTC' THEN 'tBTC'
    ELSE token_symbol
  END AS token_symbol,
  COUNT(DISTINCT wallet_address) AS token_holders
FROM
  SUI.TOKEN_WALLETS
WHERE
  coin_type IN (
    '0x3e8e9423d80e1774a7ca128fccd8bf5f1f7753be658c5e645929037f7c819040::lbtc::LBTC',
    '0x5f496ed5d9d045c5b788dc1bb85f54100f2ede11e46f6a232c29daada4c5bdb6::coin::COIN',
    '0xaafb102dd0902f5055cadecd687fb5b71ca82ef0e0285d90afde828ec58ca96b::btc::BTC',
    '0x027792d9fed7f9844eb4839566001bb6f6cb4804f66aa2da6fe1ee242d896881::coin::COIN',
    '0x876a4b7bce8aeaef60464c11f4026903e9afacab79b9b142686158aa86560b50::xbtc::XBTC',
    '0x77045f1b9f811a7a8fb9ebd085b5b0c55c5cb0d1520ff55f7037f89b5da9f5f1::TBTC::TBTC'
  )
  AND time_stamp BETWEEN CURRENT_DATE-60 AND current_date+1
GROUP BY 1
-- ORDER BY 1 DESC
LIMIT 10000
