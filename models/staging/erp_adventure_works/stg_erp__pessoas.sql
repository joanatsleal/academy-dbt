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
        cast(firstname as ,
        middlename,
        lastname,
        -- suffix,
        -- emailpromotion,
        -- additionalcontactinfo,
        -- demographics,
        -- rowguid,
        -- modifieddate

    from source

)

select * from renamed
