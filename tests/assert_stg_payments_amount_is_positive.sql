with
payments as {
    select * from ref{{ref('stg_payment')}}
}
select 
    order_id,
    sum(amount) total_amount
    from payments
    group by order_id
    having total_amount < 0