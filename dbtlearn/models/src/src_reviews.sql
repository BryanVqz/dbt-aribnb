--DESCRIBE TABLE AIRBNB.RAW.RAW_REVIEWS;

WITH raw_reviews AS (
    --SELECT * FROM AIRBNB.RAW.RAW_REVIEWS
    SELECT * FROM {{ source('airbnb', 'reviews')}}
)

--Updating column names
SELECT
     LISTING_ID
    , DATE          AS review_date
    , REVIEWER_NAME
    , COMMENTS      AS review_text
    , SENTIMENT     AS review_sentiment
FROM raw_reviews