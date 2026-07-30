-- Week 2, Monday: basic filtering with WHERE, comparison operators and ORDER BY.

-- Question: which trades were priced above 220, newest first?
-- Expected: 19 rows.
SELECT
  *
FROM
  `de-project-finance.market_practice.trades`
WHERE
  price > 220
ORDER BY
  trade_date DESC;

-- Question: which trades were priced between 150 and 250 (inclusive)?
-- Expected: 29 rows.
SELECT
  *
FROM
  `de-project-finance.market_practice.trades`
WHERE
  (price BETWEEN 150 AND 250)
ORDER BY
  trade_date DESC;
