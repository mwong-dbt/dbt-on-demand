{% macro cents_to_dollars(cents_column, decimal_places=2) -%}
  ({{cents_column}} / 100) ::decimal(16,{{decimal_places}})
{%- endmacro %}