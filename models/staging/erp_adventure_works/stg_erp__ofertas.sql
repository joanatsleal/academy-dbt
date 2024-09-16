with 

source_specialofferproduct as (

    select 
        specialofferid as id_oferta_especial,
        productid as id_produto
        -- rowguid,
        -- modifieddate
    from {{ source('erp', 'specialofferproduct') }}

),

source_specialoffer as (

    select
        specialofferid as id_oferta_especial,
        description as desc_oferta_especial,
        -- discountpct,
        type as tipo_oferta_especial
        -- category,
        -- startdate,
        -- enddate,
        -- minqty,
        -- maxqty,
        -- rowguid,
        -- modifieddate
    from {{ source('erp', 'specialoffer') }}

),

final as (

    select
        a.id_oferta_especial,
        a.id_produto,
        b.desc_oferta_especial,
        b.tipo_oferta_especial
    from source_specialofferproduct a
    left join source_specialoffer b on a.id_oferta_especial = b.id_oferta_especial

)

select * from final