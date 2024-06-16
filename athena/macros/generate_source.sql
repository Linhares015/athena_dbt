{% macro generate_source(schema_name) %}
{{ dbt_utils.generate_source(
    schema_name=schema_name
) }}
{% endmacro %}
