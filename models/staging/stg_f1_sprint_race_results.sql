with source as (

    select *
    from {{ source('raw', 'RAW_FORMULA1_2025SEASON_SPRINTRESULTS') }}

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

        -- sprint performance
        starting_grid as starting_grid_position,
        laps as laps_completed,

        -- result details
        time_or_retired as finish_time_or_status,

        -- scoring
        points as points_scored

    from source

)

select *
from renamed