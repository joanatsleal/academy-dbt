with 

source as (

    select * from {{ source('erp_adventure_works', 'person') }}

),

renamed as (

    select
        cast(businessentityid as int) as id_pessoa,
        -- persontype,
        -- namestyle,
        -- title,
        cast(firstname as string) as primeiro_nome,
        cast(middlename as string) as sobrenome,
        cast(lastname as string) as ultimo_nome
        -- suffix,
        -- emailpromotion,
        -- additionalcontactinfo,
        -- demographics,
        -- rowguid,
        -- modifieddate

    from source

)

select * from renamed
