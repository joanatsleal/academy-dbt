with 

source_salesorderheadersalesreason as (

    select 
        cast(salesorderid as int) as id_ordem_venda,
        cast(salesreasonid as int) as id_motivo_venda
        -- modifieddate 
    from {{ source('erp', 'salesorderheadersalesreason') }}

),

source_salesreason as (

    select
        cast(salesreasonid as int) as id_motivo_venda,
        cast(name as string) as motivo_venda,
        cast(reasontype as string) as tipo_motivo_venda
        -- modifieddate

    from {{ source('erp', 'salesreason') }}

),

final as (
    select
        a.id_ordem_venda,
        a.id_motivo_venda,
        b.motivo_venda,
        b.tipo_motivo_venda
    from source_salesorderheadersalesreason a
    left join source_salesreason b on a.id_motivo_venda = b.id_motivo_venda
)

select * from final
