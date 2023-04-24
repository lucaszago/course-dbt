
    
    

select
    USER_ID as unique_field,
    count(*) as n_records

from dev_db.dbt_lukaszagohotmailcom.fct_sales
where USER_ID is not null
group by USER_ID
having count(*) > 1


