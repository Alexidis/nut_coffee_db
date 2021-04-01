-- drop table nut_coffee.menus;
CREATE TABLE nut_coffee.menus
(
    coffee_shop_id bigint unsigned NOT NULL COMMENT 'id кофейни, для которой составлено меню',
    recipe_id      bigint unsigned COMMENT 'id рецепта',
    good_id        bigint unsigned COMMENT 'id товара',
    price          numeric(6, 2)   NOT NULL check (price > 0.0) COMMENT 'Цена продукта',
    bonus_rate     TINYINT unsigned default 0.0 COMMENT 'Коэффициент начисления бонуса за продукт',

    constraint ch_items check (recipe_id is not null or good_id is not null),
    constraint ch_bonus_rate check (bonus_rate between 0 and 100),
    constraint ch_price check (price >= 0.0),
    constraint fk_menus_recipe
        FOREIGN KEY (recipe_id) REFERENCES nut_coffee.recipes (Id) ON DELETE CASCADE,
    constraint fk_menus_good
        FOREIGN KEY (good_id) REFERENCES nut_coffee.goods (Id) ON DELETE CASCADE,
    constraint fk_menus_shops
        FOREIGN KEY (coffee_shop_id) REFERENCES nut_coffee.coffee_shops (Id) ON DELETE CASCADE

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Меню кофейни';
create index menus_idx on nut_coffee.menus (coffee_shop_id, recipe_id);
