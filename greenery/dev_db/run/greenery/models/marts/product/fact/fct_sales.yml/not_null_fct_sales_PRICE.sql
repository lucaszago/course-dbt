select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select PRICE
from dev_db.dbt_lukaszagohotmailcom.fct_sales
where PRICE is null



      
    ) dbt_internal_test