-- Week 2, Monday: schema + seed data for the market_practice dataset.
-- BigQuery requires NOT ENFORCED on every key constraint -- it records them as
-- metadata for the query planner but will happily let you insert a duplicate.

CREATE SCHEMA IF NOT EXISTS market_practice
OPTIONS (location = 'EU');

CREATE OR REPLACE TABLE market_practice.venues (
  venue_code  STRING NOT NULL,
  venue_name  STRING NOT NULL,
  country     STRING NOT NULL,
  PRIMARY KEY (venue_code) NOT ENFORCED
);

CREATE OR REPLACE TABLE market_practice.instruments (
  instrument_id  INT64  NOT NULL,
  ticker         STRING NOT NULL,
  name           STRING NOT NULL,
  sector         STRING NOT NULL,
  PRIMARY KEY (instrument_id) NOT ENFORCED
);

CREATE OR REPLACE TABLE market_practice.trades (
  trade_id       INT64        NOT NULL,
  instrument_id  INT64        NOT NULL,
  trade_date     DATE         NOT NULL,
  price          NUMERIC      NOT NULL,
  volume         INT64        NOT NULL,
  venue_code     STRING       NOT NULL,
  side           STRING       NOT NULL,
  PRIMARY KEY (trade_id) NOT ENFORCED,
  FOREIGN KEY (instrument_id)
    REFERENCES market_practice.instruments(instrument_id) NOT ENFORCED,
  FOREIGN KEY (venue_code)
    REFERENCES market_practice.venues(venue_code) NOT ENFORCED
);

-- Reference data. NVDA exists in the lookup with no trades against it, on purpose --
-- that's what makes INNER JOIN and LEFT JOIN return different row counts later.

INSERT INTO market_practice.venues (venue_code, venue_name, country) VALUES
  ('XNAS', 'Nasdaq', 'US'),
  ('XNYS', 'New York Stock Exchange', 'US');

INSERT INTO market_practice.instruments (instrument_id, ticker, name, sector) VALUES
  (1, 'AAPL', 'Apple Inc.',           'Technology'),
  (2, 'MSFT', 'Microsoft Corp.',      'Technology'),
  (3, 'JPM',  'JPMorgan Chase & Co.', 'Financials'),
  (4, 'XOM',  'Exxon Mobil Corp.',    'Energy'),
  (5, 'JNJ',  'Johnson & Johnson',    'Healthcare'),
  (6, 'NVDA', 'NVIDIA Corp.',         'Technology');

-- 54 trades across six months and five instruments. Deliberately uneven --
-- some months have two trades per instrument, some have one.

INSERT INTO market_practice.trades
  (trade_id, instrument_id, trade_date, price, volume, venue_code, side)
