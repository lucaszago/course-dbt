
    
    

select
    PRODUCT_ID as unique_field,
    count(*) as n_records

from dev_db.dbt_lukaszagohotmailcom.fct_sales
where PRODUCT_ID is not null
group by PRODUCT_ID
having count(*) > 1


