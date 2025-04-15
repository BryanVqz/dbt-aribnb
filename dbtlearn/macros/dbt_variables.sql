{% macro dbt_variables() %}

    --{% set your_variable = "Bryan" %}
    --This are dbt variables
    --dbt run-operation dbt_variables --vars '{name: bryan}'
    {{ log("Hello dbt user " ~ var("name", "NO USERNAME SET") ~ "!", info=True) }}

{% endmacro %}