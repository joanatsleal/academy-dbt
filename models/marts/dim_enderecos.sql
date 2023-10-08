with

    erp_enderecos as (
        select
            id_endereco,
            cidade,
            id_estado
        from {{ref('stg_erp__enderecos')}}

    ),

    erp_estados as (
        select 
            id_estado,
            cod_estado,
            nome_estado,
            cod_pais
        from {{ref('stg_erp__estados')}}
    ),

    erp_pais as (
        select 
            cod_pais,
            nome_pais
        from {{ref('stg_erp__pais')}}

    ),

    final as (
        select 
            a.id_estado,
            b.cod_estado,
            b.nome_estado,
            b.cod_pais,
            c.nome_pais
        from erp_enderecos a
        left join erp_estados b on a.id_estado = b.id_estado
        left join erp_pais c on b.cod_pais = c.cod_pais    
    )

select * from final
