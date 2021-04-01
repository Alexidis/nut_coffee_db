-- drop table nut_coffee.goods;
CREATE TABLE nut_coffee.goods
(
    id             serial          NOT NULL primary key COMMENT 'id товара',
    name           varchar(45)     NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Наименование товара',
    description    varchar(500) COLLATE utf8mb4_unicode_ci COMMENT 'Описание товара',
    purchase_price numeric(11, 2)  NOT NULL COMMENT 'Закупочная цена',
    is_ingredient  boolean                  default false comment 'Товар может являться ингредиентом рецепта',
    is_product     boolean                  default true comment 'Товар может продаваться вне рецепта',
    goods_type_id  bigint unsigned NOT NULL COMMENT 'Тип товара',
    provider_id    bigint unsigned NOT NULL COMMENT 'id поставщика',
    created_at     datetime        not null default now() COMMENT 'Дата/время создания товара',
    renew_user     varchar(45)     not null COMMENT 'Пользователь редактирования товара',
    renew_datetime datetime COMMENT 'Дата/время изменения состояния товара',

    constraint ch_purchase_price check (purchase_price >= 0.0),
    constraint fk_goods_goods_types
        FOREIGN KEY (goods_type_id) REFERENCES nut_coffee.goods_types (Id) ON DELETE restrict,
    constraint fk_goods_providers
        FOREIGN KEY (provider_id) REFERENCES nut_coffee.providers (Id) ON DELETE restrict
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Закупаемые товара';
create index goods_idx on nut_coffee.goods (provider_id, goods_type_id);
