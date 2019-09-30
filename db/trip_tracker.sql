DROP TABLE trips;
DROP TABLE sights;
DROP TABLE countries;
DROP TABLE cities;


CREATE TABLE countries (
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
  city_id int4 REFERENCES cities(id) ON DELETE CASCADE,
  country_id int4 REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE trips (
  id SERIAL4 primary key,
  sight_id int4 REFERENCES sights(id) ON DELETE CASCADE,
  visited BOOLEAN
);
