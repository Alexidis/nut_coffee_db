-- drop view nut_coffee.menus_view;
create or replace view nut_coffee.menus_view as (
    select
        m.id as menu_id,
        cs.name as shop_name,
        coalesce(r.name, g.name) as product_name,
        m.price
    from nut_coffee.menus as m
    join nut_coffee.coffee_shops cs on
        m.coffee_shop_id = cs.id
    left join nut_coffee.recipes r on
        m.recipe_id = r.id
    left join nut_coffee.goods g on
        m.good_id = g.id
    order by shop_name
);
