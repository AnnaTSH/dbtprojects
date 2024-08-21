with orders_sum as (
    select order_id, sum(amount) as amount 
    from {{ ref('stg_stripe__payments') }}
    group by order_id
)

select
        order_id,
        customer_id,
        amount

    from {{ ref('stg_jaffle_shop__orders') }} 
    left join orders_sum using(order_id)