VALUES
  (1044, 5, DATE '2026-01-03', 160.04, 1000, 'XNYS', 'SELL'),
  (1045, 5, DATE '2026-01-03', 152.56, 7500, 'XNYS', 'SELL'),
  (1012, 2, DATE '2026-01-07', 438.92, 1500, 'XNAS', 'SELL'),
  (1002, 1, DATE '2026-01-08', 224.96, 1000, 'XNAS', 'BUY'),
  (1013, 2, DATE '2026-01-11', 447.60, 7500, 'XNAS', 'BUY'),
  (1023, 3, DATE '2026-01-13', 201.75, 750, 'XNYS', 'BUY'),
  (1001, 1, DATE '2026-01-15', 230.02, 2500, 'XNAS', 'SELL'),
  (1024, 3, DATE '2026-01-17', 206.01, 750, 'XNYS', 'SELL'),
  (1034, 4, DATE '2026-01-27', 124.22, 1000, 'XNYS', 'BUY'),
  (1014, 2, DATE '2026-02-02', 464.03, 2500, 'XNAS', 'BUY'),
  (1035, 4, DATE '2026-02-06', 121.68, 2500, 'XNYS', 'BUY'),
  (1047, 5, DATE '2026-02-06', 157.04, 12000, 'XNYS', 'SELL'),
  (1003, 1, DATE '2026-02-09', 219.86, 7500, 'XNAS', 'BUY'),
  (1046, 5, DATE '2026-02-09', 159.38, 2000, 'XNYS', 'BUY'),
  (1036, 4, DATE '2026-02-12', 121.60, 5000, 'XNYS', 'BUY'),
  (1025, 3, DATE '2026-02-13', 211.07, 2500, 'XNYS', 'BUY'),
  (1015, 2, DATE '2026-02-14', 488.11, 1500, 'XNAS', 'SELL'),
  (1004, 1, DATE '2026-02-16', 215.86, 2000, 'XNAS', 'SELL'),
  (1026, 3, DATE '2026-03-03', 207.51, 5000, 'XNYS', 'BUY'),
  (1048, 5, DATE '2026-03-03', 149.33, 250, 'XNYS', 'BUY'),
  (1037, 4, DATE '2026-03-06', 120.75, 2000, 'XNYS', 'BUY'),
  (1005, 1, DATE '2026-03-13', 209.18, 1500, 'XNAS', 'SELL'),
  (1027, 3, DATE '2026-03-15', 208.91, 1000, 'XNYS', 'BUY'),
  (1016, 2, DATE '2026-03-18', 462.27, 2000, 'XNAS', 'SELL'),
  (1038, 4, DATE '2026-03-18', 115.35, 2000, 'XNYS', 'BUY'),
  (1049, 5, DATE '2026-03-19', 142.91, 1500, 'XNYS', 'SELL'),
  (1006, 1, DATE '2026-03-26', 215.45, 2500, 'XNAS', 'SELL'),
  (1039, 4, DATE '2026-04-04', 115.25, 250, 'XNYS', 'SELL'),
  (1028, 3, DATE '2026-04-08', 215.62, 1500, 'XNYS', 'SELL'),
  (1051, 5, DATE '2026-04-11', 153.96, 500, 'XNYS', 'BUY'),
  (1007, 1, DATE '2026-04-18', 215.45, 7500, 'XNAS', 'SELL'),
  (1040, 4, DATE '2026-04-21', 119.27, 1000, 'XNYS', 'BUY'),
  (1018, 2, DATE '2026-04-22', 496.55, 7500, 'XNAS', 'SELL'),
  (1050, 5, DATE '2026-04-23', 145.38, 12000, 'XNYS', 'BUY'),
  (1029, 3, DATE '2026-04-24', 214.77, 750, 'XNYS', 'SELL'),
  (1017, 2, DATE '2026-04-26', 481.84, 1500, 'XNAS', 'BUY'),
  (1019, 2, DATE '2026-05-02', 478.91, 12000, 'XNAS', 'BUY'),
  (1031, 3, DATE '2026-05-05', 223.38, 1000, 'XNYS', 'BUY'),
  (1008, 1, DATE '2026-05-13', 214.26, 1000, 'XNAS', 'BUY'),
  (1020, 2, DATE '2026-05-18', 477.50, 7500, 'XNAS', 'SELL'),
  (1042, 4, DATE '2026-05-19', 111.73, 1000, 'XNYS', 'SELL'),
  (1009, 1, DATE '2026-05-20', 226.70, 7500, 'XNAS', 'SELL'),
  (1041, 4, DATE '2026-05-22', 116.05, 1500, 'XNYS', 'BUY'),
  (1052, 5, DATE '2026-05-22', 158.46, 7500, 'XNYS', 'BUY'),
  (1030, 3, DATE '2026-05-26', 219.23, 1500, 'XNYS', 'BUY'),
  (1011, 1, DATE '2026-06-03', 224.65, 250, 'XNAS', 'SELL'),
  (1033, 3, DATE '2026-06-09', 225.60, 250, 'XNYS', 'SELL'),
  (1022, 2, DATE '2026-06-10', 484.12, 7500, 'XNAS', 'BUY'),
  (1010, 1, DATE '2026-06-18', 236.69, 500, 'XNAS', 'SELL'),
  (1021, 2, DATE '2026-06-20', 483.72, 12000, 'XNAS', 'SELL'),
  (1032, 3, DATE '2026-06-22', 223.88, 1000, 'XNYS', 'SELL'),
  (1043, 4, DATE '2026-06-22', 112.34, 1500, 'XNYS', 'BUY'),
  (1054, 5, DATE '2026-06-24', 149.53, 5000, 'XNYS', 'SELL'),
  (1053, 5, DATE '2026-06-25', 155.12, 5000, 'XNYS', 'BUY');
