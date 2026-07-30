-- Week 2, Friday: CASE WHEN bucketing.

-- Question: bucket trades into SMALL (<1000), MEDIUM (1000-4999) and LARGE (>=5000).
-- Expected: SMALL 9, MEDIUM 28, LARGE 17.
-- ELSE 'UNDEFINED' is defensive rather than necessary -- the three WHEN branches are
-- already exhaustive over any volume, so it catches zero rows here. Keeping it turns
-- a silent NULL into a visible, searchable value if the data ever changes underneath
-- this query (a NULL volume, or a boundary case not accounted for).
SELECT
  pi.ticker,
  pt.price,
  pt.volume,
  CASE
    WHEN pt.volume < 1000 THEN 'SMALL'
    WHEN pt.volume BETWEEN 1000 AND 4999 THEN 'MEDIUM'
    WHEN pt.volume >= 5000 THEN 'LARGE'
    ELSE 'UNDEFINED'
    END AS trade_bucket
FROM
  `de-project-finance.market_practice.trades` AS pt
LEFT JOIN
  `de-project-finance.market_practice.instruments` AS pi
  USING (instrument_id);
