# SXT-Prompt-to-SQL-guide

----------

This repo contains basic prompt instructions on how to write no-code SQL using the Space and Time data studio and query editor. 

No-code SQL prompting in Space and Time (SxT) lets users generate complex blockchain queries using simple natural language instructions. It turns human-friendly prompts into ready-to-run SQL using their AI-powered Data Studio and Query Editor. 


## Key Features:

- Prompt-to-SQL
- Prompt-to-Chainlink Job
- Explore Datasets
- Prompt-to-Docs
- Automatic Charts and Data Visualizations


________________


## How the Query Editor Works

- AI Code Studio: This is the no-code assistant. You enter a plain English prompt, and it generates SQL from that using context from indexed blockchain schemas.

- Query Editor: Once SQL is generated, you can edit it manually or run it as-is. You can preview results in a table, build visualizations, and export data instantly.

- Schema Browser: Every table across all supported blockchains is documented inside the studio. You can search, preview column names, and understand how each dataset is structured — super helpful if you want to refine your SQL.


## 🧭 Basic Steps for Using No-Code SQL in Space and Time

1. Open Data Studio
Go to studio.spaceandtime.io and log in.

2. Create a new query
Click “New Query” and choose the AI Code Studio option.

3. Write a natural language prompt
Example:

```Show me daily ETH staking deposits and number of users for the past 30 days.```

Or

```Count how many smart contracts were deployed on Polygon each day over the last month.```

4. Let the AI generate SQL
The editor will return fully formed SQL based on your prompt. You can run it, edit it, or export the result.

5. Use results immediately
You can chart it, export to CSV, or chain results into dashboards or external tools.


----------


## What you Can Query With No-Code SQL

| Use Case             | Prompt Example                                                 | Common Tables Used                                    |
| -------------------- | -------------------------------------------------------------- | ----------------------------------------------------- |
| 💸 Transactions      | `Show daily transaction count and volume on Ethereum`          | `ethereum.transactions`                               |
| 📣 Contract Events   | `Get all Uniswap swap events for the last 7 days`              | `ethereum.event_logs`, `ethereum.uniswap_swaps`       |
| 🔧 Contract Deploys  | `How many smart contracts were deployed on Polygon this week?` | `polygon.contracts`                                   |
| 📈 Staking Metrics   | `Track daily stakers and total staked ETH on Lido`             | `ethereum.staking_events`, `ethereum.token_transfers` |
| 🪙 Token Transfers   | `Get top 10 tokens transferred on Avalanche by volume`         | `avalanche.token_transfers`                           |
| 🧾 NFT Activity      | `List NFT mints on Base by day with minting wallet`            | `base.nft_events`, `base.token_transfers`             |
| 🧑‍💻 Protocol Usage | `Which protocols had the most transactions on Sui this month?` | `sui.events`, `sui.move_calls`                        |
| 📅 Daily Users       | `Show active wallets per day on Polygon`                       | `polygon.transactions`                                |


## References

[Space and Time Docs](docs.spaceandtime.io)

[AI Code Studio ](app.spaceandtime.io)
