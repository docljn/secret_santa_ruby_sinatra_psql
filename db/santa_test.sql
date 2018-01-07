-- santa_test.sql

DROP TABLE IF EXISTS pairs;
DROP TABLE IF EXISTS participants;
DROP TABLE IF EXISTS teams;

CREATE TABLE teams(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(256)
);

CREATE TABLE participants(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(256),
  email VARCHAR(256),
  preferences VARCHAR(256),
  team_id INT4 REFERENCES teams(id)
);

CREATE TABLE pairs(
  id SERIAL4 PRIMARY KEY,
  santa_id INT4 REFERENCES participants(id),
  recipient_id INT4 REFERENCES participants(id)
);

-- santa_test.sql
