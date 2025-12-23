-- Avval bizga kerakli table yaratib olamiz
-- First, let's create the necessary table.
-- Сначала создадим необходимую таблицу.

CREATE TABLE stg_orders (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(50),
    order_date TEXT,
    ship_date TEXT,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,
    sales DECIMAL(15, 2),
    quantity INT,
    discount DECIMAL(5, 2),
    profit DECIMAL(15, 2),
    profit_margin DECIMAL(15, 4)
);

-- Sana ustunlaridagi malumotlar import qilishda mos topilmagani ushun
-- ustunlarni text type da yaratib olib endi san type ga almashtiramiz

--Due to formatting mismatches during import, the date columns were initially created as text;
-- we will now convert them to the date type.

-- Из-за несоответствия форматов при импорте столбцы с датами были созданы как текстовые;
-- теперь мы преобразуем их в тип даты (date).

ALTER TABLE stg_orders
ALTER COLUMN order_date TYPE  DATE USING order_date::DATE,
ALTER COLUMN ship_date TYPE DATE USING ship_date::DATE;

