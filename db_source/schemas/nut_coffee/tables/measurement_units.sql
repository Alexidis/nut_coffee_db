-- drop table nut_coffee.measurement_units;
CREATE TABLE nut_coffee.measurement_units
(
    id   serial      NOT NULL PRIMARY KEY COMMENT 'id единицы измерения',
    name varchar(45) NOT NULL unique COLLATE utf8mb4_unicode_ci COMMENT 'Наименование единицы измерения'

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Единицы измерения';
