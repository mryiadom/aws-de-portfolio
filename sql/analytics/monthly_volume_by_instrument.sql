-- Week 2, Friday: CASE WHEN, date functions.

-- Question: total volume per instrument per month.
-- Expected: 30 rows -- every instrument traded in every month (5 tickers x 6 months).
SELECT
  DATE_TRUNC(trade_date, MONTH) AS trade_month,
  pi.ticker,
  SUM(pt.volume) AS total_volume
FROM
  `de-project-finance.market_practice.trades` AS pt
LEFT JOIN
  `de-project-finance.market_practice.instruments` AS pi
  USING (instrument_id)
GROUP BY
  ALL
ORDER BY
  trade_month;

-- Question: which calendar month had the highest total volume?
-- Expected: May, 40,500.
SELECT
  DATE_TRUNC(trade_date, MONTH) AS trade_month,
  SUM(pt.volume) AS total_volume
FROM
  `de-project-finance.market_practice.trades` AS pt
LEFT JOIN
  `de-project-finance.market_practice.instruments` AS pi
  USING (instrument_id)
GROUP BY
  ALL
ORDER BY
  total_volume DESC;
