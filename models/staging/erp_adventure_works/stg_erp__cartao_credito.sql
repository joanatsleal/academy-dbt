with 

source_cartao_credito_pessoa as (

    select 
        businessentityid as id_pessoa,
        creditcardid as id_cartao_credito
        -- modifieddate
    from {{ source('erp', 'personcreditcard') }}

),

source_cartao_credito as (

    select 
        creditcardid as id_cartao_credito,
        cardtype as tipo_cartao_credito
        -- cardnumber,
        -- expmonth,
        -- expyear,
        -- modifieddate
    from {{ source('erp', 'creditcard') }}

),

final as (

    select
        a.id_pessoa,
        a.id_cartao_credito,
        b.tipo_cartao_credito
    from source_cartao_credito_pessoa a
    left join source_cartao_credito b ON a.id_cartao_credito = b.id_cartao_credito


)

select * from final
