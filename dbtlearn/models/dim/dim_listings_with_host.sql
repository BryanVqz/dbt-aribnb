{{
    config(
        materialized = 'view'
    )
}}

WITH listings AS (
    SELECT * FROM {{ ref("dim_listings_cleansed") }}
)

,hosts AS (
    SELECT * FROM {{ ref( "dim_hosts_cleansed") }}
)

SELECT 
      listings.listing_id
    , listings.listing_name
    , listings.room_type
    , listings.minimum_nights
    , listings.price
    , listings.host_id
    , hosts.host_name
    , hosts.IS_SUPERHOST AS HOST_IS_SUPERHOST
    , listings.created_at
    , GREATEST(listings.updated_at, hosts.updated_at) AS UPDATED_AT
FROM listings
LEFT JOIN hosts ON (listings.host_id = hosts.host_id)