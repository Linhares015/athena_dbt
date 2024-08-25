with int_cripto_data as (
    select 
        *
    from {{ ref('int_analise_crypto') }}
)

select 
*
from int_cripto_data