CREATE DATABASE automated_reporting;

USE automated_reporting;

CREATE TABLE sales_fact (
    order_id INT,
    order_item_id INT,
    order_date DATE,
    customer_id INT,
    store_id INT,
    product_id INT,
    category_id INT,
    supplier_id INT,
    promotion_id INT,
    city_customer VARCHAR(100),
    city_store VARCHAR(100),
    qty INT,
    price DECIMAL(12,2),
    discount DECIMAL(5,2),
    gross_revenue DECIMAL(14,2),
    discount_amount DECIMAL(14,2),
    net_revenue DECIMAL(14,2),
    return_count INT,
    refund_amount DECIMAL(14,2),
    is_returned TINYINT,
    net_revenue_after_refund DECIMAL(14,2)
);