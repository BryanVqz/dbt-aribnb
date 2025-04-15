{% macro learn_log() %}
    {# log("Test logging message by Alejandro", info=True) #} 
    --{{ log("Test logging message by Bryan", info=True) }} --first jinja template gets evaluated, then SQL tells to skip line
{% endmacro %}