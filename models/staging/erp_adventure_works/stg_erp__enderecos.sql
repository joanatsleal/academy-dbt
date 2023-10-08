with 

source_enderecos as (

    select * from {{ source('erp', 'address') }}

),

renamed as (

    select
        cast(addressid as int) as id_endereco
        , cast(city as string) as cidade
        , cast(stateprovinceid as int) as id_estado
        -- , addressline1
        -- , addressline2
        -- , postalcode
        -- , spatiallocation
        -- , rowguid
        -- , modifieddate

    from source_enderecos

)

