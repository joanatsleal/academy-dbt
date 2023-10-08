with 

source_cartao_credito_pessoa as (

    select 
        businessentityid,
        creditcardid,
        -- modifieddate
    from {{ source('erp', 'personcreditcard') }}

),

source_cartao_credito as (

    select 
        creditcardid,
        cardtype,
        -- cardnumber,
        -- expmonth,
        -- expyear,
        -- modifieddate
    from {{ source('erp', 'creditcard') }}

),

final as (

    select
        a.businessentityid,
        a.creditcardid,
        b.cardtype
    from source_cartao_credito_pessoa a
    left join source_cartao_credito b ON a.creditcardid = b.creditcardid


)

select * from final
