SELECT
  order_id
  , SUM(amount)
FROM {{ ref('stg_payments') }}
group by 1
having not (sum(amount) >= 0)
