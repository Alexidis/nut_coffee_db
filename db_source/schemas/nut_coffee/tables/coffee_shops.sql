-- drop table nut_coffee.coffee_shops;
CREATE TABLE nut_coffee.coffee_shops
(
    id               serial       NOT NULL PRIMARY KEY COMMENT 'id кофейни',
    name             varchar(45)  NOT NULL unique COLLATE utf8mb4_unicode_ci COMMENT 'Наименование кофейни',
    address          varchar(512) NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Адрес кофейни',
    admin_first_name varchar(45)  NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Имя администратора кофейни',
    admin_last_name  varchar(45)  NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Фамилия администратора кофейни',
    admin_phone      bigint       NOT NULL unique COMMENT 'Телефон администратора кофейни'

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Кофейни';
create index coffee_shops_name_idx on nut_coffee.coffee_shops (name);
