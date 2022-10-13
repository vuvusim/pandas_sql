-- Platesnis WHERE panaudojimas, BETWEEN.... AND....
SELECT * FROM cars WHERE price BETWEEN 10000 AND 30000;
-- galima tikrinti ir pagal sarasa
SELECT * FROM cars WHERE year IN (2005, 2010, 2011) ORDER BY year;
-- paieska tekste
SELECT * FROM cars WHERE make LIKE "T%";
SELECT * FROM cars WHERE make LIKE "%a";
SELECT * FROM cars WHERE make LIKE "%t%";
-- placeholderis - vieno simbolio kozeris
SELECT * FROM cars WHERE model LIKE "__";
SELECT * FROM cars WHERE model LIKE "X_";
SELECT * FROM cars WHERE model LIKE "X%";
SELECT * FROM cars WHERE make LIKE "__n%";
-- operacijos su NULL
SELECT * FROM cars WHERE color IS NULL;
UPDATE cars SET color="Ugly" WHERE color IS NULL;
-- Logines salygos AND, OR, NOT
SELECT * FROM cars WHERE make="Ford" AND price > 40000;
SELECT * FROM cars WHERE price < 40000 OR color="Pink";
SELECT * FROM cars WHERE (price < 40000 OR color="Pink") AND year > 2000;
SELECT * FROM cars WHERE price < 40000 OR color="Pink" AND year > 2000;
SELECT * FROM cars WHERE color NOT IN ("Violet", "Pink", "Yellow", "Turquoise", "Ugly", "Fuscia");
-- pirmas (=) antras (NOT) trecias (AND) ketvirtas (OR)
SELECT * FROM cars WHERE (make="Volvo" OR make="Ford") AND price NOT BETWEEN 10000 AND 50000;
-- Rusiavimas
SELECT * FROM cars ORDER BY year;
SELECT * FROM cars ORDER BY year DESC LIMIT 5;
SELECT * FROM cars ORDER BY year DESC LIMIT 5 OFFSET 5;
SELECT * FROM cars ORDER BY make;
-- nekreipti demesio i raidziu dydi
SELECT * FROM cars WHERE make="TOYOTA" COLLATE NOCASE;
-- rezultatu manipuliavimas su || operatorium
SELECT "Gamintojas: " || make, model FROM cars LIMIT 10;
SELECT "Gamintojas: " || make AS gamintojas, model FROM cars LIMIT 10;
SELECT "Gamintojas: " || make AS gamintojas, model AS modelis FROM cars LIMIT 10;
SELECT make, model, price, round(price/3.4528, 2) as price_euro FROM cars;
SELECT make || " " || model || ", " || year as car_model_year FROM cars ORDER BY year;
-- amziaus skaiciavimas
SELECT make, model, 2022 - year AS age FROM cars ORDER BY age;
SELECT make, model, price, round(price/1.18, 2) as price_ex_VAT FROM cars;
SELECT make, model, price, round(price/1.18, 2) as "price ex VAT" FROM cars ORDER BY "price ex VAT";
-- Teisingas grupavimas
-- avg() - vidurkis
-- min() - minimum
-- max() - maximum
-- count() - skaiciuoja
-- sum() - sumuoja
SELECT sum(price) FROM cars;
SELECT make, sum(price) FROM cars GROUP BY make;
SELECT avg(year) FROM cars;
SELECT avg(year) FROM cars GROUP BY make;
SELECT make, avg(year), count(*) FROM cars GROUP BY make HAVING count(*) > 1;
SELECT make, avg(price), count(*) FROM cars GROUP BY make HAVING count(*) > 1;
SELECT min(price), max(price), avg(price) FROM cars;
SELECT max(price), make, model FROM cars;
SELECT color, max(price), avg(price), min(price), make, model, count(*) FROM cars GROUP BY color ORDER BY price DESC; 
SELECT color, avg(price), make, model, count(*) FROM cars GROUP BY color ORDER BY price DESC; 
SELECT color, min(price), make, model, count(*) FROM cars GROUP BY color ORDER BY price DESC; 
SELECT color, round(avg(price), 2), make, model, count(*) FROM cars GROUP BY color ORDER BY price DESC; 