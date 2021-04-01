-- drop table nut_coffee.stocks;
CREATE TABLE nut_coffee.stocks
(
    coffee_shop_id      bigint unsigned COMMENT 'id кофейни, на которой находится товар',
    good_id             bigint unsigned NOT NULL COMMENT 'id товара',
    measurement_unit_id bigint unsigned NOT NULL COMMENT 'Единица измерения объема товара',
    volume              int unsigned    NOT NULL COMMENT 'Объем товара',

    constraint fk_stocks_coffee_shop
        FOREIGN KEY (coffee_shop_id) REFERENCES nut_coffee.coffee_shops (Id) match simple ON DELETE set null,
    constraint fk_stocks_goods
        FOREIGN KEY (good_id) REFERENCES nut_coffee.goods (Id) ON DELETE restrict,
    constraint fk_stocks_measurement_units
        FOREIGN KEY (measurement_unit_id) REFERENCES nut_coffee.measurement_units (Id) ON DELETE restrict
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Складские запасы';
create index stocks_idx on nut_coffee.stocks (coffee_shop_id, good_id, measurement_unit_id);
