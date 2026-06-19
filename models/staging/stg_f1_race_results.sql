with source as (

    select *
    from {{ source('raw', 'RAW_FORMULA1_2025SEASON_RACERESULTS') }}

),

renamed as (

    select

        -- season context
        2025 as season_year,

        -- race identity
        track as track_name,

        -- finishing result
        position as finishing_position,

        -- driver information
        no as driver_number,
        driver as driver_name,
        team as team_name,

        -- race performance
        starting_grid as starting_grid_position,
        laps as laps_completed,

        -- result details
        time_or_retired as finish_time_or_status,

        -- scoring
        points as points_scored,

        -- fastest lap
        set_fastest_lap as set_fastest_lap,
        fastest_lap_time as fastest_lap_time

    from source

)

select *
from renamed