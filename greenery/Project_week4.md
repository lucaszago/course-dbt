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