CREATE TABLE country (
  id INTEGER,
  country TEXT NOT NULL UNIQUE,
  PRIMARY KEY (id)
);

CREATE TABLE regulation (
  id INTEGER,
  information TEXT NOT NULL,
  event TEXT NOT NULL,
  country INTEGER NOT NULL,
  reference TEXT NOT NULL,
  FOREIGN KEY(country) REFERENCES country(id),
  PRIMARY KEY (id)
);

CREATE TABLE event (
  id INTEGER,
  name TEXT NOT NULL,
  PRIMARY KEY (id)
 );