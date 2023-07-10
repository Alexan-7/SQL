DROP DATABASE IF EXISTS homework_2;
CREATE DATABASE homework_2;
USE homework_2;

# 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY, -- id SERIAL PRIMARY KEY,
	order_date DATE NOT NULL,
    count_product INT
);

-- заполнение таблицы
INSERT INTO `sales` (order_date, count_product)
VALUES -- id не надо - само заполнится
	('2022-01-01', 156),
	('2022-01-02', 180),
	('2022-01-03', 21),
	('2022-01-04', 124),
	('2022-01-05', 341);

SELECT * FROM homework_2.sales;

# 2. Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва 
SELECT
	id AS 'ID заказа',
    -- count_product AS 'Количество товара',
	CASE
		WHEN count_product < 100 THEN 'Маленький заказ'
		WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
		WHEN count_product > 300 THEN 'Крупный заказ'
		ELSE 'Не определено'
	END AS 'Тип'
FROM sales;

# 3. Создайте таблицу “orders”, заполните ее значениями
# слайд 29
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY, -- id SERIAL PRIMARY KEY,
	employee_id VARCHAR(10) NOT NULL,
	amount DECIMAL(10, 2), -- https://metanit.com/sql/mysql/2.3.php
    order_status VARCHAR(20)
);

-- заполнение таблицы
INSERT INTO `orders` (employee_id, amount, order_status)
VALUES -- id не надо - само заполнится
	('e03', 15.00, 'OPEN'),
	('e01', 25.50, 'OPEN'),
	('e05', 100.70, 'CLOSED'),
	('e02', 22.18, 'OPEN'),
	('e04', 9.50, 'CANCELLED');

SELECT * FROM homework_2.orders;

/*
Выберите все заказы. В зависимости от поля order_status выведите столбец 
full_order_status: OPEN – «Order is in open state» ; CLOSED - «Order is closed»; 
CANCELLED -  «Order is cancelled»
*/

-- добавление нового столбца в таблицу
ALTER TABLE orders
ADD COLUMN full_order_status VARCHAR(20);

SELECT id, employee_id, amount, order_status,
    IF (order_status = 'OPEN', 'Order is in open state',
		IF (order_status = 'CLOSED', 'Order is closed',
			IF (order_status = 'CANCELLED', 'Order is cancelled', 'Не определено'
            )
		)
	) AS full_order_status
FROM homework_2.orders;

# 4. Чем 0 отличается от NULL?
/*
0 отличается от NULL, скорее всего, тем, что цифра 0 воспринимается как 
число или как FALSE, а NULL - это просто пустое значение значение ячейки. 
Догадался, когда прорабатывал таблицу movies с семинара, где у фильма 
'Криминальное чтиво' стоит NULL в колонке storyline.
Интернет подтвердил это (сначала я сам догадался).
*/