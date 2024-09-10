{{ config(
    tags=["intermediate", "covid_19"]
) }}

with fonte as (
    select 
        extract(month from data_leitura) as mes
        , extract(year from data_leitura) as ano
        , estado
        , mortes
        , populacao_estimada
    from {{ ref('stg_casos') }}
)

select 
    mes
    , ano
    , estado
    , sum(mortes) as mortes
    , sum(populacao_estimada) as populacao_estimada
    , sum(mortes) / sum(populacao_estimada) as taxa_mortalidade
from fonte
group by mes
        , ano
        , estado