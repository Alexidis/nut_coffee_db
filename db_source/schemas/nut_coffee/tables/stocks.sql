-- drop table nut_coffee.stocks;
CREATE TABLE nut_coffee.stocks
(
    id             serial          NOT NULL PRIMARY KEY COMMENT 'id товарного запаса',
    coffee_shop_id bigint unsigned COMMENT 'id кофейни, на которой находится товар',
    good_id        bigint unsigned NOT NULL COMMENT 'id товара',
    measurement_id bigint unsigned NOT NULL COMMENT 'Единица измерения объема товара',
    volume         numeric(11, 6) unsigned    NOT NULL COMMENT 'Объем товара',

    constraint shop_good_unique unique(coffee_shop_id, good_id),
    constraint fk_stocks_coffee_shop
        FOREIGN KEY (coffee_shop_id) REFERENCES nut_coffee.coffee_shops (Id) match simple ON DELETE set null,
    constraint fk_stocks_goods
        FOREIGN KEY (good_id) REFERENCES nut_coffee.goods (Id) ON DELETE restrict,
    constraint fk_stocks_measurement_units
        FOREIGN KEY (measurement_id) REFERENCES nut_coffee.measurement_units (Id) ON DELETE restrict
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Складские запасы';
create index stocks_idx on nut_coffee.stocks (coffee_shop_id, good_id, measurement_id);


insert into nut_coffee.stocks (coffee_shop_id, good_id, measurement_id, volume)
values (1, 1, 2, 6),
       (1, 2, 2, 9),
       (1, 3, 2, 12),
       (1, 4, 2, 6),
       (1, 5, 2, 8),
       (1, 6, 6, 9),
       (1, 7, 2, 6),
       (1, 8, 2, 4),
       (1, 9, 8, 2),
       (1, 10, 8, 11),
       (1, 11, 8, 1),
       (1, 12, 8, 5),
       (2, 1, 2, 6),
       (2, 2, 2, 7),
       (2, 3, 2, 4),
       (2, 4, 2, 7),
       (2, 5, 2, 7),
       (2, 6, 6, 9),
       (2, 7, 2, 5),
       (2, 8, 2, 5),
       (2, 9, 8, 3),
       (2, 10, 8, 10),
       (2, 11, 8, 2),
       (2, 13, 8, 4),
       (3, 1, 2, 3),
       (3, 2, 2, 4),
       (3, 3, 2, 3),
       (3, 4, 2, 6),
       (3, 5, 2, 9),
       (3, 6, 6, 5),
       (3, 7, 2, 4),
       (3, 8, 2, 3),
       (3, 9, 8, 3),
       (3, 10, 8, 14),
       (3, 11, 8, 4),
       (3, 12, 8, 3),
       (2, 14, 2, 4),
       (3, 14, 2, 2),
       (1, 15, 2, 2),
       (3, 16, 2, 1),
       (2, 17, 2, 4),
       (3, 18, 2, 5),
       (3, 20, 2, 4),
       (2, 21, 2, 6),
       (2, 22, 8, 6),
       (3, 23, 8, 4),
       (1, 24, 8, 3);
