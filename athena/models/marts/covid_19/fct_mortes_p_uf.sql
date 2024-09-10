{{ config(
    tags=["marts", "covid_19"]
) }}

with fonte as (
    select 
        *
    from {{ ref('int_mortes_p_uf') }}
)

select 
    *
from fonte