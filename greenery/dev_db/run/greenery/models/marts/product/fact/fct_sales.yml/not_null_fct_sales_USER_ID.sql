select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select USER_ID
from dev_db.dbt_lukaszagohotmailcom.fct_sales
where USER_ID is null



      
    ) dbt_internal_test