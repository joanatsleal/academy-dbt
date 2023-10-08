with

    erp_clientes as (
        select
            id_cliente,
            id_pessoa
        from {{ref('stg_erp__clientes')}}

    ),

    erp_pessoas as (
        select 
            id_pessoa,
            primeiro_nome,
            sobrenome,
            ultimo_nome
        from {{ref('stg_erp__pessoas')}}
    ),

    erp_cartao_credito as (
        select 
            id_pessoa,
            id_cartao_credito,
            tipo_cartao_credito
        from {{ref('stg_erp__cartao_credito')}}

    ),

    final as (
        select 
            row_number() over (order by a.id_cliente) as sk_cliente,
            a.id_cliente,
            a.id_pessoa,
            b.primeiro_nome,
            b.sobrenome,
            b.ultimo_nome,
            c.id_cartao_credito,
            c.tipo_cartao_credito
        from erp_clientes a
        left join erp_pessoas b on a.id_pessoa = b.id_pessoa
        left join erp_cartao_credito c on a.id_pessoa = c.id_pessoa
      
    )

select * from final
