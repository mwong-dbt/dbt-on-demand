{% set order_status = ["completed","returned","return_pending","placed","shipped"] %}

select 
  order_id
  {%- for order_statuses in order_status %}
  , sum( case when status = '{{order_statuses}}' then amount else 0 end ) AS {{order_statuses}}_amount
  {%- endfor %}
from {{ ref('fct_orders') }}
group by 1