{% macro generate_schema_name(custom_schema_name, node) %}
    {%- set default_schema = target.schema -%}
    {%- if target.user == 'postgres' -%}
        {{ default_schema }}
    {%- else -%}
        dbt_{{ env_var('DBT_USER') }}
    {%- endif -%}
{% endmacro %}
