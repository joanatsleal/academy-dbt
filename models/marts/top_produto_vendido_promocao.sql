with 
    vendas as (
        select 
        fk_motivo_venda,
        fk_produto,
        qt_vendida
        from {{ref('fct_vendas')}}
    ),

    motivos_vendas as (
        select 
        sk_motivo_venda,
        id_motivo_venda
        from {{ref('dim_motivos_vendas')}}
    ),

    produtos as (
        select 
        sk_produto,
        id_produto,
        nome_produto
        from {{ref('dim_produtos')}}
    ),


    final as (
        select *
        from vendas a 
        left join motivos_vendas b on a.fk_motivo_venda = b.sk_motivo_venda
        left join produtos c on a.fk_produto = c.sk_produto
    )

    select 
    nome_produto,
    SUM(qt_vendida) as qte_vendida
    from final
    where id_motivo_venda = 2
    group by nome_produto
    order by qte_vendida desc
    limit 1
