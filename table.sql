DROP TABLE Actor;
CREATE TABLE Actor (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255),
  cname varchar(255),
  party varchar(255),

  CONSTRAINT ac UNIQUE (name, cname, party),
  PRIMARY KEY (id)
);


DROP TABLE Bill;
CREATE TABLE Bill (
  id varchar(255) NOT NULL UNIQUE,
  title varchar(255),
  summary varchar(1024),
  proposedby varchar(1024),

  cdate DATE,
  pdate DATE,

  summaryHTML TEXT,
  coActorHTML TEXT,
  billHTML TEXT,

  collected date,
  processed int(1),
  PRIMARY KEY (id)
);


DROP TABLE CoActor;
CREATE TABLE CoActor (
  billid varchar(255) NOT NULL,
  actorid int NOT NULL,
  proposed int,
  FOREIGN KEY (actorid) REFERENCES Actor(id),
  FOREIGN KEY (billid) REFERENCES Bill(id),
  CONSTRAINT cac UNIQUE (billid, actorid, proposed)
);



DROP TABLE HTML;


CREATE USER 'trend'@'localhost' IDENTIFIED BY 'only!trend!';
GRANT ALL PRIVILEGES ON assembly.* TO 'trend'@'localhost';
