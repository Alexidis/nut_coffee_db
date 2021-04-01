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
