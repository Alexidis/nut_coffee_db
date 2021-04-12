-- drop table nut_coffee.measurement_units;
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
        (8, 'Бутылка 750 мл', 'б_750'),
        (9, 'Чайная ложка', 'ч.л.'),
        (10, 'Пачка 1000 мл', 'п1'),
        (11, 'Бутылка 1000 мл', 'б_1000'),
        (12, 'Пачка 200 г.', 'п200'),
        (13, 'Бутылка 19 л.', 'б_19');
