{% snapshot snapshot_raw_listings %}
--SCD Type 2 is applied: Historical changes are tracked

{{
    config(
        target_schema = 'dev',
        unique_key = 'id',
        strategy = 'timestamp',
        updated_at = 'updated_at',
        invalidate_hard_deletes = True
    )
}}

SELECT * FROM {{ source('airbnb', 'listings') }}

{% endsnapshot %}
