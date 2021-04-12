drop schema if exists nut_coffee;
create schema nut_coffee
    CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

drop table if exists nut_coffee.coffee_shops;
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


insert into nut_coffee.coffee_shops (name, address, admin_first_name, admin_last_name, admin_phone)
values ('Фундук', 'г.Краснодар ул. Сормовская 43', 'Филипп', 'Синицын', 79615554321),
       ('Арахис', 'г. Краснодар ул. Строителей 7', 'Артем', 'Есинов', 79194253252),
       ('Кешью', 'г. Краснодар ул. Московская 15', 'Кирилл', 'Тартян', 79284753259);


drop table if exists nut_coffee.users;
CREATE TABLE nut_coffee.users
(
    id             serial      NOT NULL PRIMARY KEY COMMENT 'id пользователя',
    login          varchar(45) NOT NULL unique COLLATE utf8mb4_unicode_ci COMMENT 'Логин для входа',
    password       char(65)    NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Пароль для входа',
    first_name varchar(45)  COLLATE utf8mb4_unicode_ci COMMENT 'Имя пользователя',
    last_name  varchar(45)  COLLATE utf8mb4_unicode_ci COMMENT 'Фамилия пользователя',
    phone      bigint       COMMENT 'Телефон пользователя',
    coffee_shop_id bigint unsigned COMMENT 'id кофейни доступ в которую обеспечивает учетка, при отсутствии доступ дан ко всем',


    constraint fk_users_coffee_shop
        FOREIGN KEY (coffee_shop_id) REFERENCES nut_coffee.coffee_shops (id) ON DELETE CASCADE

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Пользователи';
create index users_login_idx on nut_coffee.users (login, password);

insert into nut_coffee.users (login, password, coffee_shop_id, first_name, last_name, phone)
values ('79615554321', '8ccb822da1fea4a5ed5cfad52d7c04bc9e72ad4e', 1, 'Филипп', 'Синицын', 79615554321),
       ('79194253252', '2431bbb4ca51fcc6bba8cad64515dabdfce8ce9d', 2, 'Артем', 'Есинов', 79194253252),
       ('79194524052', '7e6186199c81c011f47dbb00b4ea8a14ccd24700', 3, 'Кирилл', 'Тартян', 79194524052),
       ('79614256894', '7bd284a28273c081ffcb0616680bed9ebe139909', 2, 'Сергей', 'Перов', 79614256894),
       ('79884442233', '0f09f16e5b546b7a51dbe0326b116a46790545c1', 1, 'Владимир', 'Козин', 79884442233),
       ('79155268598', '48163d65e8cb0fcf9eb3150c88f18ea1acee1664', NULL, 'Денис', 'Смагин', 79155268598);


drop table if exists nut_coffee.clients;
CREATE TABLE nut_coffee.clients
(
    id             serial      NOT NULL PRIMARY KEY COMMENT 'id клиента',
    first_name     varchar(45) NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Имя клиента',
    phone          bigint      NOT NULL unique COMMENT 'Телефон клиента',
    note           varchar(45) COLLATE utf8mb4_unicode_ci COMMENT 'Примечание',
    created_at     datetime    not null default now() COMMENT 'Дата создания клиента',
    renew_datetime datetime COMMENT 'Дата/время изменения состояния клиента'

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Клиенты';
create index clients_phone_idx on nut_coffee.clients (phone);

INSERT INTO nut_coffee.clients (id, first_name, phone)
VALUES
    ('1', 'Bernadine', '79609356692'),
    ('2', 'Deonte', '79379349239'),
    ('3', 'Rosemary', '79360968353'),
    ('4', 'Leo', '79472993494'),
    ('5', 'Hassie', '79570380726'),
    ('6', 'Maximus', '79016483839'),
    ('7', 'Roxanne', '79771163626'),
    ('8', 'Gabe', '79047097613'),
    ('9', 'Charity', '79222614450'),
    ('10', 'Dorris', '79736861461'),
    ('11', 'Hilbert', '79614567136'),
    ('12', 'Rose', '79518923590'),
    ('13', 'Imani', '79513062659'),
    ('14', 'Janie', '79567917017'),
    ('15', 'Zelma', '79026247078'),
    ('16', 'Mackenzie', '79835718383'),
    ('17', 'Amir', '79373241012'),
    ('18', 'Ronaldo', '79645541782'),
    ('19', 'Dannie', '79583812843'),
    ('20', 'Ethyl', '79863176451'),
    ('21', 'Tressie', '79383180815'),
    ('22', 'Mackenzie', '79534757219'),
    ('23', 'Gustave', '79121240545'),
    ('24', 'Desiree', '79112377856'),
    ('25', 'Guido', '79137673761'),
    ('26', 'Oliver', '79298367661'),
    ('27', 'Tyshawn', '79351347045'),
    ('28', 'Kiel', '79712701341'),
    ('29', 'Ralph', '79914117597'),
    ('30', 'Vernie', '79746674015'),
    ('31', 'Lafayette', '79568513411'),
    ('32', 'Colby', '79240328389'),
    ('33', 'Dylan', '79135391091'),
    ('34', 'Lester', '79200174192'),
    ('35', 'Raheem', '79128786137'),
    ('36', 'Dario', '79385542601'),
    ('37', 'Cristobal', '79246796111'),
    ('38', 'Jeanie', '79436006330'),
    ('39', 'Anthony', '79452082266'),
    ('40', 'Maynard', '79377844576'),
    ('41', 'Nola', '79258693148'),
    ('42', 'Bart', '79175481935'),
    ('43', 'Rosie', '79315120331');



drop table if exists nut_coffee.measurement_units;
CREATE TABLE nut_coffee.measurement_units
(
    id   serial      NOT NULL PRIMARY KEY COMMENT 'id единицы измерения',
    name varchar(45) NOT NULL unique COLLATE utf8mb4_unicode_ci COMMENT 'Наименование единицы измерения',
    short_name varchar(45) NOT NULL unique COLLATE utf8mb4_unicode_ci COMMENT 'Наименование единицы измерения'

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Единицы измерения';

insert into nut_coffee.measurement_units (id, name, short_name)
values  (1, 'Коробки','кор'),
        (2, 'Пачка 250 г.', 'п250'),
        (3, 'Штука', 'шт'),
        (4, 'Литр', 'л'),
        (5, 'Миллилитры', 'мл'),
        (6, 'Килограмм', 'кг'),
        (7, 'Грамм', 'м'),
        (8, 'Бутылка 750 мл', 'б750'),
        (9, 'Чайная ложка', 'ч.л.'),
        (10, 'Пачка 1000 мл', 'п1'),
        (11, 'Бутылка 1000 мл', 'б1000'),
        (12, 'Пачка 200 г.', 'п200'),
        (13, 'Бутылка 19д.', 'б19');


drop table if exists nut_coffee.measurement_factors;
CREATE TABLE nut_coffee.measurement_factors
(
    measurement_from_id bigint unsigned NOT NULL COMMENT 'id единицы измерения из которой переводим',
    measurement_to_id   bigint unsigned NOT NULL COMMENT 'id единицы измерения в которую переводим',
    factor              numeric(11, 6)  NOT NULL default 1.0 COMMENT 'Коэффициент перевода из первого во второе',

    constraint fk_measurement_factors_units_from
        FOREIGN KEY (measurement_from_id) REFERENCES nut_coffee.measurement_units (Id) ON DELETE CASCADE,
    constraint fk_measurement_factors_units_to
        FOREIGN KEY (measurement_to_id) REFERENCES nut_coffee.measurement_units (Id) ON DELETE CASCADE

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Соотношение едениц измерения для перевода';


insert into nut_coffee.measurement_factors (measurement_from_id, measurement_to_id, factor)
values (2, 9, 41.6667),
       (9, 2, 0.024),
       (12, 9, 33.3333),
       (9, 12, 0.03),
       (4, 5, 1000),
       (5, 4, 0.001),
       (6, 7, 1000),
       (7, 6, 0.001),
       (8, 5, 750),
       (5, 8, 0.0013),
       (10, 8, 1000),
       (8, 10, 0.001),
       (13, 8, 19000),
       (8, 13, 0.000053),
       (11, 5, 1000),
       (5, 11, 0.001),
       (13, 4, 19),
       (4, 13, 0.052632),
       (13, 4, 19),
       (13, 4, 19),
       (13, 4, 19);


drop table if exists nut_coffee.providers;
CREATE TABLE nut_coffee.providers
(
    id             serial       NOT NULL PRIMARY KEY COMMENT 'id поставщика',
    name           varchar(45)  NOT NULL unique COLLATE utf8mb4_unicode_ci COMMENT 'Наименование поставщика',
    address        varchar(512) NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Адрес поставщика',
    note           varchar(500) COLLATE utf8mb4_unicode_ci COMMENT 'Примечание для поставщика',
    created_at     datetime     not null default now() COMMENT 'Дата/время создания поставщика',
    renew_user     varchar(45)  not null COMMENT 'Пользователь редактирования поставщика',
    renew_datetime datetime COMMENT 'Дата/время изменения состояния поставщика',
    is_archive     boolean               default false COMMENT 'Признак занесения поставщика в архив',
    archive_date   date COMMENT 'Дата установки признака архив'

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Поставщики';
create index providers_name_idx on nut_coffee.providers (name);
create index providers_address_idx on nut_coffee.providers (address);


INSERT INTO nut_coffee.providers
    (id, name, address, renew_user)
VALUES
    (1, 'Ростинг Брю', 'Москва, Переведеновский переулок, 18, стр. 15', '79155268598'),
    (2, 'Cafeto', ' Москва, Иловайская ул. 20к1', '79155268598'),
    (3, 'Кондитерская мануфактура', 'г. Москва, 5-я Кабельная ул, 10А.', '79155268598'),
    (4, 'ТЕРРИТОРИЯ КОФЕ', 'Московская область Москва ул. Правды дом 17/19 Подробнее', '79155268598'),
    (5, 'BarNeo', ' Россия, Москва, улица Сергия Радонежского, 15-17с24', '79155268598');

drop table if exists nut_coffee.goods;
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
       (12, 'Кристальная вода', '19 литров', 50.0, 12, true, false, 4, '79155268598'),
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



drop table if exists nut_coffee.recipes;
CREATE TABLE nut_coffee.recipes
(
    id             serial      NOT NULL PRIMARY KEY COMMENT 'id продаваемого рецепта',
    name           varchar(45) NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Наименование продаваемого рецепта',
    description    varchar(500) COLLATE utf8mb4_unicode_ci COMMENT 'Описание продаваемого рецепта',
    author         varchar(45) not null COMMENT 'Автор рецепта',
    created_at     datetime    not null default now() COMMENT 'Дата/время создания рецепта',
    renew_user     varchar(45) COMMENT 'Пользователь редактирования рецепта',
    renew_datetime datetime COMMENT 'Дата/время изменения рецепта'

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Рецепты';

insert into nut_coffee.recipes (id, name, description, author)
values (1, 'Капучино', 'Кофейный напиток на основе эспрессо с добавлением молочной пены', 'ADMIN'),
       (2, 'Американо', 'Разбавленный водой эспрессо', 'ADMIN'),
       (3, 'Латте', 'кофейный напиток, состоящий из молока и эспрессо', 'ADMIN'),
       (4, 'Капучино с ореховым сиропом', '', 'ADMIN'),
       (5, 'Латте с ореховым сиропом', '', 'ADMIN'),
       (6, 'Капучино с апельсиновым сиропом', '', 'ADMIN');


drop table if exists nut_coffee.recipe_ingredients;
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


drop table if exists nut_coffee.stocks;
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


drop table if exists nut_coffee.menus;
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


drop table if exists nut_coffee.clients_orders;
CREATE TABLE nut_coffee.clients_orders
(
    client_id bigint unsigned NOT NULL COMMENT 'id клиента, сделавшего заказ',
    menu_id bigint unsigned NOT NULL COMMENT 'id позиции меню которую заказ клиент',
    created_at     datetime    not null default now() COMMENT 'Дата и время заказа',

    constraint fk_clients_orders_client
        FOREIGN KEY (client_id) REFERENCES nut_coffee.clients (Id) ON DELETE restrict,
    constraint fk_clients_orders_menu
        FOREIGN KEY (menu_id) REFERENCES nut_coffee.menus (Id) ON DELETE restrict
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Заказы клиентов';


INSERT INTO nut_coffee.clients_orders (client_id, menu_id, created_at)
VALUES (26, 18, '2020-12-11 00:00:00'),
       (4, 8, '2020-03-17 00:00:00'),
       (40, 16, '2020-06-09 00:00:00'),
       (14, 16, '2020-11-02 00:00:00'),
       (4, 18, '2020-03-09 00:00:00'),
       (5, 9, '2020-10-16 00:00:00'),
       (39, 10, '2020-08-23 00:00:00'),
       (25, 13, '2020-05-21 00:00:00'),
       (29, 14, '2020-08-08 00:00:00'),
       (22, 12, '2020-10-02 00:00:00'),
       (26, 2, '2020-07-01 00:00:00'),
       (6, 1, '2020-03-06 00:00:00'),
       (43, 21, '2020-05-01 00:00:00'),
       (17, 12, '2020-11-05 00:00:00'),
       (33, 2, '2020-03-08 00:00:00'),
       (24, 5, '2020-02-19 00:00:00'),
       (42, 9, '2020-12-23 00:00:00'),
       (10, 16, '2020-02-27 00:00:00'),
       (23, 5, '2020-03-16 00:00:00'),
       (39, 7, '2020-03-29 00:00:00'),
       (7, 3, '2020-09-08 00:00:00'),
       (4, 24, '2020-08-17 00:00:00'),
       (36, 3, '2020-01-19 00:00:00'),
       (34, 4, '2020-11-04 00:00:00'),
       (13, 25, '2020-05-08 00:00:00'),
       (5, 8, '2020-12-28 00:00:00'),
       (21, 1, '2020-10-24 00:00:00'),
       (35, 21, '2020-10-27 00:00:00'),
       (15, 15, '2020-10-13 00:00:00'),
       (1, 5, '2020-05-10 00:00:00'),
       (42, 5, '2020-07-23 00:00:00'),
       (25, 21, '2020-02-12 00:00:00'),
       (27, 12, '2020-04-19 00:00:00'),
       (42, 7, '2020-03-10 00:00:00'),
       (41, 8, '2020-06-23 00:00:00'),
       (43, 10, '2020-03-26 00:00:00'),
       (13, 9, '2020-05-22 00:00:00'),
       (31, 9, '2020-07-14 00:00:00'),
       (27, 13, '2020-11-26 00:00:00'),
       (19, 13, '2020-08-29 00:00:00'),
       (36, 12, '2020-12-13 00:00:00'),
       (31, 12, '2020-03-13 00:00:00'),
       (23, 10, '2020-02-09 00:00:00'),
       (1, 12, '2020-01-08 00:00:00'),
       (34, 18, '2020-05-07 00:00:00'),
       (5, 11, '2020-09-16 00:00:00'),
       (28, 15, '2020-09-04 00:00:00'),
       (21, 24, '2020-06-17 00:00:00'),
       (39, 25, '2020-04-29 00:00:00'),
       (9, 8, '2020-12-30 00:00:00'),
       (4, 9, '2020-11-21 00:00:00'),
       (9, 23, '2020-06-22 00:00:00'),
       (17, 1, '2020-03-12 00:00:00'),
       (32, 15, '2020-05-05 00:00:00'),
       (18, 13, '2020-12-15 00:00:00'),
       (10, 20, '2020-06-12 00:00:00'),
       (33, 4, '2020-08-21 00:00:00'),
       (19, 5, '2020-03-01 00:00:00'),
       (41, 22, '2020-02-22 00:00:00'),
       (2, 10, '2020-05-29 00:00:00'),
       (2, 19, '2020-04-21 00:00:00'),
       (39, 25, '2020-08-24 00:00:00'),
       (21, 3, '2020-05-17 00:00:00'),
       (26, 8, '2020-08-15 00:00:00'),
       (30, 16, '2020-06-19 00:00:00'),
       (1, 25, '2020-11-13 00:00:00'),
       (8, 25, '2020-02-06 00:00:00'),
       (11, 20, '2020-11-27 00:00:00'),
       (29, 23, '2020-07-12 00:00:00'),
       (7, 1, '2020-09-10 00:00:00'),
       (38, 18, '2020-05-13 00:00:00'),
       (18, 11, '2020-12-08 00:00:00'),
       (18, 25, '2020-09-17 00:00:00'),
       (42, 15, '2020-08-03 00:00:00'),
       (4, 22, '2020-04-22 00:00:00'),
       (28, 24, '2020-12-25 00:00:00'),
       (8, 10, '2020-09-29 00:00:00'),
       (10, 1, '2020-10-03 00:00:00'),
       (13, 3, '2020-06-24 00:00:00'),
       (25, 14, '2020-08-28 00:00:00'),
       (36, 6, '2020-01-21 00:00:00'),
       (13, 24, '2020-03-19 00:00:00'),
       (9, 16, '2020-11-23 00:00:00'),
       (18, 5, '2020-07-24 00:00:00'),
       (31, 5, '2020-03-20 00:00:00'),
       (18, 15, '2020-07-11 00:00:00'),
       (36, 12, '2020-01-03 00:00:00'),
       (12, 14, '2020-12-24 00:00:00'),
       (1, 4, '2020-11-09 00:00:00'),
       (14, 13, '2020-08-05 00:00:00'),
       (15, 12, '2020-01-01 00:00:00'),
       (11, 4, '2020-02-11 00:00:00'),
       (20, 9, '2020-03-07 00:00:00'),
       (29, 24, '2020-04-18 00:00:00'),
       (31, 21, '2020-05-12 00:00:00'),
       (21, 1, '2020-11-14 00:00:00'),
       (34, 8, '2020-09-05 00:00:00'),
       (3, 19, '2020-10-11 00:00:00'),
       (17, 19, '2020-07-27 00:00:00'),
       (32, 24, '2020-01-28 00:00:00'),
       (24, 14, '2020-02-03 00:00:00'),
       (31, 14, '2020-10-04 00:00:00'),
       (18, 11, '2020-06-26 00:00:00'),
       (15, 8, '2020-03-23 00:00:00'),
       (27, 22, '2020-08-20 00:00:00'),
       (24, 4, '2020-06-29 00:00:00'),
       (3, 21, '2020-06-06 00:00:00'),
       (13, 14, '2020-10-25 00:00:00'),
       (30, 1, '2020-09-02 00:00:00'),
       (8, 20, '2020-09-07 00:00:00'),
       (31, 1, '2020-05-20 00:00:00'),
       (7, 6, '2020-07-10 00:00:00'),
       (3, 20, '2020-12-09 00:00:00'),
       (43, 19, '2020-08-04 00:00:00'),
       (43, 3, '2020-01-24 00:00:00'),
       (34, 8, '2020-02-18 00:00:00'),
       (11, 17, '2020-06-03 00:00:00'),
       (34, 5, '2020-01-29 00:00:00'),
       (3, 13, '2020-08-06 00:00:00'),
       (22, 12, '2020-01-16 00:00:00'),
       (10, 5, '2020-05-24 00:00:00'),
       (36, 10, '2020-01-20 00:00:00'),
       (34, 7, '2020-08-30 00:00:00'),
       (35, 3, '2020-02-28 00:00:00'),
       (14, 16, '2020-08-26 00:00:00'),
       (28, 19, '2020-12-20 00:00:00'),
       (39, 2, '2020-03-25 00:00:00'),
       (13, 10, '2020-02-23 00:00:00'),
       (32, 14, '2020-12-07 00:00:00'),
       (43, 9, '2020-09-12 00:00:00'),
       (43, 25, '2020-08-12 00:00:00'),
       (32, 3, '2020-07-04 00:00:00'),
       (8, 16, '2020-12-16 00:00:00'),
       (43, 10, '2020-05-31 00:00:00'),
       (25, 11, '2020-10-23 00:00:00'),
       (40, 24, '2020-04-24 00:00:00'),
       (4, 19, '2020-06-28 00:00:00'),
       (27, 16, '2020-07-20 00:00:00'),
       (5, 4, '2020-04-25 00:00:00'),
       (5, 11, '2020-06-13 00:00:00'),
       (38, 7, '2020-02-14 00:00:00'),
       (34, 6, '2020-03-22 00:00:00'),
       (5, 19, '2020-06-21 00:00:00'),
       (7, 24, '2020-11-11 00:00:00'),
       (24, 8, '2020-08-22 00:00:00'),
       (34, 25, '2020-06-16 00:00:00'),
       (3, 10, '2020-04-01 00:00:00'),
       (35, 14, '2020-10-31 00:00:00'),
       (16, 5, '2020-02-16 00:00:00'),
       (27, 21, '2020-09-14 00:00:00'),
       (9, 23, '2020-12-06 00:00:00'),
       (40, 7, '2020-07-06 00:00:00'),
       (43, 22, '2020-03-30 00:00:00'),
       (9, 20, '2020-12-05 00:00:00'),
       (23, 15, '2020-10-22 00:00:00'),
       (1, 11, '2020-03-02 00:00:00'),
       (9, 2, '2020-09-09 00:00:00'),
       (1, 22, '2020-12-22 00:00:00'),
       (11, 21, '2020-06-14 00:00:00'),
       (5, 22, '2020-04-23 00:00:00'),
       (21, 17, '2020-05-11 00:00:00'),
       (3, 23, '2020-11-24 00:00:00'),
       (31, 7, '2020-11-10 00:00:00'),
       (11, 4, '2020-11-28 00:00:00'),
       (21, 22, '2020-04-30 00:00:00'),
       (26, 1, '2020-10-29 00:00:00'),
       (24, 3, '2020-11-08 00:00:00'),
       (8, 13, '2020-03-24 00:00:00'),
       (6, 11, '2020-12-17 00:00:00'),
       (8, 25, '2020-03-15 00:00:00'),
       (18, 2, '2020-02-01 00:00:00'),
       (9, 17, '2020-06-15 00:00:00'),
       (35, 20, '2020-02-20 00:00:00'),
       (37, 25, '2020-05-09 00:00:00'),
       (17, 17, '2020-07-09 00:00:00'),
       (32, 21, '2020-06-20 00:00:00'),
       (37, 3, '2020-07-08 00:00:00'),
       (37, 25, '2020-07-28 00:00:00'),
       (12, 15, '2020-07-15 00:00:00'),
       (23, 22, '2020-04-15 00:00:00'),
       (14, 8, '2020-09-11 00:00:00'),
       (41, 20, '2020-08-31 00:00:00'),
       (18, 9, '2020-12-26 00:00:00'),
       (19, 9, '2020-10-14 00:00:00'),
       (18, 21, '2020-06-27 00:00:00'),
       (20, 22, '2020-08-16 00:00:00'),
       (42, 25, '2020-08-01 00:00:00'),
       (21, 10, '2020-05-02 00:00:00'),
       (16, 17, '2020-04-10 00:00:00'),
       (28, 20, '2020-02-26 00:00:00'),
       (39, 9, '2020-07-31 00:00:00'),
       (28, 21, '2020-07-17 00:00:00'),
       (21, 25, '2020-09-23 00:00:00'),
       (33, 5, '2020-03-04 00:00:00'),
       (43, 13, '2020-04-06 00:00:00'),
       (28, 12, '2020-07-07 00:00:00'),
       (19, 1, '2020-11-19 00:00:00'),
       (16, 4, '2020-09-28 00:00:00'),
       (43, 8, '2020-05-28 00:00:00'),
       (36, 17, '2020-11-03 00:00:00');


drop view if exists nut_coffee.menus_view;
create or replace view nut_coffee.menus_view as (
    select
        m.id as menu_id,
        cs.name as shop_name,
        coalesce(r.name, g.name) as product_name,
        m.price
    from nut_coffee.menus as m
    join nut_coffee.coffee_shops cs on
        m.coffee_shop_id = cs.id
    left join nut_coffee.recipes r on
        m.recipe_id = r.id
    left join nut_coffee.goods g on
        m.good_id = g.id
    order by shop_name
);

drop view if exists nut_coffee.recipes_view;
create or replace view nut_coffee.recipes_view as (
    select
        r.name as recipie_name,
        g.name as ingredient_name,
        concat_ws(' ', ri.volume, mu.short_name) as mesuare
    from nut_coffee.recipes as r
    join nut_coffee.recipe_ingredients ri on
        ri.recipe_id = r.id
    join nut_coffee.goods g on
        ri.ingredient_id = g.id
    join nut_coffee.measurement_units mu on
        ri.measurement_unit_id = mu.id
    order by r.name
);

drop view if exists nut_coffee.stocks_view;
create or replace view nut_coffee.stocks_view as (
    select
        cs.name as shop_name,
        g.name as goods_name,
        concat_ws(' ', volume, mu.name) as mesuare
    from nut_coffee.stocks as s
    join nut_coffee.coffee_shops cs on
        s.coffee_shop_id = cs.id
    join nut_coffee.goods g on
        s.good_id = g.id
    join nut_coffee.measurement_units mu on
        s.measurement_id = mu.id
    order by shop_name
);

drop trigger if exists nut_coffee.clients_renew;
create trigger nut_coffee.clients_renew
before insert on nut_coffee.clients
FOR EACH ROW
BEGIN
    set new.renew_datetime = now();
END;

drop trigger if exists nut_coffee.goods_renew;
create trigger nut_coffee.goods_renew
before insert on nut_coffee.goods
FOR EACH ROW
BEGIN
    set new.renew_user = current_user;
    set new.renew_datetime = now();
END;


drop trigger if exists nut_coffee.providers_renew;
create trigger nut_coffee.providers_renew
before insert on nut_coffee.providers
FOR EACH ROW
BEGIN
    set new.renew_user = current_user;
    set new.renew_datetime = now();
END;


drop trigger if exists nut_coffee.recipes_renew;
create trigger nut_coffee.recipes_renew
before insert on nut_coffee.recipes
FOR EACH ROW
BEGIN
    set new.renew_user = current_user;
    set new.renew_datetime = now();
END;


drop function if exists nut_coffee.remeasure;
CREATE function nut_coffee.remeasure(arg_measure_from bigint, arg_measure_to bigint)
 RETURNS decimal(11, 6) DETERMINISTIC
BEGIN
    declare v_factor decimal(11, 6);
    # функция не для использования в запросах, только для других функций
    select factor
    from nut_coffee.measurement_factors mf
    where mf.measurement_from_id = arg_measure_from and
          mf.measurement_to_id = arg_measure_to
    into v_factor;

    return v_factor;

END;


drop procedure if exists nut_coffee.make_coffee;
CREATE procedure nut_coffee.make_coffee(arg_coffee_shop_id bigint, arg_recipe_id bigint)
BEGIN

    declare v_stock_id bigint;
    declare v_new_volume decimal(11, 6) ;
    DECLARE is_end INT DEFAULT 0;

    # для всех ингредиентов продукта получаем значение которое остается на складе
    declare rec_goods cursor for (
        with ingr as (
            select
                ingredient_id,
                measurement_unit_id as mu_id,
                volume
            from nut_coffee.recipe_ingredients
            where recipe_id = arg_recipe_id
        )
        select
            id,
            (s.volume - ingr.volume * nut_coffee.remeasure(mu_id, s.measurement_id))
        from nut_coffee.stocks s
        join ingr on ingr.ingredient_id = s.good_id
        where coffee_shop_id = arg_coffee_shop_id
    );
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;

    open rec_goods;
    # в цикле ходим по курсору
    cycle: loop
        # из курсора получаем ид товарного запаса и новое значение
        fetch rec_goods into v_stock_id, v_new_volume;
        IF is_end THEN LEAVE cycle; END IF;
#         SIGNAL SQLSTATE '42927' SET MESSAGE_TEXT = v_new_volume;
        # если новый объем на складе больше 0, то обновляем складские запасы
        if v_new_volume > 0 then
            update nut_coffee.stocks
            set volume = v_new_volume
            where id = v_stock_id;
        # если объем запаса меньше или равен 0 то удаляем запасы со склада
        else
            delete from nut_coffee.stocks
            where id = v_stock_id;
        end if;

    end loop cycle;

    close rec_goods;

END;

