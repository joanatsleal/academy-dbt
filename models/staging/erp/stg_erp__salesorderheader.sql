with 

source_salesorderheader as (

    select * 
        salesorderid,
        revisionnumber,
        orderdate,
        duedate,
        shipdate,
        status,
        onlineorderflag,
        purchaseordernumber,
        accountnumber,
        customerid,
        salespersonid,
        territoryid,
        billtoaddressid,
        shiptoaddressid,
        shipmethodid,
        creditcardid,
        creditcardapprovalcode,
        currencyrateid,
        subtotal,
        taxamt,
        freight,
        totaldue,
        comment,
        rowguid,
        modifieddate
    from {{ source('erp', 'salesorderheader') }}

),

source_salesorderdetail as (

    select
        salesorderid,
        salesorderdetailid,
        carriertrackingnumber,
        orderqty,
        productid,
        specialofferid,
        unitprice,
        unitpricediscount,
        rowguid,
        modifieddate
    from source

)

select * from renamed
