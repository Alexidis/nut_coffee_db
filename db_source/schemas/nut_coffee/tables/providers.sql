-- drop table nut_coffee.providers;
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


