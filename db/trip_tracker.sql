DROP TABLE sights;
DROP TABLE trips;
DROP TABLE countries;
DROP TABLE cities;

CREATE TABLE countries (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE trips (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE cities (
  id SERIAL4 primary key,
  name VARCHAR(255),
  country_id int4 REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE sights (
  id SERIAL4 primary key,
  name VARCHAR(255),
  city_id int4 REFERENCES cities(id) ON DELETE CASCADE
);
