with source as (

    select *
    from {{ source('raw', 'RAW_FORMULA1_2025SEASON_DRIVEROFTHEDAYVOTES') }}

),

renamed as (

    select

        -- race identifier
        ROUND as race_number,

        -- season
        2025 as season_year,

        -- source race description
        TRACK as track_name,

        -- voting results
        FIRST_PLACE as first_place_driver,
        cast(FIRST_PLACE_PERCENT as float) as first_place_vote_pct,

        SECOND_PLACE as second_place_driver,
        cast(SECOND_PLAC_PERCENT as float) as second_place_vote_pct,

        THIRD_PLACE as third_place_driver,
        cast(THIRD_PLAC_PERCENT as float) as third_place_vote_pct,

        FOURTH_PLACE as fourth_place_driver,
        cast(FOURTH_PLACE_PERCENT as float) as fourth_place_vote_pct,

        FIFTH_PLACE as fifth_place_driver,
        cast(FIFTH_PLAC_PERCENT as float) as fifth_place_vote_pct

    from source

)

select *
from renamed