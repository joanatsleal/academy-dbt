with

    dim_produtos as (
        select
            sk_produto as fk_produto,
            id_produto,
            nome_produto,
            id_oferta_especial,
            desc_oferta_especial,
            tipo_oferta_especial
        from {{ref('dim_produtos')}}

    ),

    dim_clientes as (
        select 
            sk_cliente as fk_cliente,
            id_cliente,
            id_pessoa,
            primeiro_nome,
            sobrenome,
            ultimo_nome,
            id_cartao_credito,
            tipo_cartao_credito
        from {{ref('dim_clientes')}}
    ),

    dim_motivos_vendas as (
        select 
            sk_motivo_venda as fk_motivo_venda,
            id_ordem_venda,
            id_motivo_venda,
            motivo_venda,
            tipo_motivo_venda
        from {{ref('dim_motivos_vendas')}}

    ),

    dim_enderecos as (
        select 
            sk_endereco as fk_enderecos,
            id_endereco,
            id_estado,
            cod_estado,
            nome_estado,
            cod_pais,
            nome_pais
        from {{ref('dim_enderecos')}}

    ),

    stg_vendas as (
        select 
            id_ordem_venda,
            dt_venda,
            dt_venda_mes,
            dt_venda_ano,
            dt_prazo_entrega,
            dt_envio,
            status,
            id_cliente,
            id_endereco,
            id_cartao_credito,
            id_ordem_venda_detalhada,
            qt_vendida,
            id_produto,
            id_desconto,
            preco_unitario,
            desconto
        from {{ref('stg_erp__vendas')}}

    ),

    final as (
        select 
            stg_vendas.id_ordem_venda,
            dim_clientes.fk_cliente,  
            dim_produtos.fk_produto,
            dim_enderecos.fk_enderecos,
            dim_motivos_vendas.fk_motivo_venda,
            stg_vendas.dt_venda,
            stg_vendas.dt_venda_mes,
            stg_vendas.dt_venda_ano,
            stg_vendas.dt_prazo_entrega,
            stg_vendas.dt_envio,
            stg_vendas.status,
            stg_vendas.qt_vendida,
            stg_vendas.preco_unitario,
            stg_vendas.desconto,
            cast((preco_unitario * qt_vendida) as int) as vl_total_negociado,
            cast((preco_unitario * qt_vendida) * (1 - desconto) as int) as vl_total_liquido,
            cast(((preco_unitario - desconto)/qt_vendida) as int) as vl_ticket
        from stg_vendas stg_vendas
        left join dim_motivos_vendas dim_motivos_vendas on stg_vendas.id_ordem_venda = dim_motivos_vendas.id_ordem_venda
        left join dim_clientes dim_clientes on stg_vendas.id_cliente = dim_clientes.id_cliente
        left join dim_produtos dim_produtos on stg_vendas.id_produto = dim_produtos.id_produto
        left join dim_enderecos dim_enderecos on stg_vendas.id_endereco = dim_enderecos.id_endereco    
    )

    select *
    from final

