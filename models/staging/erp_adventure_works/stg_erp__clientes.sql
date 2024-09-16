with 

source_clientes as (

    select * from {{ source('erp', 'customer') }}

),

final as (

    select
        cast(customerid as int) as id_cliente
        , cast(personid as int) as id_pessoa
        --, storeid
        --, territoryid
        -- , rowguid
        -- , modifieddate

    from source_clientes

)

select * from final
