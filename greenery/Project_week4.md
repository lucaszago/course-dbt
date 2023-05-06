* Which products had their inventory change from week 3 to week 4? 

* Monstera
* String of pearls
* Bamboo
* Pothos
* Philodendron
* ZZ Plant
Query:
```
with updated_snapshot as (
    select 
        max(dbt_valid_to) as max_date 
    from products_snapshot
) 

select * from products_snapshot
join updated_snapshot
on products_snapshot.dbt_valid_from = updated_snapshot.max_date;

```
* Now that we have 3 weeks of snapshot data, can you use the inventory changes to determine which products had the most fluctuations in inventory? 
* Bamboo	
* ZZ Plant	
* Philodendron	
* String of pearls	
* Monstera	
* Pothos	
* Orchid	
* Snake Plant	
* Peace Lily	
* Calathea Makoyana	
Query: 
```
select
    name
    , count(*) as inventory_changes
from products_snapshot
group by 1
order by inventory_changes desc limit 10;
```

Did we have any items go out of stock in the last 3 weeks? 
* String of pearls
* Pothos
Query:
```
select 
name,
case 
    when inventory = 0 then 'True' else 'False' end as inventory_reached_zero
FROM products_snapshot
WHERE inventory_reached_zero = 'True'
```

* How are our users moving through the product funnel?

1871 sessions resulted in a page view,986 sessions resulted in the user adding a product to their cart and 366 sessions resulted in the user completing a purchase.
Query: 
```
WITH funnel AS (SELECT * 
FROM int_events_agg),
final AS (
    select sum(add_to_carts) as distinct_add_to_cart_sessions
    , sum(page_views) as distinct_page_view_sessions
    , sum(checkouts) as distinct_checkout_sessions
    , sum(add_to_carts) / sum(page_views) as add_to_cart_rate
    , sum(checkouts) / sum(add_to_carts) as cart_to_checkout_rate
    , sum(checkouts) / sum(page_views) as overall_conversion_rate
    from funnel
)
SELECT * FROM final
```
* Which steps in the funnel have largest drop off points

The largest drop off points in the funnel are between customers adding a product to their cart and successfully checking out (36.6% cart-to-checkout conversion rate) followed by customers viewing a product and then adding it to their cart (52.7% add_to_cart conversion rate).