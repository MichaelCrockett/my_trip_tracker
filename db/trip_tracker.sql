DROP TABLE trips;
DROP TABLE sights;
DROP TABLE countries;
DROP TABLE cities;



CREATE TABLE trips (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE sights (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE countries (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE cities (
  id SERIAL8 primary key,
  name VARCHAR(255));
