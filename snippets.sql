-- snippets
-- Вибираем количество чашек которое можно приготовить из имеющихся на складах запасах и потенциальную прибыль
with all_goods as (
    select
        cs.name as coffee_shop_name,
        g.id as goods_id,
        s.measurement_id,
        sum(s.volume) as total_volume
    from nut_coffee.coffee_shops cs
    join nut_coffee.stocks s on
        cs.id = s.coffee_shop_id
    join nut_coffee.goods g on
        s.good_id = g.id
    where g.is_ingredient
    group by s.coffee_shop_id, g.id, s.measurement_id
)
select distinct
    ag.coffee_shop_name,
    r.name as recipe_name,
     min(floor(total_volume * mf.factor / ri.volume)) over (shop_recipe) as min_cumps_count,
    min(floor(total_volume * mf.factor / ri.volume)) over (shop_recipe) * m.price as price_for_all_cups
from all_goods ag
join nut_coffee.recipe_ingredients ri on
    ri.ingredient_id = ag.goods_id
join nut_coffee.recipes r on
    r.id = ri.recipe_id
join nut_coffee.menus m on
    r.id = m.recipe_id
left join nut_coffee.measurement_factors mf on
    mf.measurement_from_id = ag.measurement_id and
    mf.measurement_to_id = ri.measurement_unit_id
window shop_recipe as (partition by ag.coffee_shop_name, r.name)
order by ag.coffee_shop_name, r.name;


-- прибыль в разрезе кофеен
select
    cs.name as cofe_shop_name,
    sum(m.price) as total_income
from nut_coffee.clients_orders co
join nut_coffee.menus m on
    m.id = co.menu_id
join nut_coffee.coffee_shops cs on
    cs.id = m.coffee_shop_id
group by cs.name
order by total_income desc;

-- прибыль в разрезе рецепта
select
    r.name as recipe_name,
    sum(m.price) as total_income
from nut_coffee.clients_orders co
join nut_coffee.menus m on
    m.id = co.menu_id
join nut_coffee.recipes r on
    r.id = m.recipe_id
group by r.name
order by total_income desc;

-- общий доход в разрезе кофеен и продукции
with pivot as (
     select
         m.id as menu_id,
         sum(m.price)                 as income,
         coalesce(sum(g.purchase_price), 0) +
         coalesce(sum((ri.volume * mf.factor) * ingr_goods.purchase_price), 0) as costs
     from nut_coffee.clients_orders co
     join nut_coffee.menus m on
         m.id = co.menu_id
     left join nut_coffee.goods g on
         g.id = m.good_id
     left join nut_coffee.recipes r on
         r.id = m.recipe_id
     left join nut_coffee.recipe_ingredients ri on
         ri.recipe_id = r.id
     left join nut_coffee.goods ingr_goods on
        ingr_goods.id = ri.ingredient_id and
        ingr_goods.is_ingredient
     left join nut_coffee.measurement_factors mf on
        mf.measurement_from_id = ri.measurement_unit_id and
        mf.measurement_to_id = ingr_goods.measurement_id
     group by m.id
)
select
    m.shop_name,
    product_name,
    p.income,
    p.costs,
    p.income - p.costs as profit
from nut_coffee.menus_view m
left join pivot p on
    p.menu_id = m.menu_id;





select
    ri.measurement_unit_id,
    g.measurement_id,
    volume,
    mf.factor,
    ri.volume * mf.factor
from nut_coffee.recipe_ingredients ri
join nut_coffee.goods g on
    g.id = ri.ingredient_id
join nut_coffee.measurement_factors mf on
    mf.measurement_from_id = ri.measurement_unit_id and
    mf.measurement_to_id = g.measurement_id;

