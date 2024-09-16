with 
    vendas as (
        select 
        fk_cliente,
        SUM(vl_total_negociado) as sum_total_negociado
        from {{ref('fct_vendas')}}
        group by fk_cliente, vl_total_negociado
        order by vl_total_negociado desc
    ),

    clientes as (
        select * 
        from {{ref('dim_clientes')}}
    ),

    final as (
        select 
        a.fk_cliente,
        b.primeiro_nome,
        a.sum_total_negociado
        from vendas a
        left join clientes b on a.fk_cliente = b.sk_cliente
        
    )

select primeiro_nome, SUM(sum_total_negociado) as sum_total_negociado
from final
group by primeiro_nome
order by sum_total_negociado desc
