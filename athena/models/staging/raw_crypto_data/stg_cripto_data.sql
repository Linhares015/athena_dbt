with source as (
    select
        id
        , symbol
        , low_24h
        , ath_date
        , atl_date
        , high_24h
        , market_cap
        , max_supply
        , last_updated
        , total_supply
        , total_volume
        , current_price
        , market_cap_rank
        , price_change_24h
        , circulating_supply
        , _airbyte_extracted_at as date_extracted
    from {{ source('cripto_data', 'crypto_data') }}
)

select
    *
from source