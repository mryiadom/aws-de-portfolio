-- Week 2, Tuesday: joins. Trades to instruments, INNER vs LEFT, and a sector rollup.

-- Question: join trades to instruments and return ticker, sector, price.
-- Expected: 54 rows -- every trade has a valid instrument_id, so INNER loses nothing.
SELECT
  i.ticker,
  i.sector,
  t.price
FROM
  `de-project-finance.market_practice.trades` AS t
INNER JOIN
  `de-project-finance.market_practice.instruments` AS i
  USING (instrument_id);

-- Question: rewrite as a LEFT JOIN *from* instruments -- what changes?
-- Expected: 55 rows. A LEFT JOIN keeps every row from the base (left) table whether
-- or not it matches, so instruments must be the base table for the extra row to show.
-- LEFT JOIN *from trades* still returns 54, because every trade already matches --
-- the join type only matters when the base table has unmatched rows.
-- The extra row is NVDA (instrument_id = 6): it's in the lookup with zero trades
-- against it, on purpose, so every trade column comes back NULL for that row.
SELECT
  i.ticker,
  i.sector,
  t.price
FROM
  `de-project-finance.market_practice.instruments` AS i
LEFT JOIN
  `de-project-finance.market_practice.trades` AS t
  USING (instrument_id);

-- Question: count trades per sector.
-- Expected: Technology 22, Financials 11, Healthcare 11, Energy 10.
-- NVDA doesn't appear -- it has no trades to count, not a join-type artefact.
SELECT
  i.sector,
  COUNT(*) AS sector_count
FROM
  `de-project-finance.market_practice.trades` AS t
LEFT JOIN
  `de-project-finance.market_practice.instruments` AS i
  USING (instrument_id)
GROUP BY
  i.sector
ORDER BY
  sector_count DESC;
