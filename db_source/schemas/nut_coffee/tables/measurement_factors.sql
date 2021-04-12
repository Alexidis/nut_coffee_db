-- drop table nut_coffee.measurement_factors;
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
       (13, 5, 19000),
       (5, 13, 0.000053),
       (11, 5, 1000),
       (5, 11, 0.001),
       (13, 4, 19),
       (4, 13, 0.052632),
       (13, 4, 19),
       (10, 5, 1000),
       (5, 10, 0.001)
       ;
