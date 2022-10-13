-- SELECT make, model, price
-- FROM cars
-- WHERE make NOT IN ("Toyota", "Mercury", "Volvo")
-- GROUP BY price
-- HAVING year > 2007
-- ORDER BY make;
SELECT make, model, year, max(price), color
FROM cars
WHERE make NOT IN ("Toyota", "Mercury", "Volvo")
GROUP BY year
HAVING color NOT IN ("Pink", "Turquoise") AND count(*) > 1
ORDER BY year DESC;
