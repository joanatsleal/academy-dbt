with 

source_produtos as (

    select * from {{ source('erp', 'product') }}

),

renamed as (

    select
        cast(productid as int) as id_produto
        , cast(name as string) as nome_produto
        -- productnumber,
        -- makeflag,
        -- finishedgoodsflag,
        -- color,
        -- safetystocklevel,
        -- reorderpoint,
        -- standardcost,
        -- listprice,
        -- size,
        -- sizeunitmeasurecode,
        -- weightunitmeasurecode,
        -- weight,
        -- daystomanufacture,
        -- productline,
        -- class,
        -- style,
        -- productsubcategoryid,
        -- productmodelid,
        -- sellstartdate,
        -- sellenddate,
        -- discontinueddate,
        -- rowguid,
        -- modifieddate

    from source_produtos

)

select * from renamed