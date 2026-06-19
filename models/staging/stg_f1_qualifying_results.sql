with source as (

    select *
    from {{ source('raw', 'RAW_FORMULA1_2025SEASON_QUALIFYINGRESULTS') }}

),

renamed as (

    select

        -- optional season context
        2025 as season_year,

        -- race identity
        track as track_name,

        -- position (keep raw due to DNS/DNF/etc.)
        position as qualifying_position,

        -- driver info
        no as driver_number,
        driver as driver_name,
        team as team_name,

        -- qualifying sessions (keep as text due to mixed formats)
        q1 as q1_lap_time,
        q2 as q2_lap_time,
        q3 as q3_lap_time,

        -- laps completed
        laps as laps_completed

    from source

)

select *
from renamed