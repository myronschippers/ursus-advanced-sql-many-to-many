-- Person Table
CREATE TABLE "person" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(25)
);

INSERT INTO "person" ("name")
VALUES ('Scott'),
('Rachael'),
('Myron');

INSERT INTO "person" ("name")
VALUES ('Andrew'),
('Colby'),
('Courtney');

-- Hobby Table
CREATE TABLE "hobby" (
	"id" SERIAL PRIMARY KEY,
	"description" VARCHAR(100)
);

INSERT INTO "hobby" ("description")
VALUES ('Cooking'),
('Playing Videogames'),
('Cycling'),
('Reading'),
('Netflix Binging'),
('Rock Climbing'),
('Collecting Vast Amount of Pens'),
('Hiking');

-- SELECTING hobbies or people
SELECT * FROM "person";
SELECT * FROM "hobby";

-- CONNECT the data in a junction table
CREATE TABLE "person_hobby" (
	"id" SERIAL PRIMARY KEY,
	"skill" INT,
	"person_id" INT REFERENCES "person" NOT NULL, 
	"hobby_id" INT REFERENCES "hobby" NOT NULL
);

INSERT INTO "person_hobby" ("person_id", "hobby_id")
VALUES (1, 2),
(1, 4),
(1, 8),
(2, 4),
(2, 7),
(2, 3),
(3, 1),
(3, 2),
(3, 5),
(4, 6),
(4, 8),
(4, 3),
(5, 3),
(5, 1),
(5, 7),
(6, 5),
(6, 4),
(6, 6);

-- Junction Table
SELECT * FROM "person_hobby";

-- JOIN with person data
SELECT * FROM "person"
JOIN "person_hobby" ON "person".id = "person_hobby".person_id;

-- Add in Hobby data
SELECT * FROM "person"
JOIN "person_hobby" ON "person".id = "person_hobby".person_id
JOIN "hobby" ON "person_hobby".hobby_id = "hobby".id;


-- Want to see hobby desc with person name
SELECT "person".name, "hobby".description  FROM "person"
JOIN "person_hobby" ON "person".id = "person_hobby".person_id
JOIN "hobby" ON "person_hobby".hobby_id = "hobby".id;

-- AGGREGATION

--how many people
SELECT count(*) as "total_peeps" FROM "person";

-- Minimum skill level
SELECT MIN("skill") FROM "person_hobby";

-- Maximum skill level
SELECT MAX("skill") FROM "person_hobby";

SELECT AVG("skill") FROM "person_hobby";

SELECT SUM("skill") FROM "person_hobby";

SELECT MAX("skill"), MIN("skill") FROM "person_hobby";

-- How many users have each hobby?
SELECT "hobby".description, count("person_hobby".hobby_id) FROM "hobby"
JOIN "person_hobby" ON "hobby".id = "person_hobby".hobby_id
GROUP BY "hobby".description;
