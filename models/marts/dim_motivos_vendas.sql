with

    erp__motivos_vendas as (
        select
            id_ordem_venda,
            id_motivo_venda,
            motivo_venda,
            tipo_motivo_venda
        from {{ref('stg_erp__motivos_vendas')}}

    ),

    final as (
        select 
            row_number() over (order by id_motivo_venda) as sk_motivo_venda,
            id_ordem_venda,
            id_motivo_venda,
            motivo_venda,
            tipo_motivo_venda
        from erp__motivos_vendas
    )
    
select * from final
