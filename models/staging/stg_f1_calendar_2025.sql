with source as (

    select *
    from {{ source('raw', 'RAW_FORMULA1_2025SEASON_CALENDAR') }}

)

select

    -- identifiers
    round as race_number,

    -- dates (convert string → date)
    to_date("RACE_DATE", 'DD/MM/YYYY') as race_date,

    "GP_NAME" as grand_prix_name,
    COUNTRY,
    CITY,
    "CIRCUIT_NAME" as circuit_name,

    -- numeric fields
    cast("FIRST_GP" as number) as first_gp_year,
    cast("NUMBER_OF_LAPS" as number) as number_of_laps,
    cast("CIRCUIT_LENGTH_KM" as float) as circuit_length_km,
    cast("RACE_DISTANCE_KM" as float) as race_distance_km,

    -- records
    "LAP_RECORD" as lap_record,
    "RECORD_OWNER" as lap_record_owner,
    cast("RECORD_YEAR" as number) as lap_record_year,

    cast("TURNS" as number) as turns,
    cast("DRS_ZONES" as number) as drs_zones

from source