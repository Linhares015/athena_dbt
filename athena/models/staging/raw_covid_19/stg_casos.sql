with fonte as (
    select 
        cast("date" as date) as data_leitura
        , "state" as estado
        , cast(deaths as int) as mortes
        , is_last as ultima_atualizacao
        , cast(confirmed as int) as confirmados
        , death_rate as taxa_mortalidade
        , place_type as tipo_local
        , cast(city_ibge_code as int) as codigo_ibge_cidade
        , order_for_place as ordem_local
        , estimated_population as populacao_estimada
        , estimated_population_2019 as populacao_estimada_2019
        , confirmed_per_100k_inhabitants as confirmados_por_100k_habitantes
        , _airbyte_extracted_at as data_extracao
    from {{ source('covid_19', 'caso') }}
)

select 
    *
from fonte