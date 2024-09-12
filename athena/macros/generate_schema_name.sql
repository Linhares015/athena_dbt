{% macro generate_schema_name(custom_schema_name, node) %}
    {%- set default_schema = target.schema -%}

    {%- if target.user == 'postgres' -%}
        {{ default_schema }}
    {%- else -%}
        {# Lógica para determinar o schema baseado na pasta #}
        {%- if 'staging' in node.path -%}
            {{ default_schema }}_staging
        {%- elif 'intermediate' in node.path -%}
            {{ default_schema }}_intermediate
        {%- elif 'marts' in node.path -%}
            {{ default_schema }}_marts
        {%- else -%}
            dbt_{{ env_var('DBT_USER') }}
        {%- endif -%}
    {%- endif -%}
{% endmacro %}
