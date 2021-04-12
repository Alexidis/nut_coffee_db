-- drop table nut_coffee.goods;
CREATE TABLE nut_coffee.goods
(
    id             serial          NOT NULL primary key COMMENT 'id товара',
    name           varchar(120)     NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Наименование товара',
    description    varchar(500) COLLATE utf8mb4_unicode_ci COMMENT 'Описание товара',
    purchase_price numeric(11, 2)  NOT NULL COMMENT 'Закупочная цена еденицы товара',
    measurement_id bigint unsigned NOT NULL COMMENT 'id еденицы измерения товара',
    is_ingredient  boolean                  default false comment 'Товар может являться ингредиентом рецепта',
    is_product     boolean                  default true comment 'Товар может продаваться вне рецепта',
    provider_id    bigint unsigned NOT NULL COMMENT 'id поставщика',
    created_at     datetime        not null default now() COMMENT 'Дата/время создания товара',
    renew_user     varchar(45)     not null COMMENT 'Пользователь редактирования товара',
    renew_datetime datetime COMMENT 'Дата/время изменения состояния товара',

    constraint ch_purchase_price check (purchase_price >= 0.0),
    constraint fk_goods_providers
        FOREIGN KEY (provider_id) REFERENCES nut_coffee.providers (Id) ON DELETE restrict,
    constraint fk_goods_measurement
        FOREIGN KEY (measurement_id) REFERENCES nut_coffee.measurement_units (Id) ON DELETE restrict
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Закупаемые товара';


insert into nut_coffee.goods (id, name, description, purchase_price, measurement_id, is_ingredient, is_product, provider_id, renew_user)
values
       (1, 'Эспрессо-смесь №3', '250г', 290.0, 2, true, false, 2, '79155268598'),
       (2, 'Эспрессо-смесь №5', '250г', 240.0, 2, true, false, 2, '79155268598'),
       (3, 'Бумажные тарелки ECO PLATE 230', '100 шт', 4.0, 3, false, false, 5, '79155268598'),
       (4, 'Бумажный стакан DoECO Eco cup', '500 шт', 3.0, 3, false, false, 5, '79155268598'),
       (5, 'Салфетка однослойная ECO для диспенсера', ' 12*8,5 см (17*17 см), 200 шт GDP 81211165', 79.0, 2,false, false, 5, '79155268598'),
       (6, 'Сахар белый Lavazza', '1 кг', 146.0, 6, true, false, 4, '79155268598'),
       (7, 'Корзиночка со свежей вишней', '', 62.0, 3, false, true, 3, '79155268598'),
       (8, 'Круассан с миндальным кремом', '', 65.0, 3, false, true, 3, '79155268598'),
       (9, 'Сироп Жареный орех Пралине пекан DaVinci Gourmet', '750 миллилитр', 410.0, 8, true, false, 4 , '79155268598'),
       (10, 'ОраСи Ноче грецкий орех', '1 литр', 270.0, 10, true, false, 4, '79155268598'),
       (11, 'Сироп Каштан DaVinci Gourmet Classic', '750 миллилитр', 490.0, 8, true, false, 4, '79155268598'),
       (12, 'Кристальная вода', '19 литров', 50.0, 13, true, false, 4, '79155268598'),
       (13, 'ОраСи Бариста Миндаль', '1 литр', 240.0, 10, true, false, 4, '79155268598'),
       (14, 'Корзиночка с карамелью', '', 44.0, 3, false, true, 3, '79155268598'),
       (15, 'Корзиночка с творогом', '', 44.0, 3, false, true, 3, '79155268598'),
       (16, 'Наполеон', '12шт. каждое по 100 г. ', 550.00, 3, false, true,  3, '79155268598'),
       (17, 'Бурунди Бусинде', '250г', 570.0, 2, true, false, 2, '79155268598'),
       (18, 'APPIA LIFE Nuova Simonelli STANDART WHITE 2', 'Кофемашина', 220480.0, 3, false, false,  4, '79155268598'),
       (19, 'Игнасио Урбан', '200г', 382.0, 12, true, false, 1, '79155268598'),
       (20, 'РУБИ ЭСТЕР', '200г', 467.0, 12, true, false, 1, '79155268598'),
       (21, 'БРУНО РЕНАТУ', '200г', 252.0, 12, true, false, 1, '79155268598'),
       (22, 'ОраСи Бариста Кокосовый', '1 литр', 250.0, 10, true, false, 4, '79155268598'),
       (23, 'Сироп LIQUID JOY nut brew', '750 миллилитр', 550.0, 8, true, false, 4, '79155268598'),
       (24, 'Сироп Апельсин WTS', '1 литр', 470.0, 11, true, false, 4, '79155268598');
