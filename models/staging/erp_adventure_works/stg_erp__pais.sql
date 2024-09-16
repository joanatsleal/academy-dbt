with 

source_pais as (

    select * from {{ source('erp', 'countryregion') }}

),

final as (

    select
        cast(countryregioncode as string) as cod_pais,
        cast(name as string) as nome_pais
        -- modifieddate
    from source_pais

)

select * from final
