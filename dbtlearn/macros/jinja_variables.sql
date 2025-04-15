{% macro jinja_variables(name) %}

    --{% set your_variable = "Bryan" %}
    --This are Jinja variables
    --dbt run-operation learn_variables --args '{ name: "Bryan" }'
    {{ log("Hello " ~ name, info=True) }}

{% endmacro %}