with source as (

    select *
    from {{ source('raw', 'RAW_FORMULA1_2025SEASON_SPRINTQUALIFYINGRESULTS') }}

),

renamed as (

    select

        -- season context
        2025 as season_year,

        -- race identity
        track as track_name,

        -- qualifying result
        position as sprint_qualifying_position,

        -- driver information
        no as driver_number,
        driver as driver_name,
        team as team_name,

        -- sprint qualifying sessions
        q1 as sq1_lap_time,
        q2 as sq2_lap_time,
        q3 as sq3_lap_time,

        -- laps completed
        laps as laps_completed

    from source

)

select *
from renamed