--DESCRIBE TABLE AIRBNB.RAW.RAW_HOSTS;

WITH raw_hosts AS (
    --SELECT * FROM AIRBNB.RAW.RAW_HOSTS
    SELECT * FROM {{ source('airbnb', 'hosts')}}
)

--Updating column names
SELECT
      ID            AS HOST_ID
    , NAME          AS HOST_NAME
    , IS_SUPERHOST
    , CREATED_AT
    , UPDATED_AT
FROM raw_hosts