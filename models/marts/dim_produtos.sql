with

    erp_produtos as (
        select
            id_produto,
            nome_produto
        from {{ref('stg_erp__produtos')}}

    ),

    erp_ofertas as (
        select 
            id_oferta_especial,
            id_produto,
            desc_oferta_especial,
            tipo_oferta_especial
        from {{ref('stg_erp__ofertas')}}
    ),

    final as (
        select 
            a.id_produto,
            a.nome_produto,
            b.id_oferta_especial,
            b.desc_oferta_especial,
            b.tipo_oferta_especial
        from erp_produtos a
        left join erp_ofertas b on a.id_produto = b.id_produto
    )

select * from final
