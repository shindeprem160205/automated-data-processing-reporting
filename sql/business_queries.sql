SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(DISTINCT product_id) AS unique_products,
    COUNT(DISTINCT store_id) AS unique_stores
FROM sales_fact;
SELECT
    COUNT(*) AS total_rows,
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(order_item_id IS NULL) AS missing_order_item_id,
    SUM(order_date IS NULL) AS missing_order_date,
    SUM(customer_id IS NULL) AS missing_customer_id,
    SUM(product_id IS NULL) AS missing_product_id,
    SUM(qty IS NULL) AS missing_qty,
    SUM(price IS NULL) AS missing_price,
    SUM(net_revenue IS NULL) AS missing_net_revenue
FROM sales_fact;
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_item_id) AS unique_order_items
FROM sales_fact;
SELECT
    COUNT(*) AS total_rows,
    SUM(gross_revenue < 0) AS negative_gross_revenue,
    SUM(discount_amount < 0) AS negative_discount,
    SUM(net_revenue < 0) AS negative_net_revenue
FROM sales_fact;

SELECT
    COUNT(*) AS total_items,
    SUM(is_returned = 1) AS returned_items,
    SUM(is_returned = 0) AS non_returned_items,
    SUM(refund_amount) AS total_refund
FROM sales_fact;
SELECT
    SUM(gross_revenue) AS gross_sales,
    SUM(discount_amount) AS total_discount,
    SUM(net_revenue) AS net_sales,
    SUM(refund_amount) AS total_refund,
    SUM(net_revenue_after_refund) AS final_revenue
FROM sales_fact;
USE automated_reporting;



SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(DISTINCT product_id) AS unique_products,
    COUNT(DISTINCT store_id) AS unique_stores
FROM sales_fact;



SELECT
    COUNT(*) AS total_rows,
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(order_item_id IS NULL) AS missing_order_item_id,
    SUM(order_date IS NULL) AS missing_order_date,
    SUM(customer_id IS NULL) AS missing_customer_id,
    SUM(product_id IS NULL) AS missing_product_id,
    SUM(qty IS NULL) AS missing_qty,
    SUM(price IS NULL) AS missing_price,
    SUM(net_revenue IS NULL) AS missing_net_revenue
FROM sales_fact;



SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_item_id) AS unique_order_items
FROM sales_fact;


SELECT
    COUNT(*) AS total_rows,
    SUM(gross_revenue < 0) AS negative_gross_revenue,
    SUM(discount_amount < 0) AS negative_discount,
    SUM(net_revenue < 0) AS negative_net_revenue
FROM sales_fact;



SELECT
    COUNT(*) AS total_items,
    SUM(is_returned = 1) AS returned_items,
    SUM(is_returned = 0) AS non_returned_items,
    SUM(refund_amount) AS total_refund
FROM sales_fact;

SELECT
    SUM(gross_revenue) AS gross_sales,
    SUM(discount_amount) AS total_discount,
    SUM(net_revenue) AS net_sales,
    SUM(refund_amount) AS total_refund,
    SUM(net_revenue_after_refund) AS final_revenue
FROM sales_fact;


SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(net_revenue_after_refund) AS revenue
FROM sales_fact
GROUP BY month
ORDER BY month;



SELECT
    store_id,
    city_store,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(qty) AS total_quantity,
    SUM(net_revenue_after_refund) AS revenue
FROM sales_fact
GROUP BY
    store_id,
    city_store
ORDER BY revenue DESC;


SELECT
    category_id,
    COUNT(DISTINCT product_id) AS total_products,
    SUM(qty) AS total_quantity,
    SUM(net_revenue_after_refund) AS revenue
FROM sales_fact
GROUP BY category_id
ORDER BY revenue DESC;


SELECT
    product_id,
    SUM(qty) AS units_sold,
    SUM(net_revenue_after_refund) AS revenue
FROM sales_fact
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;


SELECT
    customer_id,
    city_customer,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(net_revenue_after_refund) AS revenue
FROM sales_fact
GROUP BY
    customer_id,
    city_customer
ORDER BY revenue DESC
LIMIT 10;

SELECT
    promotion_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(gross_revenue) AS gross_sales,
    SUM(discount_amount) AS total_discount,
    SUM(net_revenue_after_refund) AS final_revenue
FROM sales_fact
GROUP BY promotion_id
ORDER BY final_revenue DESC;


SELECT
    COUNT(*) AS total_items,
    SUM(is_returned = 1) AS returned_items,
    ROUND(
        SUM(is_returned = 1) * 100.0 / COUNT(*),
        2
    ) AS return_rate_percent
FROM sales_fact;


SELECT
    city_store,
    COUNT(DISTINCT store_id) AS total_stores,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(qty) AS total_quantity,
    SUM(net_revenue_after_refund) AS revenue
FROM sales_fact
GROUP BY city_store
ORDER BY revenue DESC;