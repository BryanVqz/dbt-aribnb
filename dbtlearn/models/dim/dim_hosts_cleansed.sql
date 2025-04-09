{{
    config(
        materialized = 'view'
    )
}}

WITH src_hosts AS (
    SELECT * FROM {{ ref('src_hosts') }} --Jinja tempplate, refers to VIEW on snowflake
)

SELECT
      HOST_ID
    /*, CASE 
        WHEN HOST_NAME IS NOT NULL THEN HOST_NAME
        ELSE 'Anonymous'
      END               AS HOST_NAME */
    , NVL(HOST_NAME, 'Anonymous') AS HOST_NAME
    , IS_SUPERHOST
    , CREATED_AT
    , UPDATED_AT
FROM src_hosts
--WHERE HOST_NAME IS NULL