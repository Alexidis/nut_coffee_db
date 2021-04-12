-- drop table nut_coffee.recipe_ingredients;
CREATE TABLE nut_coffee.recipe_ingredients
(
    recipe_id           bigint unsigned NOT NULL COMMENT 'id продаваемого товара',
    ingredient_id       bigint unsigned NOT NULL COMMENT 'id ингредиента',
    measurement_unit_id bigint unsigned NOT NULL COMMENT 'id единицы измерения объема товара',
    volume              int unsigned    NOT NULL default 1 COMMENT 'Объем ингредиента необходимый для производства товара',

    constraint fk_recipe_ingredients_recipes
        FOREIGN KEY (recipe_id) REFERENCES nut_coffee.recipes (Id) ON DELETE CASCADE,
    constraint fk_recipes_goods
        FOREIGN KEY (ingredient_id) REFERENCES nut_coffee.goods (Id) ON DELETE restrict,
    constraint fk_recipes_measurement_unit
        FOREIGN KEY (measurement_unit_id) REFERENCES nut_coffee.measurement_units (Id) ON DELETE restrict

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Ингредиенты рецепт';

insert into nut_coffee.recipe_ingredients (recipe_id, ingredient_id, measurement_unit_id, volume)
values (1, 1, 9, 1),
       (1, 12, 5, 30),
       (1, 10, 5, 150),
       (2, 1, 9, 1),
       (2, 12, 5, 120),
       (3, 1, 9, 1),
       (3, 12, 5, 50),
       (3, 10, 5, 200),
       (4, 1, 9, 1),
       (4, 12, 5, 50),
       (4, 10, 5, 150),
       (4, 11, 5, 30),
       (5, 1, 9, 1),
       (5, 12, 5, 70),
       (5, 10, 5, 200),
       (5, 11, 5, 30),
       (6, 1, 9, 1),
       (6, 12, 5, 50),
       (6, 10, 5, 150),
       (6, 24, 5, 30);

