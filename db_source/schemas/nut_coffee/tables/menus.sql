-- drop table nut_coffee.menus;
CREATE TABLE nut_coffee.menus
(
    id             serial          NOT NULL primary key COMMENT 'id пункта меню',
    coffee_shop_id bigint unsigned NOT NULL COMMENT 'id кофейни, для которой составлено меню',
    recipe_id      bigint unsigned COMMENT 'id рецепта',
    good_id        bigint unsigned COMMENT 'id товара',
    price          numeric(6, 2)   NOT NULL check (price > 0.0) COMMENT 'Цена продукта',

    constraint ch_items check (recipe_id is not null or good_id is not null),
    constraint ch_items2 check (not(recipe_id is not null and good_id is not null)),
    constraint uq_shop_goods unique (coffee_shop_id, good_id),
    constraint uq_shop_recipe unique (coffee_shop_id, recipe_id),
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

insert into nut_coffee.menus (coffee_shop_id, recipe_id, price)
values (1, 1, 150),
       (1, 2, 120),
       (1, 3, 160),
       (1, 4, 180),
       (1, 5, 190),
       (1, 6, 200),
       (2, 1, 150),
       (2, 2, 120),
       (2, 3, 160),
       (2, 4, 180),
       (2, 5, 190),
       (3, 1, 150),
       (3, 2, 120),
       (3, 3, 160),
       (3, 4, 180),
       (3, 5, 190);


insert into nut_coffee.menus (coffee_shop_id, good_id, price)
values (1, 7, 80),
       (1, 8, 90),
       (2, 7, 80),
       (2, 8, 90),
       (3, 7, 80),
       (3, 8, 90),
       (3, 14, 60),
       (1, 15, 60),
       (3, 16, 120);

