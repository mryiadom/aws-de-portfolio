-- Total volume and average price per instrument per month.
-- Uses DATE_TRUNC (not EXTRACT) so months from different years stay distinct —
-- EXTRACT(MONTH) alone would merge e.g. Jan 2025 and Jan 2026 into one group.

SELECT
  -- EXTRACT(MONTH FROM trade_date) AS trade_month,
  DATE_TRUNC(trade_date, MONTH) AS trade_month,
  instrument,
  SUM(volume) AS total_volume_per_month,
  ROUND(AVG(price), 2) AS avg_price_per_month
FROM
  `de-project-finance.finance_project.trades`
GROUP BY
  ALL