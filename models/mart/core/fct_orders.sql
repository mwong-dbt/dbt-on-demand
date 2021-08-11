WITH payments AS (
    SELECT 
    *
    FROM {{ ref('stg_payments') }}
    WHERE status = 'success'
)

SELECT 
  o.order_id
  , o.customer_id
  , o.order_date
  , o.status
  , p.amount
FROM payments p
JOIN {{ ref('stg_orders') }} o
  ON o.order_id  = p.order_id
