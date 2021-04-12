-- drop view nut_coffee.recipes_view
create or replace view nut_coffee.recipes_view as (
    select
        r.name as recipie_name,
        g.name as ingredient_name,
        concat_ws(' ', ri.volume, mu.short_name) as mesuare
    from nut_coffee.recipes as r
    join nut_coffee.recipe_ingredients ri on
        ri.recipe_id = r.id
    join nut_coffee.goods g on
        ri.ingredient_id = g.id
    join nut_coffee.measurement_units mu on
        ri.measurement_unit_id = mu.id
    order by r.name
);
