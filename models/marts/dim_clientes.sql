with
    erp_clientes as (
        select
        id_cliente,
        id_pessoa
        from {{ref('stg_erp__clientes')}}
    )

select * from erp_clientes

