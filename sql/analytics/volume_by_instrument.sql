-- Week 2, Wednesday: GROUP BY, HAVING vs WHERE, aggregates.

-- Question: total and average volume per instrument.
-- Expected: MSFT 63,000 total; JPM 16,000 total.
SELECT
  pi.ticker,
  SUM(pt.volume) AS total_volume,
  ROUND(AVG(pt.volume), 2) AS avg_volume
FROM
  `de-project-finance.market_practice.trades` AS pt
LEFT JOIN
  `de-project-finance.market_practice.instruments` AS pi
  USING (instrument_id)
GROUP BY ALL
ORDER BY
  total_volume DESC;

-- Question: which instruments have total volume exceeding 35,000?
-- Expected: exactly 2 -- JNJ and MSFT.
SELECT
  pi.ticker,
  SUM(pt.volume) AS total_volume,
  ROUND(AVG(pt.volume), 2) AS avg_volume
FROM
  `de-project-finance.market_practice.trades` AS pt
LEFT JOIN
  `de-project-finance.market_practice.instruments` AS pi
  USING (instrument_id)
GROUP BY ALL
HAVING
  total_volume > 35000;

-- Question: group by instrument and side. Why can't HAVING be replaced by WHERE here?
-- WHERE filters individual rows before grouping, so it can't reference an aggregate
-- like SUM(volume) -- that value doesn't exist yet at the row level. HAVING filters
-- groups after aggregation, which is the only stage at which total_volume exists.
SELECT
  pi.ticker,
  pt.side,
  SUM(pt.volume) AS total_volume,
  ROUND(AVG(pt.volume), 2) AS avg_volume
FROM
  `de-project-finance.market_practice.trades` AS pt
LEFT JOIN
  `de-project-finance.market_practice.instruments` AS pi
  USING (instrument_id)
GROUP BY ALL
ORDER BY
  pi.ticker, pt.side;
