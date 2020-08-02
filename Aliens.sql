-- Created by: Vince Chang

CREATE DATABASE restdb;

CREATE TABLE alien
(
  id int,
  name varchar(20),
  points int
);

SELECT *
FROM alien;

INSERT INTO alien
VALUES(1, "baloo", 300);

DELETE FROM alien WHERE id=4;