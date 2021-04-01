-- drop table nut_coffee.goods_types;
CREATE TABLE nut_coffee.goods_types
(
    id          serial      NOT NULL PRIMARY KEY COMMENT 'id типа товара',
    name        varchar(45) NOT NULL unique COLLATE utf8mb4_unicode_ci COMMENT 'Наименование типа товара',
    description varchar(500) COLLATE utf8mb4_unicode_ci COMMENT 'Дополнительное описание типа товара'

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Типы товара';
