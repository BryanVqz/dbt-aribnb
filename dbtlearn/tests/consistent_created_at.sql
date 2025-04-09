SELECT * FROM {{ ref( 'dim_listings_cleansed' )}} T1
LEFT JOIN {{ ref('fct_reviews') }} T2
ON T1.LISTING_ID = T2.LISTING_ID
WHERE REVIEW_DATE < created_at