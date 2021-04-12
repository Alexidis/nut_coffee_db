-- drop view nut_coffee.stocks_view;
create or replace view nut_coffee.stocks_view as (
    select
        cs.name as shop_name,
        g.name as goods_name,
        concat_ws(' ', volume, mu.name) as mesuare
    from nut_coffee.stocks as s
    join nut_coffee.coffee_shops cs on
        s.coffee_shop_id = cs.id
    join nut_coffee.goods g on
        s.good_id = g.id
    join nut_coffee.measurement_units mu on
        s.measurement_id = mu.id
    order by shop_name
);
