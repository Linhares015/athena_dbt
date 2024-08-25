with stg_cripto_data as (
    select 
        *
    from {{ ref('stg_cripto_data') }}
)

, ajustes as (
    select 
        *
        , case 
            when market_cap >= 316708070097 then 'Alto'
            else 'Baixo'
        end as market_cap_range
    from stg_cripto_data
)

select 
    *
from ajustes