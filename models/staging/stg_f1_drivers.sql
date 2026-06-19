with source as (

    select *
    from {{ source('raw', 'RAW_FORMULA1_2025SEASON_DRIVERS') }}

),

renamed as (

    select

        -- season context
        2025 as season_year,

        -- driver identity
        driver as driver_name,
        abbreviation as driver_abbreviation,
        race_number as driver_number,
        team as team_name,
        country as country,

        -- career stats
        grand_prix_entered as grand_prix_entered,
        career_points as career_points,
        podiums as podiums,
        pole_positions as pole_positions,
        world_championships as world_championships,
        dnfs as dnfs,

        -- encoded / semi-structured fields (keep raw for later parsing)
        highest_race_finish as highest_race_finish_raw,
        highest_grid_position as highest_grid_position_raw,

        -- dates
        to_date(date_of_birth, 'DD/MM/YYYY') as date_of_birth,

        -- location
        place_of_birth as place_of_birth

    from source

)

select *
from renamed