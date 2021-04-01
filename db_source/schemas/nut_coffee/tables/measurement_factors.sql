-- drop table nut_coffee.measurement_factors;
CREATE TABLE nut_coffee.measurement_factors
(
    measurement_from_id bigint unsigned NOT NULL COMMENT 'id единицы измерения из которой переводим',
    measurement_to_id   bigint unsigned NOT NULL COMMENT 'id единицы измерения в которую переводим',
    factor              numeric(11, 6)  NOT NULL default 1.0 COMMENT 'Множитель для перевода из первого во второе',

    constraint ch_factor check (factor >= 0.0),
    constraint fk_measurement_factors_units_from
        FOREIGN KEY (measurement_from_id) REFERENCES nut_coffee.measurement_units (Id) ON DELETE CASCADE,
    constraint fk_measurement_factors_units_to
        FOREIGN KEY (measurement_to_id) REFERENCES nut_coffee.measurement_units (Id) ON DELETE CASCADE

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Соотношение единиц измерения для перевода';
create index measurement_factors_idx on
    nut_coffee.measurement_factors (measurement_from_id, measurement_to_id);
