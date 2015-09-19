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