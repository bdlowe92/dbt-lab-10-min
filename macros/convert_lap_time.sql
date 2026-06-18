{% macro convert_lap_time(time_field) %}

case 
    when {{ time_field }} in ('DNF', 'DNS', 'DNF') then null
    else 
        split_part({{ time_field }}, ':', 1)::number * 60
        + split_part({{ time_field }}, ':', 2)::float
end

{% endmacro %}