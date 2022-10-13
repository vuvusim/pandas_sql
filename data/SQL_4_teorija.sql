CREATE TABLE coder (
	first_name VARCHAR(50),
	last_name VARCHAR(100),
	email VARCHAR(255),
	age INTEGER,
	xp_years INTEGER
);

CREATE TABLE teams (
	id INTEGER PRIMARY KEY NOT NULL, 
	name VARCHAR(50) NOT NULL
);


	
CREATE TABLE coders (
	id INTEGER PRIMARY KEY NOT NULL,
	first_name 	VARCHAR(50) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(255) UNIQUE,
	age INTEGER CHECK (age > 17 AND age < 75),
	xp_years INTEGER CHECK (xp_years > 0 AND xp_years < 50), 
	team_id INTEGER, 
	FOREIGN KEY (team_id) REFERENCES teams (id)
);

CREATE TABLE tasks (
	id INTEGER PRIMARY KEY NOT NULL,
	name VARCHAR(255) NOT NULL,
	description TEXT,
	coder_id INTEGER,
	FOREIGN KEY (coder_id) REFERENCES coders(id)
);

UPDATE coders SET xp_years=round((age - 18)/2);

CREATE TABLE teams (id INTEGER PRIMARY KEY NOT NULL, name VARCHAR(50) NOT NULL);

-- SQLite sucks nepalaiko
-- ALTER TABLE coders SET CONSTRAINT fk_coders_teams FOREIGN KEY (team_id) REFERENCES teams (id);

INSERT INTO "teams" ("name") VALUES ('Back End');
INSERT INTO "teams" ("name") VALUES ('DevOps');
INSERT INTO "teams" ("name") VALUES ('Front End');

INSERT INTO "coders" ("first_name", "last_name", "email", "age", "team_id") VALUES ('Jonas', 'Jonaitis', 'jj@gmail.com', '20', '1');
INSERT INTO "coders" ("first_name", "last_name", "email", "age", "team_id") VALUES ('Antanas', 'Antanaitis', 'aa@gmail.com', '25', '1');
INSERT INTO "coders" ("first_name", "last_name", "email", "age", "team_id") VALUES ('Juozas', 'Juozaitis', 'jj@hotmail.com', '30', '2');
INSERT INTO "coders" ("first_name", "last_name", "email", "age", "team_id") VALUES ('Petras', 'Petraitis', 'pp@mail.lt', '29', '2');
INSERT INTO "coders" ("first_name", "last_name", "email", "age", "team_id") VALUES ('Virgis', 'Virgutis', 'vv@gmail.com', '21', '3');
INSERT INTO "coders" ("first_name", "last_name", "email", "age", "team_id") VALUES ('Tomas', 'Aidietis', 'ta@imone.lt', '35', '3');

INSERT INTO "tasks" ("name", "coder_id") VALUES ('Sutvarkyti DB', '5');
INSERT INTO "tasks" ("name", "coder_id") VALUES ('Perdaryti dizainą', '1');
INSERT INTO "tasks" ("name", "coder_id") VALUES ('Perdaryti formas', '2');
INSERT INTO "tasks" ("name", "coder_id") VALUES ('Atnaujinti tvarkykles', '6');
INSERT INTO "tasks" ("name", "coder_id") VALUES ('Perkrauti serverius', '5');
INSERT INTO "tasks" ("name", "coder_id") VALUES ('Atnaujinti bibliotekas', '6');
INSERT INTO "tasks" ("name", "coder_id") VALUES ('Pakeisti logotipus', '2');
INSERT INTO "tasks" ("name", "coder_id") VALUES ('Atnaujinti dokumentaciją', '3');
INSERT INTO "tasks" ("name", "coder_id") VALUES ('Ištestuoti programą', '4');
INSERT INTO "tasks" ("name", "coder_id") VALUES ('Perdaryti API', '4');

CREATE TABLE skills (
	id integer PRIMARY KEY NOT NULL, 
	name VARCHAR(50)
);

INSERT INTO "skills" ("name") VALUES ('Python');
INSERT INTO "skills" ("name") VALUES ('JS');
INSERT INTO "skills" ("name") VALUES ('CSS');
INSERT INTO "skills" ("name") VALUES ('Go');
INSERT INTO "skills" ("name") VALUES ('AWS');
INSERT INTO "skills" ("name") VALUES ('Linux');

CREATE TABLE coders_skills (
	coder_id INTEGER,
	skill_id INTEGER,
	FOREIGN KEY (coder_id) REFERENCES coders(id),
	FOREIGN KEY (skill_id) REFERENCES skills(id)
);

INSERT INTO "coders_skills" ("coder_id", "skill_id") VALUES ('1', '2');
INSERT INTO "coders_skills" ("coder_id", "skill_id") VALUES ('1', '3');
INSERT INTO "coders_skills" ("coder_id", "skill_id") VALUES ('2', '2');
INSERT INTO "coders_skills" ("coder_id", "skill_id") VALUES ('2', '3');
INSERT INTO "coders_skills" ("coder_id", "skill_id") VALUES ('3', '1');
INSERT INTO "coders_skills" ("coder_id", "skill_id") VALUES ('3', '4');
INSERT INTO "coders_skills" ("coder_id", "skill_id") VALUES ('4', '1');
INSERT INTO "coders_skills" ("coder_id", "skill_id") VALUES ('4', '6');
INSERT INTO "coders_skills" ("coder_id", "skill_id") VALUES ('5', '4');
INSERT INTO "coders_skills" ("coder_id", "skill_id") VALUES ('5', '5');
INSERT INTO "coders_skills" ("coder_id", "skill_id") VALUES ('6', '5');
INSERT INTO "coders_skills" ("coder_id", "skill_id") VALUES ('6', '6');

SELECT first_name, last_name, skills.name 
	FROM coders_skills 
	JOIN coders ON coder_id=coders.id 
	JOIN skills ON skill_id=skills.id;

	
CREATE TABLE passwords (
	id INTEGER PRIMARY KEY NOT NULL, 
	coder_id INTEGER UNIQUE, 
	pwd VARCHAR(255), 
	FOREIGN KEY (coder_id) REFERENCES coders(id)
);

INSERT INTO "passwords" ("coder_id", "pwd") VALUES ('1', '12345');
INSERT INTO "passwords" ("coder_id", "pwd") VALUES ('2', 'verisykret');
INSERT INTO "passwords" ("coder_id", "pwd") VALUES ('3', 'qwerty');
INSERT INTO "passwords" ("coder_id", "pwd") VALUES ('4', 'uauauai');
INSERT INTO "passwords" ("coder_id", "pwd") VALUES ('5', 'slaptazodis');
INSERT INTO "passwords" ("coder_id", "pwd") VALUES ('6', 'barzda');

SELECT first_name, pwd FROM coders 
	JOIN passwords ON passwords.coder_id=coders.id;
	
SELECT first_name, pwd FROM passwords 
	JOIN coders ON passwords.coder_id=coders.id;
	
	
