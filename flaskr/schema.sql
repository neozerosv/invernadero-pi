DROP TABLE IF EXISTS grupo;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS site;
DROP TABLE IF EXISTS sensor;
DROP TABLE IF EXISTS alert;
DROP TABLE IF EXISTS invernadero1;

CREATE TABLE grupo (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL,
  description TEXT NOT NULL
);
INSERT INTO grupo(name,description) VALUES('admin','Administrador de todo');

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  grupo_id INTEGER NOT NULL,
  FOREIGN KEY (grupo_id) REFERENCES grupo (id)
);
INSERT INTO user(username,password,grupo_id) VALUES('admin','admin',1); 

CREATE TABLE site (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL,
  description TEXT NOT NULL
);
INSERT INTO site(name,description) VALUES('invernadero01','Invernadero 1');


CREATE TABLE sensor (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  site_id INTEGER NOT NULL,
  datatype TEXT NOT NULL,
  FOREIGN KEY (site_id) REFERENCES site (id),
  CHECK ( datatype IN ('integer','real','datetime'))
);
INSERT INTO sensor(name,site_id,datatype) VALUES('temperatura',1,'real');
INSERT INTO sensor(name,site_id,datatype) VALUES('humedad',1,'real');

CREATE TABLE alert (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);


CREATE TABLE sitetableinvernadero1 (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  date datetime, 
  cTemp real, 
  humidity real
);
INSERT INTO sitetableinvernadero1(date,cTemp,humidity) VALUES('20190405115900','23.9','50.0');
INSERT INTO sitetableinvernadero1(date,cTemp,humidity) VALUES('20190405115910','24.9','60.0');
INSERT INTO sitetableinvernadero1(date,cTemp,humidity) VALUES('20190405115920','25.9','70.0');
INSERT INTO sitetableinvernadero1(date,cTemp,humidity) VALUES('20190405115930','23.9','65.0');
INSERT INTO sitetableinvernadero1(date,cTemp,humidity) VALUES('20190405115940','22.9','50.0');
INSERT INTO sitetableinvernadero1(date,cTemp,humidity) VALUES('20190405115950','21.9','48.0');
