-- Week 2, Thursday: subqueries in WHERE and FROM.

-- Question: find every trade priced above the average price for its own instrument.
-- Expected: 29 rows. Built as a subquery in FROM (per-instrument average), joined
-- back to the trades so each row is compared against its own ticker's average.
WITH
  base AS (
    SELECT
      pt.instrument_id,
      pi.ticker,
      pt.price
    FROM
      `de-project-finance.market_practice.trades` AS pt
    LEFT JOIN
      `de-project-finance.market_practice.instruments` AS pi
      USING (instrument_id)
  ),
  avg_by_ticker AS (
    SELECT
      ticker,
      AVG(price) AS avg_price
    FROM
      base
    GROUP BY
      ticker
  )
SELECT
  base.ticker,
  base.price,
  avg_by_ticker.avg_price
FROM
  base
LEFT JOIN
  avg_by_ticker
  USING (ticker)
WHERE
  base.price > avg_by_ticker.avg_price
ORDER BY
  base.ticker, base.price;

-- Question: now find trades above the overall average price. Expected value: 238.08.
-- Expected: 11 rows -- and every one of them is MSFT. MSFT's own average (473.05)
-- sits so far above the blended global average that the other four tickers (all
-- averaging below 238.08) can never clear the bar, no matter how high they trade
-- relative to their own history. A single global average stops measuring "unusual
-- for its own instrument" and starts just separating expensive tickers from cheap ones.
SELECT
  pt.price
FROM
  `de-project-finance.market_practice.trades` AS pt
WHERE
  pt.price > (
    SELECT AVG(price) FROM `de-project-finance.market_practice.trades`
  )
ORDER BY
  pt.price;
