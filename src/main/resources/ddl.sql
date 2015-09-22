CREATE TABLE companies
(
  id             SERIAL PRIMARY KEY NOT NULL,
  name           VARCHAR(250)       NOT NULL,
  key            VARCHAR(50),
  currency       REAL               NOT NULL,
  logo_url       VARCHAR(250)       NOT NULL,
  about          VARCHAR            NOT NULL,
  site_url       VARCHAR(250)       NOT NULL,
  privacy_policy VARCHAR            NOT NULL,
  phone          VARCHAR(50)        NOT NULL
);
CREATE UNIQUE INDEX unique_key ON companies (key);
CREATE TABLE companies_id_seq
(
  sequence_name VARCHAR NOT NULL,
  last_value    BIGINT  NOT NULL,
  start_value   BIGINT  NOT NULL,
  increment_by  BIGINT  NOT NULL,
  max_value     BIGINT  NOT NULL,
  min_value     BIGINT  NOT NULL,
  cache_value   BIGINT  NOT NULL,
  log_cnt       BIGINT  NOT NULL,
  is_cycled     BOOL    NOT NULL,
  is_called     BOOL    NOT NULL
);
CREATE TABLE devices
(
  id          SERIAL PRIMARY KEY NOT NULL,
  brand       VARCHAR(50)        NOT NULL,
  model       VARCHAR(50)        NOT NULL,
  token       VARCHAR(250)       NOT NULL,
  company_key VARCHAR(50)        NOT NULL,
  unique_id   VARCHAR(50)
);
CREATE UNIQUE INDEX unique_unique_id ON devices (unique_id);
CREATE TABLE devices_id_seq
(
  sequence_name VARCHAR NOT NULL,
  last_value    BIGINT  NOT NULL,
  start_value   BIGINT  NOT NULL,
  increment_by  BIGINT  NOT NULL,
  max_value     BIGINT  NOT NULL,
  min_value     BIGINT  NOT NULL,
  cache_value   BIGINT  NOT NULL,
  log_cnt       BIGINT  NOT NULL,
  is_cycled     BOOL    NOT NULL,
  is_called     BOOL    NOT NULL
);
CREATE TABLE news
(
  id            SERIAL PRIMARY KEY NOT NULL,
  photo_url     VARCHAR(250)       NOT NULL,
  modified_date TIMESTAMPTZ        NOT NULL,
  created_date  TIMESTAMPTZ        NOT NULL,
  content       VARCHAR            NOT NULL,
  title         VARCHAR(250)       NOT NULL,
  company_id    INT                NOT NULL,
  FOREIGN KEY (company_id) REFERENCES companies (id)
);
CREATE TABLE news_id_seq
(
  sequence_name VARCHAR NOT NULL,
  last_value    BIGINT  NOT NULL,
  start_value   BIGINT  NOT NULL,
  increment_by  BIGINT  NOT NULL,
  max_value     BIGINT  NOT NULL,
  min_value     BIGINT  NOT NULL,
  cache_value   BIGINT  NOT NULL,
  log_cnt       BIGINT  NOT NULL,
  is_cycled     BOOL    NOT NULL,
  is_called     BOOL    NOT NULL
);
CREATE TABLE products
(
  id          SERIAL PRIMARY KEY NOT NULL,
  photo_url   VARCHAR(250)       NOT NULL,
  description VARCHAR            NOT NULL,
  name        VARCHAR(50)        NOT NULL,
  mark        INT                NOT NULL,
  company_id  INT                NOT NULL,
  FOREIGN KEY (company_id) REFERENCES companies (id)
);
CREATE TABLE products_id_seq
(
  sequence_name VARCHAR NOT NULL,
  last_value    BIGINT  NOT NULL,
  start_value   BIGINT  NOT NULL,
  increment_by  BIGINT  NOT NULL,
  max_value     BIGINT  NOT NULL,
  min_value     BIGINT  NOT NULL,
  cache_value   BIGINT  NOT NULL,
  log_cnt       BIGINT  NOT NULL,
  is_cycled     BOOL    NOT NULL,
  is_called     BOOL    NOT NULL
);
CREATE TABLE users
(
  id               SERIAL PRIMARY KEY NOT NULL,
  full_name        VARCHAR(250)       NOT NULL,
  email            VARCHAR(50)        NOT NULL,
  gender           VARCHAR(25)        NOT NULL,
  birthday         TIMESTAMPTZ        NOT NULL,
  promotional_code INT                NOT NULL,
  device_id        INT                NOT NULL,
  FOREIGN KEY (device_id) REFERENCES devices (id)
);
CREATE TABLE users_id_seq
(
  sequence_name VARCHAR NOT NULL,
  last_value    BIGINT  NOT NULL,
  start_value   BIGINT  NOT NULL,
  increment_by  BIGINT  NOT NULL,
  max_value     BIGINT  NOT NULL,
  min_value     BIGINT  NOT NULL,
  cache_value   BIGINT  NOT NULL,
  log_cnt       BIGINT  NOT NULL,
  is_cycled     BOOL    NOT NULL,
  is_called     BOOL    NOT NULL
);
