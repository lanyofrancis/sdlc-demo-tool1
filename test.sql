-- code validator testing
select * 'abc';



-- -- -- architecture review


-- CREATE OR REPLACE TABLE db_sales_prod.customer_revenue_summary AS

-- SELECT
--     *
-- FROM
--     db_sales_prod.orders o,
--     db_sales_prod.customers c,
--     db_sales_prod.order_items oi
-- WHERE
--     o.customer_id = c.customer_id
--     AND oi.order_id = o.order_id
--     AND o.order_status = active
--     AND o.created_at >= '2020-01-01'
--     AND c.customer_tier IN (
--         SELECT customer_tier
--         FROM db_sales_prod.customers
--         WHERE lifetime_value > (
--             SELECT AVG(lifetime_value)
--             FROM db_sales_prod.customers
--             WHERE region = 'NA'
--         )
--     );


-- CREATE OR REPLACE TABLE db_sales_prod.CustomerMonthlyTotals AS
-- SELECT
--     c.customer_id,
--     c.Customer_Name,
--     c.EMAIL_ADDRESS,
--     c.ssn,
--     SUM(oi.quantity * oi.unit_price) as total,
--     SUM(oi.quantity * oi.unit_price) * 0.0825 as tax,
--     SUM(oi.quantity * oi.unit_price) + (SUM(oi.quantity * oi.unit_price) * 0.0825) as grand_total,
--     COUNT(DISTINCT o.order_id) AS num_orders,
--     MAX(o.created_at) AS last_order
-- FROM db_sales_prod.orders o
-- LEFT JOIN db_sales_prod.customers c ON o.customer_id = c.customer_id
-- LEFT JOIN db_sales_prod.order_items oi ON oi.order_id = o.order_id
-- LEFT JOIN db_sales_prod.refunds r ON r.order_id = o.order_id
-- WHERE r.refund_id IS NULL
-- GROUP BY 1, 2, 3, 4;


-- CREATE OR REPLACE VIEW db_sales_prod.v_active_accounts AS
-- SELECT
--     a.account_id,
--     a.balance / a.credit_limit AS utilization_rate,
--     CAST(a.opened_date AS STRING) AS opened,
--     CASE
--         WHEN a.balance > 10000 THEN 'HIGH'
--         WHEN a.balance > 5000 THEN 'MEDIUM'
--         WHEN a.balance > 1000 THEN 'LOW'
--     END AS balance_band
-- FROM db_sales_prod.accounts a
-- WHERE a.status <> 'CLOSED'
--     AND a.account_id NOT IN (
--         SELECT account_id FROM db_sales_prod.fraud_flags
--     );


-- CREATE OR REPLACE TABLE db_sales_prod.daily_agg AS
-- SELECT
--     DATE(event_timestamp) AS event_date,
--     channel,
--     COUNT(*) AS events
-- FROM db_sales_prod.raw_events
-- GROUP BY 1, 2
-- UNION ALL
-- SELECT
--     DATE(event_timestamp) AS event_date,
--     channel,
--     COUNT(*) AS events
-- FROM db_sales_prod.raw_events_archive
-- GROUP BY 1, 2;



-- -- Demo file for quality gate testing
-- SELECT customer_id, customer_name
-- FROM billing.customers

-- ORDER BY customer_id;
