with source as (

    select *
    from {{ source('raw', 'RAW_FORMULA1_2025SEASON_TEAMS') }}

),

renamed as (

    select

        -- team identity
        team as team_name,
        full_team_name as full_team_name,

        -- base / organization info
        base as base_location,
        team_chief as team_chief,
        technical_chief as technical_chief,
        chassis as chassis,
        power_unit as power_unit,

        -- historical / performance metadata
        first_team_entry as first_team_entry_year,
        grand_prix_entered as grand_prix_entered,
        team_points as team_points,

        -- semi-structured performance fields (keep raw for now)
        highest_race_finish as highest_race_finish_raw,
        highest_grid_position as highest_grid_position_raw,

        podiums as podiums,
        pole_positions as pole_positions,
        world_championships as world_championships

    from source

)

select *
from renamed