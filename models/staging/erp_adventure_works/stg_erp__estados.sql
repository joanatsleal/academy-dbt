with 

source_estados as (

    select * from {{ source('erp', 'stateprovince') }}

),

final as (

    select
        cast(stateprovinceid as int) as id_estado,
        cast(stateprovincecode as string) as codigo_estado,
        cast(name as string) as nome_estado,
        cast(countryregioncode as string) as codigo_pais
        -- isonlystateprovinceflag,
        -- territoryid,
        -- rowguid,
        -- modifieddate

    from source_estados

)

select * from final