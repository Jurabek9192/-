-- Table dan xatoliklarni qidirib ko'ramiz
-- Let's search for errors and inconsistencies within the table.
-- Проверим таблицу на наличие ошибок и несоответствий.

SELECT
    COUNT(*)-COUNT(s.order_id) AS null_orders,
    COUNT(*)-COUNT(s.customer_id) AS null_customers,
    COUNT(*)-COUNT(s.sales) AS null_sales
FROM stg_orders s;

-- Endi Dublikatlarni tekshiramiz
-- Now, let's check for duplicate records.
-- Теперь проверим записи на наличие дубликатов.

SELECT s.order_id, s.product_id, COUNT(*)
FROM stg_orders s
GROUP BY s.order_id, s.product_id
HAVING COUNT(*)>1;

-- Bizda xatoliklar topildi buni yaxshilab tekshirishimiz kerak bo'ladi

-- Errors have been detected; we need to perform a thorough investigation.

-- Обнаружены ошибки; нам необходимо провести тщательную проверку.

SELECT * FROM stg_orders
WHERE order_id IN (
    SELECT order_id FROM stg_orders
        GROUP BY order_id, product_id
        HAVING COUNT(*) > 1
    )
ORDER BY order_id;

-- Ma'lumotlar to'la bir xil emasligini ko'rishimiz mumkin
-- We can observe that the data is not entirely consistent.
-- Мы видим, что данные не полностью идентичны.

-- Mantiqiy xatolarni tekshirish
-- Checking for logical errors.
-- Проверка логических ошибок.

SELECT * FROM stg_orders
WHERE sales<=0 OR quantity<=0;

-- Mantiqiy xatolar topilmadi
-- No logical errors were found.
-- Логических ошибок не обнаружено.