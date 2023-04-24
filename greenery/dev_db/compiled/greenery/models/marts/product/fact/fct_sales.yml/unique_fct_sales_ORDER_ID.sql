
    
    

select
    ORDER_ID as unique_field,
    count(*) as n_records

from dev_db.dbt_lukaszagohotmailcom.fct_sales
where ORDER_ID is not null
group by ORDER_ID
having count(*) > 1


