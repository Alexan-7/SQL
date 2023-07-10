DROP DATABASE IF EXISTS lesson_3;
CREATE DATABASE lesson_3;
USE lesson_3;

-- Персонал
DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(100),
	seniority INT, 
	salary INT, 
	age INT
);

-- Наполнение данными
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 19),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

-- Проверка 
SELECT id, firstname, lastname, post, seniority, salary, age  FROM staff;

-- 1. Выведите все записи, отсортированные по полю "salary" по возрастанию - ASC или по дефолту
-- SELECT * FROM staff ORDER BY salary ASC;
SELECT * FROM staff ORDER BY salary;

-- 1. Выведите все записи, отсортированные по полю "salary" по убыванию - DESC
SELECT * FROM staff ORDER BY salary DESC;

-- 2. Выведите 5 максимальных заработных плат (salary)
SELECT * FROM staff ORDER BY salary DESC LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst) - 2:00:35

SELECT post, SUM(salary) FROM staff 
GROUP BY post
HAVING SUM(salary);

-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(*) FROM staff WHERE post = 'Рабочий' AND age BETWEEN 24 AND 49;

-- 5. Найдите количество специальностей (51:41 мин)
SELECT COUNT(DISTINCT post) FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post, ROUND(AVG(age), 2) AS post_age
FROM staff
GROUP BY post # 1:36:00 мин.
HAVING post_age < 30;