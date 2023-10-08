with 

source_salesorderheader as (

    select
        salesorderid as id_ordem_venda,
        -- revisionnumber,
        orderdate as dt_venda,
        duedate as dt_prazo_entrega,
        shipdate as dt_envio,
        status as status,
        -- onlineorderflag,
        -- purchaseordernumber,
        -- accountnumber,
        customerid as id_cliente,
        -- salespersonid,
        -- territoryid,
        -- billtoaddressid,
        shiptoaddressid as id_endereco,
        -- shipmethodid,
        creditcardid as id_cartao_credito
        -- creditcardapprovalcode,
        -- currencyrateid,
        -- subtotal,
        -- taxamt,
        -- freight,
        -- totaldue,
        -- comment,
        -- rowguid,
        -- modifieddate
    from {{ source('erp', 'salesorderheader') }}

),

source_salesorderdetail as (

    select
        salesorderid as id_ordem_venda,
        salesorderdetailid as id_ordem_venda_detalhada,
        -- carriertrackingnumber,
        orderqty as qt_vendida,
        productid as id_produto,
        specialofferid as id_desconto,
        unitprice as preco_unitario
        -- unitpricediscount,
        -- rowguid,
        -- modifieddate
    from {{ source('erp', 'salesorderdetail') }}

),

final as (
    
    select 
        a.id_ordem_venda,
        a.dt_venda,
        a.dt_prazo_entrega,
        a.dt_envio,
        a.status,
        a.id_cliente,
        a.id_endereco,
        a.id_cartao_credito,
        b.id_ordem_venda_detalhada,
        b.qt_vendida,
        b.id_produto,
        b.id_desconto,
        b.preco_unitario
from source_salesorderheader a
left join source_salesorderdetail b on b.id_ordem_venda = a.id_ordem_venda

)

select * from final