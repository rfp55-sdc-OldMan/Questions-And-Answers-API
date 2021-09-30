-- DROP DATABASE IF EXISTS q_and_a;
CREATE DATABASE q_and_a;

-- DROP TABLE IF EXISTS product;

-- CREATE TABLE product (
--   id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
--   PRIMARY KEY (id)
-- );
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS answers;
DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id SERIAL PRIMARY KEY,
  product_id INTEGER NULL DEFAULT NULL,
  body TEXT NULL DEFAULT NULL,
  date_written BIGINT NULL DEFAULT NULL,
  asker_name TEXT NULL DEFAULT NULL,
  asker_email TEXT NULL DEFAULT NULL,
  reported TEXT NULL DEFAULT NULL,
  helpful INTEGER NULL DEFAULT NULL
);

CREATE TABLE answers (
  id SERIAL PRIMARY KEY,
  question_id INTEGER NULL DEFAULT NULL,
  body TEXT NULL DEFAULT NULL,
  date_written BIGINT NULL DEFAULT NULL,
  answerer_name TEXT NULL DEFAULT NULL,
  answerer_email TEXT NULL DEFAULT NULL,
  helpfullness INTEGER NULL DEFAULT NULL,
  reported TEXT NULL DEFAULT NULL
);

CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  answer_id INTEGER NULL DEFAULT NULL,
  url TEXT NULL DEFAULT NULL
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE answers ADD FOREIGN KEY (question_id) REFERENCES questions (id);
ALTER TABLE photos ADD FOREIGN KEY (answer_id) REFERENCES answers (id);

COPY questions FROM 'NOTFULLPATH........seeds/questions.csv' ( FORMAT CSV, DELIMITER(',') , HEADER);

COPY answers FROM 'NOTFULLPATH........seeds/answers.csv' ( FORMAT CSV, DELIMITER(',') , HEADER);

COPY photos FROM 'NOTFULLPATH........seeds/answers_photos.csv' ( FORMAT CSV, DELIMITER(',') , HEADER);